using System;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class SingleMeeting : System.Web.UI.Page
    {
        private StudentScheduleManager _studentScheduleManager = new StudentScheduleManager(new EfStudentScheduleRepository());
        private DepartmentOfUniversityManager _departmentOfUniversityManager = new DepartmentOfUniversityManager(new EfDepartmentOfUniversityRepository());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int universityId = Convert.ToInt32(Session["UniversityId"]);
                GetDepartments(universityId);
            }
        }

        private void GetDepartments(int universityId)
        {
            var list = _departmentOfUniversityManager.GetAllDepartmentOfUniversity(universityId);
            ddlDepartment.DataSource = list;
            ddlDepartment.DataTextField = "DepartmentName";
            ddlDepartment.DataValueField = "DepartmentOfUniversityId";
            ddlDepartment.DataBind();
        }

        protected void btnSearch_OnServerClick(object sender, EventArgs e)
        {
            string date = mDate.Value;
            string startTime = mStartTime.Value;
            string endTime = mEndTime.Value;
            int departmentId = Convert.ToInt32(ddlDepartment.SelectedValue);
            int studentId = Convert.ToInt32(Session["StudentId"]);
            int universityId = Convert.ToInt32(Session["UniversityId"]);
            int nationalityId = Convert.ToInt32(Session["NationalityId"]);
            var list = _studentScheduleManager.SearchStudentSheduleByDetaptmetId(departmentId, nationalityId,studentId, universityId, date, startTime, endTime);

            rptStudents.DataSource = list;
            rptStudents.DataBind();
        }

    }
}