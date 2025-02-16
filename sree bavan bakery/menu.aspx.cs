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
    public partial class menu : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

               
                gvbind();
            }
        }
        protected void gvbind()
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();

            SqlCommand cmd = new SqlCommand("fetch_productdetails", con);

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);;
            DataSet ds = new DataSet();

            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int i;
                for (i = 0; ds.Tables[0].Rows.Count > i; i++)
                {
                    Repeater1.DataSource = ds.Tables[0];

                    DataBind();
                }
               
            }







            con.Close();

        }

       protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (Session["Id"]!=null)
            {
                 bool isCartItemUpdated = false;
                 int i = isItemExitInCard(Convert.ToInt32(e.CommandArgument));
                int q = 1;
                if (i==0)
                 {
                   
                    string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

                    SqlConnection con = new SqlConnection();

                    con.ConnectionString = fetchDBDetails;
             
                    con.Open();

                    SqlCommand cmd = new SqlCommand("fetch_crud", con);
                    cmd.Parameters.AddWithValue("@action", "insert");
                    cmd.Parameters.AddWithValue("@productid", Convert.ToInt32(e.CommandArgument));
                    cmd.Parameters.AddWithValue("@quantity", q);
                    cmd.Parameters.AddWithValue("@userid", Convert.ToInt32(Session["Id"]));

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
               
                    lblmsg.Visible = true;
                    lblmsg.Text = "Item added successfully in your cart,";
                    lblmsg.CssClass = "alert alert-success";
                    Response.AddHeader("REFRESH", "q;URL=cart.aspx");

                }

                else
                {
                    utils Utils = new utils();
                    isCartItemUpdated = Utils.updateCartQuantity( Convert.ToInt32(e.CommandArgument), i + q, Convert.ToInt32(Session["Id"]));
                   
               }
               
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
        int isItemExitInCard(int productid)
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();

            SqlCommand cmd = new SqlCommand("fetch_crud", con);
            cmd.Parameters.AddWithValue("@action", "getbyid");
            cmd.Parameters.AddWithValue("@productid", productid);
            cmd.Parameters.AddWithValue("@userid", Session["Id"]);

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd); ;
            DataSet ds = new DataSet();

            da.Fill(ds);
            int quantity = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                quantity = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            return quantity;
        }
    }
    
}