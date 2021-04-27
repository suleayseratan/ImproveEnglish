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
            int creatorId = Convert.ToInt32(Session["StudentId"]);
            var list = _groupManager.GetGroups(universityId, systemDate,creatorId);
            rptGroupMeeting.DataSource = list;
            rptGroupMeeting.DataBind();
        }

        protected void btnSaveGroup_OnServerClick(object sender, EventArgs e)
        {
            //int creatorId = Convert.ToInt32(Session["StudentId"]);
            //string groupName = txtGroupName.Value;
            //string subject = txtSubject.Value;
            //string explanation = txtExplanation.Value;
            //string groupImagePath = "assets/img/events-2.jpg";
            //int numberOfMeeting = Convert.ToInt32(ddlNumberOfMembers.Value);
            //string meetingDate = mDate.Value;
            //string meetingTime = mTime.Value;
            //string meetingLocation = txtMeetingLocation.Value;
            //_groupManager.Add(creatorId, groupName, subject, explanation, groupImagePath, numberOfMeeting, meetingDate, meetingTime, meetingLocation);
            
            //int universityId = Convert.ToInt32(Session["UniversityId"]);
            //GetGroups(universityId);
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