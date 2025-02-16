using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace sree_bavan_bakery
{
    public class utils
    {
        public bool updateCartQuantity(int productid, int quantity,int Usertid)
        {
            
                bool isupdated = false;
            try
            {
                string fetchDBDetails = ConfigurationManager.ConnectionStrings["loguconnection"].ConnectionString;

            SqlConnection con = new SqlConnection();

            con.ConnectionString = fetchDBDetails;

            con.Open();

            SqlCommand cmd = new SqlCommand("fetch_crud", con);
            cmd.Parameters.AddWithValue("@action", "update");
            cmd.Parameters.AddWithValue("@productid", productid);
            cmd.Parameters.AddWithValue("@quantity",quantity);
            cmd.Parameters.AddWithValue("@userid",Usertid);

            cmd.CommandType = CommandType.StoredProcedure;


                int i = cmd.ExecuteNonQuery();
                if (i != 0)
                {
                    System.Web.HttpContext.Current.Response.Write("<script>alert('update item quantity successfully')</script>");
                   
                }
                isupdated = true;
            }
            catch (Exception ex)
            {
                isupdated = false;
              System.Web.HttpContext.Current.Response.Write("<script>alert('Error-" + ex.Message + "');</script>");
            }
          
            return isupdated;
        }
       
        public static string getUniqueId()
        {
            Guid guid =Guid.NewGuid();
            String uniqueid = guid.ToString();
            return uniqueid;

        }
    }
     
}