using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects.DataClasses;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;
using RelationshipManager = System.Data.Entity.Core.Objects.DataClasses.RelationshipManager;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class NotificationDetails : System.Web.UI.Page
    {
        private SentNotificationManager _sentNotificationManager = new SentNotificationManager(new EfSentNotificationRepository());
        //private RelationshipManager _relationshipManager = new RelationshipManager(new EfStudentRepository());
        StudentScheduleManager _studentScheduleManager = new StudentScheduleManager(new EfStudentScheduleRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RouteData.Values["NotificationId"] != null || Convert.ToInt32(RouteData.Values["NotificationId"]) != 0)
            {
                
                if (!IsPostBack)
                {
                    int studentId = Convert.ToInt32(Session["StudentId"]);
                    int notificationId = Convert.ToInt32(RouteData.Values["NotificationId"]);
                    int fromStudentId = Convert.ToInt32(RouteData.Values["FromStudentId"]);
                    GetNotificationDetail(studentId, notificationId);
                }
            }
        }

        private void GetNotificationDetail(int studentId, int notificationId)
        {
            var list = _sentNotificationManager.GetNotificationDetail(studentId, notificationId);
            rptNotificationDetail.DataSource = list;
            rptNotificationDetail.DataBind();
        }

        protected void btnAccept_OnServerClick(object sender, EventArgs e)
        {
            _sentNotificationManager.Add(new SentNotification()
            {
                FkFromToUserId = Convert.ToInt32(Session["StudentId"]),
                FkSentToUserId = Convert.ToInt32(RouteData.Values["FromStudentId"]),
                FkScheduleId = Convert.ToInt32(RouteData.Values["ScheduleId"]),
                MessageContent = "Accepted single meeting",
                SentDateTime = DateTime.Now,
                IsRead = false,
                IsFeedback = true
            });


        }

        protected void btnDeny_OnServerClick(object sender, EventArgs e)
        {
            _sentNotificationManager.Add(new SentNotification()
            {
                FkFromToUserId = Convert.ToInt32(Session["StudentId"]),
                FkSentToUserId = Convert.ToInt32(RouteData.Values["FromStudentId"]),
                FkScheduleId = Convert.ToInt32(RouteData.Values["ScheduleId"]),
                MessageContent = "Denied single meeting",
                SentDateTime = DateTime.Now,
                IsRead = false,
                IsFeedback = true
            });
        }
    }
}