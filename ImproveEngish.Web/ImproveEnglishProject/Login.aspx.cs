using System;
using System.Net;
using System.Net.Mail;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class Login : System.Web.UI.Page
    {
        StudentManager _studentManager = new StudentManager(new EfStudentRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                aLink.Visible = false;
                divMessage.Visible = false;

                if (Request.Cookies["Email"] != null && Request.Cookies["Password"] != null)
                {
                    txtEmail.Value = Request.Cookies["Email"].Value;
                    txtPassword.Value = Request.Cookies["Password"].Value;
                    rememberMe.Checked = true;
                }
            }
        }

        protected void btnSignIn_OnServerClick(object sender, EventArgs e)
        {
            bool chechAccount = _studentManager.CheckLogin(txtEmail.Value, txtPassword.Value);
            if (chechAccount == true)
            {
                bool checkEmailVeryFied = _studentManager.CheckEmailVeryFied(txtEmail.Value);
                if (checkEmailVeryFied == true)
                {
                    RememberMe();
                    var student = _studentManager.GetByEmail(txtEmail.Value);
                    foreach (var i in student)
                    {
                        Session["StudentId"] = i.StudentId;
                        Session["UniversityId"] = i.FkUniversityId;
                        Session["DepartmentId"] = i.FkDepartmentId;
                        Session["NameSurname"] = i.NameSurname;
                        Session["ImagePath"] = i.ProfileImagePath;
                        Session["NationalityId"] = i.FkNationalityId;
                    }

                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Message("Your email has not activated.", false);
                    aLink.Visible = true;
                }
            }
            else
            {
                Message("Please check your mail or password.",false);
            }
        }

        private void RememberMe()
        {
            if (rememberMe.Checked)
            {
                Response.Cookies["Email"].Expires = DateTime.Now.AddDays(30);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);

                Response.Cookies["Email"].Value = txtEmail.Value.Trim();
                Response.Cookies["Password"].Value = txtPassword.Value.Trim();
            }
            else
            {
                Response.Cookies["Email"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

                Response.Cookies["Email"].Value = "";
                Response.Cookies["Password"].Value = "";
            }
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

        private void SendActivationEmail(int studentId, string email, string nameSurname, Guid activationCode)
        {
            var mail = new MailMessage();
            var SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("mskuproje@gmail.com");
            mail.To.Add(email);
            mail.Subject = "Account Activation";
            string body = "Hello " + nameSurname + ", ";
            body += "<br/><br/> Please click the following link to activate your account";
            body += "<br/> <a href = '" + Request.Url.AbsoluteUri.Replace("ImproveEnglishProject/Login", "ImproveEnglishProject/ActivationPage.aspx?ActivationCode=" + activationCode + "&&StudentId=" + studentId) + "'> Click here to activate your account.</a>";
            body += "<br/><br/>Thanks";
            mail.Body = body;
            SmtpServer.Port = 587;
            SmtpServer.Credentials = new NetworkCredential("mskuproje@gmail.com", "Msku2020.");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);
        }

        
        protected void aLink_OnServerClick(object sender, EventArgs e)
        {
            var student = _studentManager.GetByEmail(txtEmail.Value);
            foreach (var i in student)
            {
                SendActivationEmail(i.StudentId, i.Eposta, i.NameSurname, i.ActivationCode);
            }
        }
    }
}