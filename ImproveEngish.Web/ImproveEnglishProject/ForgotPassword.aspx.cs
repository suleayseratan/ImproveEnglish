using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI.WebControls;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        StudentManager _studentManager = new StudentManager(new EfStudentRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnSendMail_OnServerClick(object sender, EventArgs e)
        {
            if (!txtEmail.Value.Equals(""))
            {
                var list = _studentManager.GetByEmail(txtEmail.Value);
                if (list.Count != 0)
                {
                    foreach (var i in list)
                    {
                        SendEmail(i.StudentId, i.Eposta, i.NameSurname, i.ActivationCode);
                    }
                    Message("Please check your mail address.",true);
                }
                else
                {
                    Message("Please enter your mail address again.",false);
                }
            }
            else
            {
                Message("Please enter your mail.",false);
            }
        }

        private void SendEmail(int studentId, string email, string nameSurname, Guid activationCode)
        {
            var mail = new MailMessage();
            var SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("mskuproje@gmail.com");
            mail.To.Add(email);
            mail.Subject = "Forgot Your Password";
            string body = "Hello " + nameSurname + ", ";
            body += "<br/><br/> Please click the following link to change your password";
            body += "<br/> <a href = '" + Request.Url.AbsoluteUri
                .Replace("ImproveEnglishProject/ForgotPassword", "ImproveEnglishProject/ChangePassword.aspx?ActivationCode=" 
                                                                 + activationCode + "&&StudentId=" + studentId) + "'> " +
                    "Click here to activate your account.</a>";
            body += "<br/><br/>Thanks";
            mail.Body = body;
            SmtpServer.Port = 587;
            SmtpServer.Credentials = new NetworkCredential("mskuproje@gmail.com", "Msku2020.");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);
        }

        private void Message(string message, bool check)
        {
            divMessage.Visible = true;
            divMessage.Attributes.Remove("class");
            if (check.Equals(true))
            {
                divMessage.Attributes.Add("class", "alert alert-success mt-4");
                divMessage.InnerHtml = message;
            }
            else
            {
                divMessage.Attributes.Add("class", "alert alert-danger mt-4");
                divMessage.InnerHtml = message;
            }
        }

    }
}