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
    public partial class useraccount : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                {
                

                if (Session["Name"]==null)
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    if (Session["Admin"] == "check")
                    {
                        Response.Write("This is Admin");
                        //getadmin();
                    }
                    else
                    {
                        string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

                        SqlConnection con = new SqlConnection();

                        con.ConnectionString = fetchDBDetails;

                        con.Open();

                        SqlCommand cmd = new SqlCommand("fetch_data_user", con);
                        cmd.Parameters.AddWithValue("@name", Session["Name"]);

                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();

                        da.Fill(ds);
                        Session["Id"] = ds.Tables[0].Rows[0][0].ToString();

                        Session["Address"] = ds.Tables[0].Rows[0][2].ToString();
                        Session["Phone"] = ds.Tables[0].Rows[0][3].ToString();
                        Session["Email"] = ds.Tables[0].Rows[0][4].ToString();

                        DataBind();



                        con.Close();
                        getperchasehistry();
                    }
                   
                }

            }
        }
        void getperchasehistry()
        {
            int sr = 1;
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();

            SqlCommand cmd = new SqlCommand("invoice", con);
            cmd.Parameters.AddWithValue("@action", "codhistory");

            cmd.Parameters.AddWithValue("@userid", Convert.ToInt32(Session["Id"]));

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd); ;
            DataTable ds = new DataTable();

            da.Fill(ds);
            ds.Columns.Add("srno", typeof(Int32));
            if(ds.Rows.Count > 0)
                {
                foreach (DataRow dataRow in ds.Rows)
                {
                    dataRow ["srno"] = sr;
                    sr++;
                }
            }

            if (ds.Rows.Count > 0)

            {


                Repeater1.DataSource = ds;
                Repeater1.DataBind();
                con.Close();
            }
            else
            {
                Repeater1.FooterTemplate = new CustomTemplate(ListItemType.Footer);
            }


        }
        private sealed class CustomTemplate : ITemplate
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
                    var footer = new LiteralControl("<tr><td><b>hungry!why not order food for you</b><a href='menu.aspx' class='badge badge-info ml-2'>click to order</a></td></tr></tbody></table>");
                    container.Controls.Add(footer);
                }
            }
        }
        protected void getadmin()
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();

            SqlCommand cmd = new SqlCommand("fetch_Admin", con);
            cmd.Parameters.AddWithValue("@name", Session["Name"]);

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            da.Fill(ds);
            Session["Id"] = ds.Tables[0].Rows[0][0].ToString();

            Session["Address"] = ds.Tables[0].Rows[0][2].ToString();
            Session["Phone"] = ds.Tables[0].Rows[0][3].ToString();
            Session["Email"] = ds.Tables[0].Rows[0][4].ToString();

            DataBind();



            con.Close();
        }

       

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            double grandtotal = 0;

            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();
            HiddenField paymentid = e.Item.FindControl("hdpaymentid") as HiddenField;
            string pay = paymentid.Value;

            Repeater reporder = e.Item.FindControl("rorder") as Repeater;
            SqlCommand cmd = new SqlCommand("ordertable", con);

            cmd.Parameters.AddWithValue("@paymentid", Convert.ToInt32(pay));

            cmd.Parameters.AddWithValue("@userid", Convert.ToInt32(Session["Id"]));

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd); ;
            DataTable ds = new DataTable();

            da.Fill(ds);

            if (ds.Rows.Count != 0)
            {
                foreach (DataRow dataRow in ds.Rows)
                {
                    grandtotal += Convert.ToDouble(dataRow["totalprice"]);

                }
            }

            if (ds.Rows.Count != 0)

            {
                DataRow dr = ds.NewRow();
                dr["totalprice"] =grandtotal;
                ds.Rows.Add(dr);

                reporder.DataSource = ds;
                reporder.DataBind();

            }
            else
            {
                Repeater1.FooterTemplate = new CustomTemplate(ListItemType.Footer);
            }
        }
    }
}