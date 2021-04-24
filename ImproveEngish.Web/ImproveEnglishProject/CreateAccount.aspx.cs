using System;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web.Security;
using System.Web.UI.WebControls;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        private StudentManager _studentManager = new StudentManager(new EfStudentRepository());
        private UniversityManager _universityManager = new UniversityManager(new EfUniversityRepository());
        //private IUniversityService _universityService;
        private DepartmentOfUniversityManager _departmentOfUniversityManager = new DepartmentOfUniversityManager(new EfDepartmentOfUniversityRepository());
        private NationalityManager _nationalityManager = new NationalityManager(new EfNationalityRepository());


        //public CreateAccount(IUniversityService universityService)
        //{
        //    this._universityService = universityService;
        //}

        //protected CreateAccount(){}


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetUniversities();
                GetNationalities();
                InsertSomething();
            }
        }

        private void InsertSomething()
        {
            selectUniversity.Items.Insert(0, "Select");
            selectDeprtment.Items.Insert(0, "Select");
            selectNationality.Items.Insert(0, "Select");
            divEposta.InnerHtml = "@posta.example.edu.tr";
        }

        private void GetNationalities()
        {
            var list = _nationalityManager.GetAll();
            selectNationality.DataSource = list;
            selectNationality.DataTextField = "NationalityName";
            selectNationality.DataValueField = "NationalityId";
            selectNationality.DataBind();
        }

        private void GetUniversities()
        {
            var list = _universityManager.GetAll();
            selectUniversity.DataSource = list;
            selectUniversity.DataTextField = "UniversityName";
            selectUniversity.DataValueField = "UniversityId";
            selectUniversity.DataBind();
        }


        protected void btnCreateAccount_OnServerClick(object sender, EventArgs e)
        {
            int nationalityId = Convert.ToInt32(selectNationality.SelectedValue);
            int universityId = Convert.ToInt32(selectUniversity.SelectedValue);
            int departmentId = Convert.ToInt32(selectDeprtment.SelectedValue);
            string nameSurname = txtName.Value + " " + txtSurname.Value;
            string gender = radioGender.SelectedValue.ToString();
            string password = txtPassword.Value;
            string confirmPassword = txtPasswordAgain.Value;
            string email = txtEmail.Value + divEposta.InnerHtml;
            string defaultImagePath = "H:\\My-Github-Projects\\ImproveEnglish\\ImproveEngish.Web\\ImproveEnglishProject\\assets\\img\\avataaars.png";
            Guid activationCode = Guid.NewGuid();

            if (CheckPassword(password, confirmPassword) == true)
            {
                string md5Password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
                var checkAdd = _studentManager.Add(nationalityId, universityId, departmentId, nameSurname, gender, md5Password, email, defaultImagePath, activationCode);
                if (checkAdd.Equals(true))
                {
                    Message("Account created successfully. Please check your email address.", true);
                    int studentId = _studentManager.GetId(email);
                    SendActivationEmail(studentId, email, nameSurname, activationCode);
                }
                else
                {
                    Message("This account already exists.", false);
                }
            }
            else
            {
                Message("Password strength isn't enough.", false);
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
            body += "<br/> <a href = '" + Request.Url.AbsoluteUri.Replace("ImproveEnglishProject/CreateAccount", "ImproveEnglishProject/ActivationPage.aspx?ActivationCode=" + activationCode + "&&StudentId=" + studentId) + "'> Click here to activate your account.</a>";
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

        private bool CheckPassword(string password, string confirmPassword)
        {
            bool checkIsUpper = false;
            bool checkIsLower = false;
            bool checkIsNumber = false;

            if (password.Equals(confirmPassword))
            {
                foreach (var i in password)
                {
                    if (char.IsUpper(i))
                    {
                        checkIsUpper = true;
                    }
                    else if (char.IsLower(i))
                    {
                        checkIsLower = true;
                    }
                    else if (char.IsNumber(i))
                    {
                        checkIsNumber = true;
                    }
                }

                if (checkIsUpper == true && checkIsLower == true && checkIsNumber == true && password.Length >= 8 &&
                    password.Length <= 15)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }

        }

        protected void selectUniversity_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(selectUniversity.SelectedValue);
            var list = _departmentOfUniversityManager.GetAllDepartmentOfUniversity(id);
            selectDeprtment.DataSource = list;
            selectDeprtment.DataTextField = "DepartmentName";
            selectDeprtment.DataValueField = "DepartmentOfUniversityId";
            selectDeprtment.DataBind();
            foreach (var i in list)
            {
                divEposta.InnerHtml = i.UniversityEposta;
            }
        }
    }
}