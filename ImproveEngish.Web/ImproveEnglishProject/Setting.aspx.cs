using System;
using System.IO;
using System.Linq;
using System.Web;
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
            int studentId = Convert.ToInt32(Session["StudentId"]);
            int universityId = Convert.ToInt32(Session["UniversityId"]);
            GetStudentDetail(studentId);
            GetUniversities();
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
                for (int i = 0; i < nameSurname.Length-1; i++)
                {
                    txtName.Value += nameSurname[i] + " ";
                }
                txtSurname.Value = nameSurname.Last();
                txtEmail.Value = s.Eposta.Substring(0, s.Eposta.IndexOf("@"));
            }
        }

        protected void ddlUniversity_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            int universityId = Convert.ToInt32(ddlUniversity.SelectedValue);
            GetDepartment(universityId);
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
            
        }
    }
}