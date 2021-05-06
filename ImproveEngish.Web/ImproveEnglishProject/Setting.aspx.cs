using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using Entity;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class Setting : System.Web.UI.Page
    {
        StudentManager _studentManager = new StudentManager(new EfStudentRepository());
        UniversityManager _universityManager = new UniversityManager(new EfUniversityRepository());
        DepartmentOfUniversityManager _departmentOfUniversityManager = new DepartmentOfUniversityManager(new EfDepartmentOfUniversityRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int studentId = Convert.ToInt32(Session["StudentId"]);
                int universityId = Convert.ToInt32(Session["UniversityId"]);
                GetStudentDetail(studentId);
                GetUniversities();
                GetDepartment(universityId);
            }

        }

        private void GetUniversities()
        {
            var list = _universityManager.GetAll();
            ddlUniversity.DataSource = list;
            ddlUniversity.DataTextField = "UniversityName";
            ddlUniversity.DataValueField = "UniversityId";
            ddlUniversity.DataBind();
        }

        private void GetStudentDetail(int studentId)
        {
            var student = _studentManager.GetStudentById(studentId);

            foreach (var s in student)
            {
                var nameSurname = s.NameSurname.Split(' ');
                for (int i = 0; i < nameSurname.Length - 1; i++)
                {
                    txtName.Value += nameSurname[i] + " ";
                }
                txtSurname.Value = nameSurname.Last();
                txtEmail.Value = s.Eposta.Substring(0, s.Eposta.IndexOf("@"));
                ddlUniversity.SelectedValue = s.UniversityId.ToString();
                ddlDeprtment.SelectedValue = s.DepartmentId.ToString();
            }
        }

        private void GetDepartment(int universityId)
        {
            var list = _departmentOfUniversityManager.GetAllDepartmentOfUniversity(universityId);
            ddlDeprtment.DataSource = list;
            ddlDeprtment.DataTextField = "DepartmentName";
            ddlDeprtment.DataValueField = "DepartmentOfUniversityId";
            ddlDeprtment.DataBind();
            foreach (var i in list)
            {
                divEposta.InnerHtml = i.UniversityEposta;
            }
        }

        protected void btnUpdateAccount_OnServerClick(object sender, EventArgs e)
        {
            int studentId = Convert.ToInt32(Session["StudentId"]);
            string nameSurname = txtName.Value + " " + txtSurname.Value;
            string eposta;
            Guid activationCode;
            string imagePath;
            bool emailVeryFied;
            var student = _studentManager.GetStudentById(studentId);
            foreach (var s in student)
            {
                if (fileGroupImage.Value == "")
                {
                    imagePath = s.ProfileImagePath;
                }
                else
                {
                    imagePath = GetImagePath();
                    Session["ProfileImagePath"] = imagePath;
                }

                if(txtEmail.Value + divEposta.InnerHtml != s.Eposta)
                {
                    eposta = txtEmail.Value + divEposta.InnerHtml;
                    activationCode = new Guid();
                    emailVeryFied = false;
                    SendActivationEmail(studentId,eposta,nameSurname,activationCode);
                }
                else 
                {
                    eposta = s.Eposta;
                    activationCode = s.ActivationCode;
                    emailVeryFied = true;
                }
                _studentManager.Update(new Student()
                {
                    StudentId = studentId,
                    FkNationalityId = s.NationalityId,
                    FkUniversityId= Convert.ToInt32(ddlUniversity.SelectedValue),
                    FkDepartmentId = Convert.ToInt32(ddlDeprtment.SelectedValue),
                    NameSurname = nameSurname,
                    Gender = s.Gender,
                    Password = s.Password,
                    Eposta = eposta,
                    ProfileImagePath = imagePath,
                    EmailVeryFied = emailVeryFied,
                    ActivationCode = activationCode
                });
                Session["NameSurname"] = nameSurname;
            }
            
        }

        protected void ddlUniversity_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            int universityId = Convert.ToInt32(ddlUniversity.SelectedValue);
            ddlDeprtment.Items.Clear();
            var list = _departmentOfUniversityManager.GetAllDepartmentOfUniversity(universityId);
            ddlDeprtment.DataSource = list;
            ddlDeprtment.DataTextField = "DepartmentName";
            ddlDeprtment.DataValueField = "DepartmentOfUniversityId";
            ddlDeprtment.DataBind();
            foreach (var i in list)
            {
                divEposta.InnerHtml = i.UniversityEposta;
            }
        }

        private string GetImagePath()
        {
            var fileName = "";
            var path = "";
            var rootPath = "assets/img/";
            string[] elements;
            string[] paths = new string[4];
            if (fileGroupImage.PostedFile != null)
            {
                elements = new string[]
                    {fileGroupImage.Value};

                for (int i = 0; i < elements.Length; i++)
                {

                    var extension = Path.GetExtension(elements[i]);
                    if (extension == ".jpg" || extension == ".png")
                    {
                        var folder = Server.MapPath("assets/img/");
                        var randomFileName = Path.GetRandomFileName();
                        fileName = Path.ChangeExtension(randomFileName, ".jpg");
                        path = Path.Combine(folder, fileName);
                    }
                    if (i + 1 == 1)
                    {

                        if (!String.IsNullOrEmpty(path))
                        {
                            paths[i] = rootPath + fileName;
                            fileGroupImage.PostedFile.SaveAs(path);
                        }

                        else
                        {
                            paths[i] = rootPath + "images.png";
                        }

                    }

                }

            }
            return paths[0];
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
    }
}