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
    public partial class MyGroupDetail : System.Web.UI.Page
    {
        GroupManager _groupManager = new GroupManager(new EfGroupRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int groupId = Convert.ToInt32(Request.QueryString["groupId"]);
                int universityId = Convert.ToInt32(Session["UniversityId"]);
                GetGroupDetails(universityId, groupId);
            }
        }

        private void GetGroupDetails(int universityId, int groupId)
        {
            var list = _groupManager.GetGroupDetails(universityId, groupId);
            rptGroupDetail.DataSource = list;
            rptGroupDetail.DataBind();

            foreach (var i in list)
            {
                txtGroupName.Value = i.GroupName;
                txtGroupSubject.Value = i.GroupSubject;
                txtExplanation.Value = i.GroupExplanation;
                ddlNumberOfMembers.Value = i.NumberOfGroupMembers.ToString();
                txtMeetingLocation.Value = i.GroupMeetingLocation;
                mDate.Value = i.GroupMeetingDate.ToString("MM/dd/yyyy");
                mTime.Value = i.GroupMeetingTime.ToString();
            }
        }

        protected void btnUpdate_OnServerClick(object sender, EventArgs e)
        {
            int groupId = Convert.ToInt32(Request.QueryString["groupId"]);
            int universityId = Convert.ToInt32(Session["UniversityId"]);
            int creatorId = Convert.ToInt32(Session["StudentId"]);
            string groupName = txtGroupName.Value;
            string subject = txtGroupSubject.Value;
            string explanation = txtExplanation.Value;
            string groupImagePath = GetImagePath(fileGroupImage.Value);
            int numberOfMeeting = Convert.ToInt32(ddlNumberOfMembers.Value);
            string meetingDate = mDate.Value;
            string meetingTime = mTime.Value;
            string meetingLocation = txtMeetingLocation.Value;
            _groupManager.Update(groupId,creatorId, groupName, subject, explanation, groupImagePath, numberOfMeeting, meetingDate, meetingTime, meetingLocation);
            GetGroupDetails(universityId,groupId);
        }

        protected void btnDeleteGroup_OnServerClick(object sender, EventArgs e)
        {
            int groupId = Convert.ToInt32(Request.QueryString["groupId"]);
            _groupManager.Delete(groupId);
            Response.Redirect("MyGroups.aspx");
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