using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sree_bavan_bakery
{
    public partial class cart : System.Web.UI.Page
    {
        private decimal grandTotal;

        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Id"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    getCartItems();
                }
                    
            }
        }
        void getCartItems()
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();

            SqlCommand cmd = new SqlCommand("fetch_crud", con);
            cmd.Parameters.AddWithValue("@action", "select");
            
            cmd.Parameters.AddWithValue("@userid", Convert.ToInt32(Session["Id"]));

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd); ;
            DataSet ds = new DataSet();

            da.Fill(ds);
           
            if (ds.Tables[0].Rows.Count > 0)
                
            {
               

                Repeater2.DataSource = ds;
                Repeater2.DataBind();
                cartCount();

            }
            else
            {
                Repeater2.FooterTemplate = new CustomTemplate(ListItemType.Footer);
            }
          
        
        }

        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            TextBox quantity = e.Item.FindControl("txtQuantity") as TextBox;
            utils Utils = new utils();
            if (e.CommandName == "Remove")
            {
                try
                {
                    string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

                SqlConnection con = new SqlConnection();

                con.ConnectionString = fetchDBDetails;

                con.Open();

                SqlCommand cmd = new SqlCommand("fetch_crud", con);
                cmd.Parameters.AddWithValue("@action", "delete");
                cmd.Parameters.AddWithValue("@productid",Convert.ToInt32(e.CommandArgument));
                cmd.Parameters.AddWithValue("@userid", Convert.ToInt32(Session["Id"]));

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('delete successfully')</script>");
                   
                    getCartItems();
                   
                    con.Close();




                }
                catch (Exception ex)
                {
                 
                 Response.Write("<script>alert('Error-" + ex.Message + "');</script>");
                }
               
            }
            if (e.CommandName == "updatecart")
            {
             
                Utils.updateCartQuantity(Convert.ToInt32(e.CommandArgument), Convert.ToInt32(quantity.Text), Convert.ToInt32(Session["Id"]));

               
                getCartItems();
            }
            if (e.CommandName == "checkout")
            {
               
                    if (Session["Id"] != null)
                    {
                        Response.Redirect("payment.aspx");
                    }
                    else
                    {
                        Response.Redirect("login.aspx"); 
                    }

                
            }
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType== ListItemType.Item|| e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label totalprice = e.Item.FindControl("lbltotalprice") as Label;
                Label productprice = e.Item.FindControl("lblprice") as Label;
                TextBox quantity = e.Item.FindControl("txtQuantity") as TextBox;
                decimal caltotalprice=Convert.ToDecimal(productprice.Text) * Convert.ToDecimal(quantity.Text);
                totalprice.Text =  caltotalprice.ToString();
                grandTotal += caltotalprice;
               
            }
            Session["grandtotalprice"] = grandTotal;

        }
        private sealed class CustomTemplate:ITemplate
        {
            private ListItemType ListItemType { get; set; }
            public CustomTemplate(ListItemType type)
            {
                ListItemType = type;
            }
            public void InstantiateIn(Control container)
            {
                if (ListItemType == ListItemType.Footer)
               {
                   var footer = new LiteralControl("<tr><td colspan='5'><b>your cart is empty</b><a href='menu.aspx' class='badge badge-info ml-2'>continue shopping</a></td></tr></tbody></table>");
                   container.Controls.Add(footer);
               }
            }
        }
        void cartCount()
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();

            SqlCommand cmd = new SqlCommand("count_table", con);
            cmd.Parameters.AddWithValue("@action", "cart");

            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["Id"]));

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd); ;
            DataTable ds = new DataTable();

            da.Fill(ds);
            Session["cartcount"] = Convert.ToString(ds.Rows[0][0]);


        }
    }
}