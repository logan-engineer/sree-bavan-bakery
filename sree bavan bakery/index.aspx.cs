using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace sree_bavan_bakery
{
    public partial class index : System.Web.UI.Page
    {
       
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                discount();
                if (Session["Name"]!=null)
                {
                    Session["entrylink"] = "logout.aspx";
                    Session["entryname"] = "logout";
                    if (Session["Admin"] == "check")
                    { 
                        LinkButton1.Visible = true;
                    }
                    
                }
                else
                {
                    Session["entrylink"] = "login.aspx";
                    Session["entryname"] = "login";
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpage.aspx");
        }
        void discount()
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();
            {
                SqlCommand cmd = new SqlCommand("count_table", con);
                cmd.Parameters.AddWithValue("@action", "discount");
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                lbl_Discount.Text = ds.Tables[0].Rows[0][0].ToString();

            }
            con.Close();
        }  
    }
}