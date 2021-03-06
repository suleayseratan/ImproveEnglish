using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class Notifications : System.Web.UI.Page
    {
        SentNotificationManager _sentNotificationManager = new SentNotificationManager(new EfSentNotificationRepository());
        SentGroupNotificationManager _sentGroupNotificationManager = new SentGroupNotificationManager(new EfSentGroupNotificationRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int studnetId = Convert.ToInt32(Session["StudentId"]);
                GetSingleNotifications(studnetId);
                GetGroupNotifications(studnetId);
            }
        }

        private void GetGroupNotifications(int studnetId)
        {
            var list = _sentGroupNotificationManager.GetGroupNotifications(studnetId);
            rptGroupNotification.DataSource = list;
            rptGroupNotification.DataBind();
        }

        private void GetSingleNotifications(int studnetId)
        {
            var list = _sentNotificationManager.GetAll(studnetId);
            rptSingleNotification.DataSource = list;
            rptSingleNotification.DataBind();
        }

    }
}