using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
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
            string groupImagePath = GetImagePath(fileGroupImage.Value);
            int numberOfMeeting = Convert.ToInt32(ddlNumberOfMembers.Value);
            DateTime meetingDate = Convert.ToDateTime(mDate.Value);
            TimeSpan meetingTime = TimeSpan.Parse(mTime.Value);
            string meetingLocation = txtMeetingLocation.Value;
            _groupManager.Add(new Group()
            {
                FkCreatorId = creatorId,
                Name = groupName,
                Subject = subject,
                Explanation = explanation,
                GroupImagePath = groupImagePath,
                NumberOfMembers = numberOfMeeting,
                MeetingDate = meetingDate,
                MeetingTime = meetingTime,
                MeetingLocation = meetingLocation
            });

            int universityId = Convert.ToInt32(Session["UniversityId"]);
            GetMyGroups(universityId);
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