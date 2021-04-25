using System;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class GroupMeeting : System.Web.UI.Page
    {
        GroupManager _groupManager = new GroupManager(new EfGroupRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int universityId = Convert.ToInt32(Session["UniversityId"]);
                GetGroups(universityId);
            }
        }

        private void GetGroups(int universityId)
        {
            string systemDate = DateTime.Now.ToShortDateString();
            var list = _groupManager.GetGroups(universityId,systemDate);
            rptGroupMeeting.DataSource = list;
            rptGroupMeeting.DataBind();
        }

        protected void btnSaveGroup_OnServerClick(object sender, EventArgs e)
        {
        }

        protected void btnSearch_OnServerClick(object sender, EventArgs e)
        {
            int universityId = Convert.ToInt32(Session["UniversityId"]);
            string subject = txtSearchSubject.Value;
            string mDate = sMeetingDate.Value;
            string mStartTime = sMeetingStartTime.Value;
            string mEndTime = sMeetingEndTime.Value;

            var list = _groupManager.SearchGroup(universityId, subject, mDate, mStartTime, mEndTime);
            rptGroupMeeting.DataSource = list;
            rptGroupMeeting.DataBind();
        }
    }
}