using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace sree_bavan_bakery
{
    public partial class updatepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

                SqlConnection con = new SqlConnection();

                con.ConnectionString = fetchDBDetails;

                con.Open();

                SqlCommand cmd = new SqlCommand("password_update", con);

                SqlParameter param1 = new SqlParameter("@password", SqlDbType.VarChar);
                SqlParameter param2 = new SqlParameter("@email", SqlDbType.VarChar);
                cmd.Parameters.Add(param1).Value = txt_Newpassword.Text;
                cmd.Parameters.Add(param2).Value = Session["emailid"];
                cmd.CommandType = CommandType.StoredProcedure;
                int i =cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Write("<script>alert('update password successfully');</script>");
                    Response.Redirect("login.aspx");
                }
                else { Response.Write("<script>alert('update password not updated try again...!');</script>"); }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error-" + ex.Message + "');</script>");
            }

        }
        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("login.aspx");
        }
    }
}