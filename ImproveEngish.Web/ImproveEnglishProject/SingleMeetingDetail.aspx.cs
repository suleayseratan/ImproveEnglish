using System;
using System.Data;
using System.Globalization;
using Entity;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class SingleMeetingDetail : System.Web.UI.Page
    {
        private StudentManager _studentManager = new StudentManager(new EfStudentRepository());
        private  StudentScheduleManager _studentScheduleManager = new StudentScheduleManager(new EfStudentScheduleRepository()); 
        SentNotificationManager _sentNotificationManager = new SentNotificationManager(new EfSentNotificationRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RouteData.Values["StudentId"] != null || Convert.ToInt32(RouteData.Values["StudentId"]) != 0)
            {
                Response.Write(RouteData.Values["StudentId"]);
                if (!IsPostBack)
                {
                    int studentId = Convert.ToInt32(RouteData.Values["StudentId"]);
                    GetStudentDetail(studentId);
                    GetStudentAgenda(studentId);
                }
            }
        }

        private void GetStudentAgenda(int studentId)
        {
            string systemDate = DateTime.Now.ToShortDateString();
            var student = _studentScheduleManager.GetStudentAgenda(studentId,systemDate);
            rptStudentAgenda.DataSource = student;
            rptStudentAgenda.DataBind();
        }

        private void GetStudentDetail(int studentId)
        {
            var student = _studentManager.GetStudentById(studentId);
            rptStudentDetail.DataSource = student;
            rptStudentDetail.DataBind();
        }

        protected void btnSendRequest_OnServerClick(object sender, EventArgs e)
        {
            int scheduleId = Convert.ToInt32(RouteData.Values["ScheduleId"]);
            int toStudentId = Convert.ToInt32(RouteData.Values["StudentId"]);
            _sentNotificationManager.Add(new SentNotification()
            {
                FkFromToUserId = Convert.ToInt32(Session["StudentId"]),
                FkSentToUserId = toStudentId,
                FkScheduleId = scheduleId,
                MessageContent = "Do you want accept?",
                SentDateTime = DateTime.Now,
                IsRead = false
            });
        }
    }
}