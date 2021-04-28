using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class MyGroups : System.Web.UI.Page
    {
        GroupManager _groupManager = new GroupManager(new EfGroupRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int universityId = Convert.ToInt32(Session["UniversityId"]);
                GetMyGroups(universityId);
            }
        }

        private void GetMyGroups(int universityId)
        {
            string systemDate = DateTime.Now.ToShortDateString();
            int creatorId = Convert.ToInt32(Session["StudentId"]);
            var list = _groupManager.GetMyGroups(universityId, creatorId);
            rptGroupMeeting.DataSource = list;
            rptGroupMeeting.DataBind();
        }

        protected void btnSaveGroup_OnServerClick(object sender, EventArgs e)
        {
            int creatorId = Convert.ToInt32(Session["StudentId"]);
            string groupName = txtGroupName.Value;
            string subject = txtSubject.Value;
            string explanation = txtExplanation.Value;

            string[] elements;
            string[] paths = new string[4];
            if (fileGroupImage.PostedFile != null)
            {
                elements = new string[]
                    {fileGroupImage.Value};

                for (int i = 0; i < elements.Length; i++)
                {

                    var extension = Path.GetExtension(elements[i]);
                    if (extension == ".jpg" || extension == ".png")
                    {
                        var folder = Server.MapPath("assets/img/");
                        var randomFileName = Path.GetRandomFileName();
                        var fileName = Path.ChangeExtension(randomFileName, ".jpg");
                        var path = Path.Combine(folder, fileName);
                    }

                }

            }
            string groupImagePath = paths[0];

            int numberOfMeeting = Convert.ToInt32(ddlNumberOfMembers.Value);
            string meetingDate = mDate.Value;
            string meetingTime = mTime.Value;
            string meetingLocation = txtMeetingLocation.Value;
            _groupManager.Add(creatorId, groupName, subject, explanation, groupImagePath, numberOfMeeting, meetingDate, meetingTime, meetingLocation);

            int universityId = Convert.ToInt32(Session["UniversityId"]);
            GetMyGroups(universityId);
        }
    }
}