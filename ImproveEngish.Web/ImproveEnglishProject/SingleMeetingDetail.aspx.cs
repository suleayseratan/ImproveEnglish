using System;
using System.Globalization;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class SingleMeetingDetail : System.Web.UI.Page
    {
        private StudentManager _studentManager = new StudentManager(new EfStudentRepository());
        private  StudentScheduleManager _studentScheduleManager = new StudentScheduleManager(new EfStudentScheduleRepository()); 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int studentId = Convert.ToInt32(Request.QueryString["studentId"]);
                GetStudentDetail(studentId);
                GetStudentAgenda(studentId);
            }
        }

        private void GetStudentAgenda(int studentId)
        {
            var student = _studentManager.GetStudentById(studentId);
            rptStudentAgenda.DataSource = student;
            rptStudentAgenda.DataBind();
        }

        private void GetStudentDetail(int studentId)
        {
            var student = _studentManager.GetStudentById(studentId);
            rptStudentDetail.DataSource = student;
            rptStudentDetail.DataBind();

        }
    }
}