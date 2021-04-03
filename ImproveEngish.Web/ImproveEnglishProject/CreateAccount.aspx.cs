using System;
using System.Linq;
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
        private IStudentService _studentService;
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
            string nameSurname = txtName.Value + " " + txtSurname;
            string gender = radioGender.SelectedValue.ToString();
            string password = txtPassword.Value;
            string email = txtEmail.Value + divEposta.InnerHtml;
            string defaultImagePath = "H:\\My-Github-Projects\\ImproveEnglish\\ImproveEngish.Web\\ImproveEnglishProject\\assets\\img\\avataaars.png";


            if (CheckPassword(password) == true)
            {
                string md5Password = FormsAuthentication.HashPasswordForStoringInConfigFile(password,"MD5");
                var checkAdd = _studentManager.Add(nationalityId, universityId, departmentId, nameSurname, gender, md5Password, email, defaultImagePath);
                if (checkAdd.Equals(true))
                {
                    Message("Account created successfully. Please check your email address.", true);
                }
                else
                {
                    Message("This account already exists.",false);
                }
            }
            else
            {
                Message("Password strength isn't enough.",false);
            }

        }

        private void Message(string message,bool check)
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

        private bool CheckPassword(string password)
        {
            bool checkIsUpper = false;
            bool checkIsLower = false;
            bool checkIsNumber = false;

             
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