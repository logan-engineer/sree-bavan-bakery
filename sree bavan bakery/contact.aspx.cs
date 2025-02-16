using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sree_bavan_bakery
{
    public partial class contact1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;
          
            con.Open();
            SqlCommand cmd = new SqlCommand("save_feedback", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action","insert");
            cmd.Parameters.AddWithValue("@Name", txt_Name.Text.Trim());
            cmd.Parameters.AddWithValue("@Email",txt_Email.Text.Trim());
            cmd.Parameters.AddWithValue("@Subject",txt_Subject.Text.Trim());
            cmd.Parameters.AddWithValue("@Message",txt_Message.Text.Trim());
            int i= cmd.ExecuteNonQuery();
           
            if (i!= 0)
            {
                Response.Write("<script>alert('your feedback send successfully')</script>");
                lblmsg.Visible = true;
                lblmsg.Text = "with in 24 hours solve your problem";
                lblmsg.CssClass = "alert alert-success";
                clear();
                con.Close();
            }
            else
            {
                Response.Write("<script>alert('your feedback send not successfully')</script>");
            }
        }
        void clear()
        {
            txt_Name.Text = string.Empty;
            txt_Email.Text = string.Empty;
            txt_Subject.Text = string.Empty;
            txt_Message.Text = string.Empty;
        }
    }
}