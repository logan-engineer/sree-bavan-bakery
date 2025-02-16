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
namespace sree_bavan_bakery
{
    public partial class customerdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();
            {
                SqlCommand cmd = new SqlCommand("count_customer", con);

                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                Label1.Text = ds.Tables[0].Rows[0][0].ToString();

            }
            con.Close();
            totalcost();
            totalitem();
            totalemployee();
            totalfeedback();
            totalorder();

        }
        void totalitem()
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();
            {
                SqlCommand cmd = new SqlCommand("count_table", con);
                cmd.Parameters.AddWithValue("@action", "item");
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                lbl_Item.Text = ds.Tables[0].Rows[0][0].ToString();

            }
            con.Close();
        }
        void totalfeedback()
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();
            {
                SqlCommand cmd = new SqlCommand("count_table", con);
                cmd.Parameters.AddWithValue("@action", "feedback");
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                lbl_Feedback.Text = ds.Tables[0].Rows[0][0].ToString();

            }
            con.Close();
        }
        void totalorder()
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();
            {
                SqlCommand cmd = new SqlCommand("count_table", con);
                cmd.Parameters.AddWithValue("@action", "order");
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                lbl_Order.Text = ds.Tables[0].Rows[0][0].ToString();

            }
            con.Close();
        }
        void totalemployee()
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();
            {
                SqlCommand cmd = new SqlCommand("count_table", con);
                cmd.Parameters.AddWithValue("@action", "employee");
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                lbl_Employee.Text = ds.Tables[0].Rows[0][0].ToString();

            }
            con.Close();
        }
        void totalcost()
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();
            {
                SqlCommand cmd = new SqlCommand("count_table", con);
                cmd.Parameters.AddWithValue("@action", "totalcost");
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                lbl_Total.Text = ds.Tables[0].Rows[0][0].ToString();

            }
            con.Close();
        }

        protected void btn_Discount_Click(object sender, EventArgs e)
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();
            {
                SqlCommand cmd1 = new SqlCommand("delete from discount", con);
                int j = cmd1.ExecuteNonQuery();
                SqlCommand cmd = new SqlCommand("insert into discount (discount) values (" + Convert.ToInt32(txt_Discount.Text) + ")", con);
                int i = cmd.ExecuteNonQuery();

            }
        }
        
    
       
        
    }
}