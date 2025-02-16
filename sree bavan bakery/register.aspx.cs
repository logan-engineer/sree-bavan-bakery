using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Security.Cryptography;


namespace sree_bavan_bakery
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

     

        protected void txt_Address_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;
              
                SqlConnection con = new SqlConnection();
                con.ConnectionString = fetchDBDetails;
                con.Open();
               
                SqlCommand cmd = new SqlCommand("insert_register", con);

                SqlParameter param1 = new SqlParameter("@UserName", SqlDbType.VarChar);
                cmd.Parameters.Add(param1).Value = txt_UserName.Text;

                SqlParameter param2 = new SqlParameter("@Password", SqlDbType.VarChar);
                cmd.Parameters.Add(param2).Value = txt_Password.Text;

                SqlParameter param3 = new SqlParameter("@Address", SqlDbType.VarChar);
                cmd.Parameters.Add(param3).Value = txt_Address.Text;

                SqlParameter param4 = new SqlParameter("@Email", SqlDbType.VarChar);
                cmd.Parameters.Add(param4).Value = txt_Email.Text;

                SqlParameter param5 = new SqlParameter("@Phone", SqlDbType.VarChar);
                cmd.Parameters.Add(param5).Value = txt_Phone.Text;




                cmd.CommandType = CommandType.StoredProcedure;
                

               
               int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                   
                    Response.Redirect("login.aspx");
                    Response.Write("<script>alert('register sucessfully')</script>");
                }

                   
              

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('something went wrong')</script>");
            }
            txt_UserName.Text = "";
            txt_Password.Text = "";
            txt_Address.Text = "";
            txt_Email.Text = "";
            txt_Phone.Text="";
        }
    }
}