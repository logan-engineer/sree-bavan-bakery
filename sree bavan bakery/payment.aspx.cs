using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sree_bavan_bakery
{
    public partial class payment : System.Web.UI.Page
    {
        int orderid,cardid;
        string status;
        DataTable dt;
        SqlDataReader dr,dr1;
        SqlTransaction transaction = null;
        string _name=string.Empty; string _cardno = string.Empty; string _expdate = string.Empty; string _cvv = string.Empty;
        string _address = string.Empty; string _paymentmode = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

       
        void orderPayment(string name,string cardno,string expdate,string cvv,string address,string paymentmode)
        {
            int paymentid; int productid; int quantity;decimal totalcost = Convert.ToDecimal(Session["grandtotalprice"]);


            dt =new DataTable();
            dt.Columns.AddRange(new DataColumn[7]
            {
               new DataColumn("orderno",typeof(string)),
               new DataColumn("productid",typeof(int)),
               new DataColumn("quantity",typeof(int)),
               
               new DataColumn("userid",typeof(int)),
               new DataColumn("status",typeof(string)),
               new DataColumn("paymentid",typeof(int)),
               new DataColumn("orderdate",typeof(DateTime)),
            });
            try
            {
                string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;
            
            con.Open();
            #region sql transaction
            transaction = con.BeginTransaction();


                
                SqlCommand cmd = new SqlCommand("save_payment", con,transaction);
               
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Cardno", cardno);
                cmd.Parameters.AddWithValue("@Expdate", expdate);
                cmd.Parameters.AddWithValue("@Cvvno", cvv);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@Paymentmode", paymentmode);
                cmd.CommandType = CommandType.StoredProcedure;
                int i = cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd); ;
                DataTable ds = new DataTable();

                da.Fill(ds);

               
                if (i != null)
                {
                    Response.Write("<script>alert('save payment ok')</script>");
                }
                else
                {
                    Response.Write("<script>alert('save payment not ok')</script>");
                }

                paymentid = Convert.ToInt32(ds.Rows[0][0]);
                #region getting cart item's
                SqlCommand cmd1 = new SqlCommand("fetch_crud", con,transaction);

                cmd1.Parameters.AddWithValue("@action", "select");

                cmd1.Parameters.AddWithValue("@userid", Convert.ToInt32(Session["Id"]));

                cmd1.CommandType = CommandType.StoredProcedure;

                dr = cmd1.ExecuteReader();
              
                while (dr.Read())
                {
                    productid = (int)dr["productid"];
                    quantity = (int)dr["cqty"];
                    upDateQuantity(productid, quantity, transaction);
                    deleteCartItem(productid, transaction);
                    dt.Rows.Add(utils.getUniqueId(), productid, quantity, Convert.ToInt32(Session["Id"]), "Pending", paymentid,DateTime.Now);
                }
              dr.Close();
                #endregion getting cart item's
                #region Order details
                if(dt.Rows.Count !=0)
                {

                    SqlCommand cmd2 = new SqlCommand("save_order", con, transaction);
                    cmd2.Parameters.AddWithValue("@tblOrders", dt);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.ExecuteNonQuery();
                    SqlDataAdapter da1 = new SqlDataAdapter(cmd);
                    DataSet ds1 = new DataSet();
                    da1.Fill(ds1);
                    orderid = Convert.ToInt32(ds1.Tables[0].Rows[0][0]);
                    cardid = paymentid;
                    status = "pending";
                   
                }
                #endregion Order details
                #region Adminorder details
                SqlCommand cmd3 = new SqlCommand("save_adminorder", con, transaction);
                cmd3.Parameters.AddWithValue("@Orderid", orderid);
                cmd3.Parameters.AddWithValue("@Cardid", cardid);
                cmd3.Parameters.AddWithValue("@Status", status);
                cmd3.Parameters.AddWithValue("@totalcost", totalcost);

                cmd3.CommandType = CommandType.StoredProcedure;
                cmd3.ExecuteNonQuery();
                #endregion Adminorder details
                transaction.Commit();
                lblmsg.Visible = true;
                lblmsg.Text = "your item order successfully...!";
                lblmsg.CssClass = "alert alert-success";
                Response.AddHeader("REFRESH", "1;URL=invoice.aspx?id" + paymentid);
                con.Close();
            }
            catch (Exception ex)
            {
                try
                {
                    transaction.Rollback();
                }
                catch(Exception e)
                {
                    Response.Write("<script>alert('Error-" + ex.Message + "');</script>");
                }

                #endregion sql transaction
            }
           
        }
        void upDateQuantity(int _productid, int _quantity,SqlTransaction sqlTransaction)
        {
            int dbQuantity;
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();

            SqlCommand cmd = new SqlCommand("crud_productdetails", con,transaction);

            
            cmd.Parameters.AddWithValue("@action", "getbyid");
            cmd.Parameters.AddWithValue("@productid",Convert.ToInt32(_productid));
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                dr1 = cmd.ExecuteReader();
                while (dr1.Read())
                {

                    dbQuantity = (int)dr1["Quantity"];
                    if(dbQuantity>_quantity && dbQuantity > 2)
                    {
                        dbQuantity = dbQuantity - _quantity;
                        SqlCommand cmd1 = new SqlCommand("crud_productdetails", con);
                      
                        cmd1.CommandType = CommandType.StoredProcedure;
                        cmd1.Parameters.AddWithValue("@action", "update");
                        cmd1.Parameters.AddWithValue("@quantity", dbQuantity);
                        cmd1.Parameters.AddWithValue("@productid", _productid);
                        cmd1.ExecuteNonQuery();
                    }

                }
                dr1.Close();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Error-" + ex.Message + "');</script>");
            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
             _name = txtname.Text.Trim();
             _cardno = txtcardno.Text.Trim();
             _cardno = string.Format("************{0}", txtcardno.Text.Trim().Substring(12, 4));
             _expdate = txtexpmonth.Text.Trim() + "/" + txtexpyear.Text.Trim();
             _cvv = txtcvv.Text.Trim();
             _address = txtaddress.Text.Trim();
             _paymentmode = "card";                          
             if (Session["Id"] != null)
              {
                orderPayment(_name, _cardno, _expdate, _cvv,_address, _paymentmode);
             }
             else
             {
                 Response.Redirect("login.aspx");
             }
        }

        void deleteCartItem(int _productid, SqlTransaction sqlTransaction)
        {

            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();

            SqlCommand cmd = new SqlCommand("fetch_crud", con, transaction);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "delete");
            cmd.Parameters.AddWithValue("@productid", _productid);
            cmd.Parameters.AddWithValue("@userid", Convert.ToInt32(Session["Id"]));
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error-" + ex.Message + "');</script>");
            }
            con.Close();
        }
       

    }
}