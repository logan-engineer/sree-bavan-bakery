using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

namespace sree_bavan_bakery
{
    public partial class adminpage : System.Web.UI.Page
    {
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
                    gvbind();
                }


            }
        }

        protected void gvbind()
        {
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;
       
            SqlConnection con = new SqlConnection();
           
            con.ConnectionString = fetchDBDetails;

            con.Open();
           
            SqlCommand cmd = new SqlCommand("fetch_data", con);
        
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            da.Fill(ds);
           
            Repeater2.DataSource = ds.Tables[0];
            DataBind();



            con.Close();

        }
        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            Label ID = e.Item.FindControl("lblid") as Label ;
           
            if (e.CommandName == "Remove")
            {
                try
                {
                    string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

                    SqlConnection con = new SqlConnection();

                    con.ConnectionString = fetchDBDetails;

                    con.Open();
                    
                    SqlCommand cmd = new SqlCommand("delete from customerdetails where id=" + Convert.ToInt32(ID.Text) +"", con);
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Write("<script>alert('delete successfully')</script>");
                     
                        gvbind();
                    }




                }
                catch (Exception ex)
                {

                    Response.Write("<script>alert('Error-" + ex.Message + "');</script>");
                }

            }
           
        }
        //protected void btn_fetch_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;
        //        //  public string fetchDBDetails = @"Data Source=DESKTOP-O9DEBFH\SQLEXPRESS;Initial Catalog = snacks; Integrated Security = True";
        //        SqlConnection con = new SqlConnection();
        //        // str = @"Data Source=DESKTOP-O9DEBFH\SQLEXPRESS;Initial Catalog=snacks;Integrated Security=True";
        //        // con = new SqlConnection();
        //        con.ConnectionString = fetchDBDetails;

        //        con.Open();
        //        System.Windows.Forms.MessageBox.Show("connection successfully");
        //        SqlCommand cmd = new SqlCommand("fetch_data", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        DataSet ds = new DataSet();

        //        da.Fill(ds);
        //        GridView1.DataSource = ds.Tables[0];
        //        DataBind();



        //        con.Close();


        //    }
        //    catch (Exception ex)
        //    {
        //        System.Windows.Forms.MessageBox.Show("Not connected");
        //    }

        //}

        //protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    GridView1.EditIndex = e.NewEditIndex;
        //    gvbind();
        //}
      

        //protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    int ID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        //    string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

        //    SqlConnection con = new SqlConnection();

        //    con.ConnectionString = fetchDBDetails;

        //    con.Open();
        //    System.Windows.Forms.MessageBox.Show("connection successfully");
        //    SqlCommand cmd = new SqlCommand("delete from customerdetails where id='"+ID+"' ", con);
        //    int i = cmd.ExecuteNonQuery();
        //    if (i > 0)
        //    {
        //        Response.Write("<script>alert('delete successfully')</script>");
        //        GridView1.EditIndex = -1;
        //        gvbind();
        //    }
        //}

        //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}
       

        //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{


        //    int ID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        //    string NAME = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
        //    string PWD = ((TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
        //    string ADDRESS = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        //    string EMAIL = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
        //    string PHONE = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
        //    string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

        //        SqlConnection con = new SqlConnection();

        //        con.ConnectionString = fetchDBDetails;

        //        con.Open();
        //        System.Windows.Forms.MessageBox.Show("connection successfully");
        //        SqlCommand cmd = new SqlCommand("update customerdetails set name='" + NAME + "',address='" + ADDRESS + "',phone='" + PHONE + "',email='" + EMAIL + "',password='" + PWD + "' where id='" + ID + "' ", con);

        //        int i = cmd.ExecuteNonQuery();
        //        if (i > 0)
        //        {
        //            Response.Write("<script>alert('update successfully')</script>");
        //            GridView1.EditIndex = -1;
        //            gvbind();
        //        }
          
        //}

        //protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        //{

        //}
    } 
}