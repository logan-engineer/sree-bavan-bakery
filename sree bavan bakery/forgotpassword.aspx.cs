using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Windows.Forms;

namespace sree_bavan_bakery
{
    public partial class forgotpassword : System.Web.UI.Page
    {
       
        string randomcode;
        string To;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Forgot_Click(object sender, EventArgs e)
        {
            Session["emailid"] = txt_Forgot.Text;
            string from, to, pass, messagebox;
            Random rand = new Random();
            randomcode = (rand.Next(999999)).ToString();
            MailMessage message = new MailMessage();
            to=(txt_Forgot.Text).ToString();
            from = "loganat081@gmail.com";
            pass = "pejj ivkz qtkw hvza";
            messagebox = "your verification OTP: " + randomcode;
            message.To.Add(to);
            message.From = new MailAddress(from);
            message.Subject = "your verfication OTP";
            message.Body = messagebox;
            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(from, pass);
            try
            {
                smtp.Send(message);
                Response.Write("<script>alert('OTP sent successfully')</script>");
                btn_Forgot.Visible = false;
                txt_verify.Visible = true;
                btn_verify.Visible = true;
                Session["code"] = randomcode;
      
            }
            catch(Exception ex)
            {
               
                Response.Write("<script>alert('OTP not sent please check connection')</script>");
            }
        }

        protected void btn_verify_Click(object sender, EventArgs e)
        {
            string verify = txt_verify.Text;
            Response.Write("<script>alert('otp is"+ Session["code"] + "');</script>");
            if (Session["code"].ToString() == verify )
            {
                txt_verify.CssClass = "text text-success";
                Response.Redirect("updatepassword.aspx");
            }
            else
            {
                MessageBox.Show("enter currect 6-digit OTP");
                txt_verify.Text=string.Empty;
            }
        }
    }
}