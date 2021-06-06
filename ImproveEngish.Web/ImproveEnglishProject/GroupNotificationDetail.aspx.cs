using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class GroupNotificationDetail : System.Web.UI.Page
    {
        SentGroupNotificationManager _sentGroupNotificationManager = new SentGroupNotificationManager(new EfSentGroupNotificationRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RouteData.Values["NotificationId"] != null || Convert.ToInt32(RouteData.Values["NotificationId"]) != 0)
            {
                if (!IsPostBack)
                {
                    int studentId = Convert.ToInt32(Session["StudentId"]);
                    int notificationId = Convert.ToInt32(RouteData.Values["NotificationId"]);
                    GetNotificationDetail(studentId,notificationId);
                }
            }
        }

        private void GetNotificationDetail(int studentId,int notificationId)
        {
            var list = _sentGroupNotificationManager.GetGroupNotificationDetail(studentId,notificationId);
            rptGroupNotification.DataSource = list;
            rptGroupNotification.DataBind();
        }
    }
}