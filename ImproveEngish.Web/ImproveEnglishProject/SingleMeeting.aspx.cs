using System;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class SingleMeeting : System.Web.UI.Page
    {
        private StudentScheduleManager _studentScheduleManager = new StudentScheduleManager(new EfStudentScheduleRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnSearch_OnServerClick(object sender, EventArgs e)
        {
            string date = mDate.Value;
            string startTime = mStartTime.Value;
            string endTime = mEndTime.Value;
            int studentId = Convert.ToInt32(Session["StudentId"]);
            int universityId = Convert.ToInt32(Session["UniversityId"]);
            var list = _studentScheduleManager.SearchStudentSheduleByDetaptmetId(1, studentId, universityId, date, startTime, endTime);

            rptStudents.DataSource = list;
            rptStudents.DataBind();
        }
    }
}