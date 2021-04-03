using System;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        private StudentManager _studentManager;
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
                selectUniversity.Items.Insert(0,"Select");
                selectDeprtment.Items.Insert(0,"Select");
                selectNationality.Items.Insert(0,"Select");
            }
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

        }

        protected void selectUniversity_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(selectUniversity.SelectedValue);
            var list = _departmentOfUniversityManager.GetAllDepartmentOfUniversity(id);
            selectDeprtment.DataSource = list;
            selectDeprtment.DataTextField = "DepartmentName";
            selectDeprtment.Value = "DepartmentOfUniversityId";
            selectDeprtment.DataBind();
            foreach (var i in list)
            {
                divEposta.InnerHtml = i.UniversityEposta;
            }
            
        }
    }
}