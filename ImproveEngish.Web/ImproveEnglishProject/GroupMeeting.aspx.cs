using System;
using System.IO;
using System.Security.Policy;
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
            var list = _groupManager.GetGroups(universityId, systemDate, creatorId);
            rptGroupMeeting.DataSource = list;
            rptGroupMeeting.DataBind();
        }

        protected void btnSaveGroup_OnServerClick(object sender, EventArgs e)
        {
            int creatorId = Convert.ToInt32(Session["StudentId"]);
            string groupName = txtGroupName.Value;
            string subject = txtSubject.Value;
            string explanation = txtExplanation.Value;
            string groupImagePath = GetImagePath(fileGroupImage.Value);
            int numberOfMeeting = Convert.ToInt32(ddlNumberOfMembers.Value);
            string meetingDate = mDate.Value;
            string meetingTime = mTime.Value;
            string meetingLocation = txtMeetingLocation.Value;
            _groupManager.Add(creatorId, groupName, subject, explanation, groupImagePath, numberOfMeeting, meetingDate, meetingTime, meetingLocation);

            int universityId = Convert.ToInt32(Session["UniversityId"]);
            GetGroups(universityId);
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
        private string GetImagePath(string value)
        {
            var fileName = "";
            var path = "";
            var rootPath = "assets/img/";
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
                        fileName = Path.ChangeExtension(randomFileName, ".jpg");
                        path = Path.Combine(folder, fileName);
                    }
                    if (i + 1 == 1)
                    {

                        if (!String.IsNullOrEmpty(path))
                        {
                            paths[i] = rootPath + fileName;
                            fileGroupImage.PostedFile.SaveAs(path);
                        }

                        else
                        {
                            paths[i] = rootPath + "images.png";
                        }

                    }

                }

            }
            return paths[0];
        }
    }
}