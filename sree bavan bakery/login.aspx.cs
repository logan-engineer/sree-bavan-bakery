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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {

            try
            {
                string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

                SqlConnection con = new SqlConnection();

                con.ConnectionString = fetchDBDetails;

                con.Open();
                if (chk_Admin.Checked)
                {


                    SqlCommand cmd1 = new SqlCommand("Admin_validate", con);

                    SqlParameter param3 = new SqlParameter("@username", SqlDbType.VarChar);
                    cmd1.Parameters.Add(param3).Value = txt_UserName.Text;

                    SqlParameter param4 = new SqlParameter("@password", SqlDbType.VarChar);
                    cmd1.Parameters.Add(param4).Value = txt_Password.Text;

                    cmd1.CommandType = CommandType.StoredProcedure;
                    int j = cmd1.ExecuteNonQuery();
                    SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                    DataSet ds1 = new DataSet();
                    da1.Fill(ds1);

                    string k = ds1.Tables[0].Rows[0][1].ToString();
                    string l = ds1.Tables[0].Rows[0][0].ToString();


                    if (k == txt_UserName.Text)
                    {

                        Response.Write("<script>alert('welcom " + k + "');</script>");

                        Session["Name"] = txt_UserName.Text;
                        Session["Id"] = l;
                        Session["Admin"] = "check";
                        Response.Redirect("index.aspx");
                    }
                    else
                        Response.Write("<script>alert('enter valid password or username')</script>");
                }

                else
                {

                    SqlCommand cmd = new SqlCommand("login_validate", con);

                    SqlParameter param1 = new SqlParameter("@username", SqlDbType.VarChar);
                    cmd.Parameters.Add(param1).Value = txt_UserName.Text;

                    SqlParameter param2 = new SqlParameter("@password", SqlDbType.VarChar);
                    cmd.Parameters.Add(param2).Value = txt_Password.Text;

                    cmd.CommandType = CommandType.StoredProcedure;
                    int i = cmd.ExecuteNonQuery();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    string p = ds.Tables[0].Rows[0][1].ToString();
                    string s = ds.Tables[0].Rows[0][0].ToString();

                    con.Close();
                    if (p == txt_UserName.Text)
                    {

                        Response.Write("<script>alert('welcom " + p+ " ');</script>");

                        Session["Name"] = txt_UserName.Text;
                        Session["Id"] = s;
                        Response.Redirect("index.aspx");
                    }
                    else
                        Response.Write("<script>alert('enter valid password or username')</script>");
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('enter valid password or username')</script>");
            }
        }
    }
}