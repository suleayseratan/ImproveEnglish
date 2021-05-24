﻿using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects.DataClasses;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;
using RelationshipManager = System.Data.Entity.Core.Objects.DataClasses.RelationshipManager;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class NotificationDetails : System.Web.UI.Page
    {
        private SentNotificationManager _sentNotificationManager = new SentNotificationManager(new EfSentNotificationRepository());
        RelationshipManager _relationshipManager = new RelationshipManager(new EfRelationshipRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RouteData.Values["NotificationId"] != null || Convert.ToInt32(RouteData.Values["NotificationId"]) != 0)
            {
                
                if (!IsPostBack)
                {
                    int studentId = Convert.ToInt32(Session["StudentId"]);
                    int notificationId = Convert.ToInt32(RouteData.Values["NotificationId"]);
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
            
        }

        protected void btnDeny_OnServerClick(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }
    }
}