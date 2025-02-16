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
    public partial class employeedetails : System.Web.UI.Page
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

            SqlCommand cmd = new SqlCommand("fetch_employeedetails", con);

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                GridView1.DataSource = ds.Tables[0];
                DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = ds.Tables[0].Columns.Count;
                GridView1.Rows[0].Cells[0].Text = "no data found.....!";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }





            con.Close();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void InkBtnEdit(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            gvbind();
        }



        protected void InkBinCancel(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            gvbind();
        }

        protected void InkBtnDelete(object sender, GridViewDeleteEventArgs e)
        {
            int ID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();
            System.Windows.Forms.MessageBox.Show("connection successfully");
            SqlCommand cmd = new SqlCommand("delete from employeedetails where id='" + ID + "' ", con);
            cmd.ExecuteNonQuery();


            Response.Write("<script>alert('delete successfully')</script>");
            GridView1.EditIndex = -1;
            gvbind();

        }

        protected void Inkitnupdate(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;
            GridViewRow row = GridView1.Rows[index] as GridViewRow;
            TextBox Id = GridView1.Rows[e.RowIndex].FindControl("txt_Id") as TextBox;
            TextBox Name = GridView1.Rows[e.RowIndex].FindControl("txt_Name") as TextBox;
            TextBox Position = GridView1.Rows[e.RowIndex].FindControl("txt_Position") as TextBox;
            TextBox Mobile = GridView1.Rows[e.RowIndex].FindControl("txt_Mobile") as TextBox;
            TextBox Email = GridView1.Rows[e.RowIndex].FindControl("txt_Email") as TextBox;
            TextBox Address = GridView1.Rows[e.RowIndex].FindControl("txt_Address") as TextBox;
            TextBox Joindate = GridView1.Rows[e.RowIndex].FindControl("txt_Joindate") as TextBox;
            TextBox Status= GridView1.Rows[e.RowIndex].FindControl("txt_Status") as TextBox;
            FileUpload fu = row.FindControl("fu1") as FileUpload;

            if (fu != null && fu.HasFile)
            {

                string file = System.IO.Path.Combine(Server.MapPath("~/img/employee"), fu.FileName);
                fu.SaveAs(file);
            }
            else
            {
                Response.Write("<script>alert('file not selected')</script>");
            }
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;


            //updating the record
            SqlCommand cmd = new SqlCommand("Update employeedetails set  name='" + Name.Text + "',position='" + Position.Text + "',mobile='" + Mobile.Text + "',email='" + Email.Text + "',address='" + Address.Text + "'," +
                "joindate='" + Joindate.Text + "',image = '" + fu.FileName + "',status = '" + Status.Text + "' where id='" + Convert.ToInt32(Id.Text) + "'", con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                Response.Write("<script>alert('data update successfully')</script>");
                GridView1.EditIndex = -1;
                gvbind();
            }






        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName.Equals("insert"))
            {
                try
                {


                    // if (this.FileUpload1.HasFile)
                    // {
                    //      string fileName = Path.GetFileName(FileUpload1.FileName);
                    //      FileUpload1.SaveAs(Server.MapPath("img/") + fileName);
                    // } 



                    string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

                    SqlConnection con = new SqlConnection();

                    con.ConnectionString = fetchDBDetails;





                    con.Open();
                    string query = "INSERT INTO employeedetails (name,position,mobile,email,address,image, joindate,status) VALUES (@name, @position,@mobile, @email,@address,@image, @joindate,@status)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", (GridView1.FooterRow.FindControl("txtId") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@name", (GridView1.FooterRow.FindControl("txtName") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@position", (GridView1.FooterRow.FindControl("txtPosition") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@mobile", (GridView1.FooterRow.FindControl("txtMobile") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@email", (GridView1.FooterRow.FindControl("txtEmail") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@address", (GridView1.FooterRow.FindControl("txtAddress") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@image", (GridView1.FooterRow.FindControl("fileupload") as FileUpload).FileName.Trim());
                    cmd.Parameters.AddWithValue("@joindate", (GridView1.FooterRow.FindControl("txtJoindate") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@status", (GridView1.FooterRow.FindControl("txtStatus") as TextBox).Text.Trim());
                   
                    FileUpload file = GridView1.FooterRow.FindControl("fileupload") as FileUpload;
                    if (file != null && file.HasFile)
                    {

                        string File = System.IO.Path.Combine(Server.MapPath("~/img/"), file.FileName);
                        file.SaveAs(File);
                    }
                    else
                    {
                        Response.Write("<script>alert('file not selected')</script>");
                    }


                    int i = cmd.ExecuteNonQuery();

                    if (i > 0)
                    {
                        Response.Write("<script>alert('data insert successfully')</script>");
                        GridView1.EditIndex = -1;
                        gvbind();
                    }
                    else
                    {
                        Response.Write("<script>alert('data insert not successfully')</script>");
                        GridView1.EditIndex = -1;
                        gvbind();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error-" + ex.Message + "');</script>");
                }
            }

        }

        protected void Inkbtn_Search_Click(object sender, EventArgs e)
        {
            
            string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();

            SqlCommand cmd = new SqlCommand("fetch_employeesearch", con);
            cmd.Parameters.AddWithValue("@search", (FindControl("txt_Search") as TextBox).Text.Trim());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                DataBind();
            }
        }
    }
}