using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Entity;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class MyGroupDetail : System.Web.UI.Page
    {
        GroupManager _groupManager = new GroupManager(new EfGroupRepository());
        SentGroupNotificationManager _groupNotificationManager = new SentGroupNotificationManager(new EfSentGroupNotificationRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RouteData.Values["GroupId"] != null || Convert.ToInt32(RouteData.Values["GroupId"]) != 0)
            {
                Response.Write(RouteData.Values["GroupId"]);

                if (!IsPostBack)
                {
                    int groupId = Convert.ToInt32(RouteData.Values["GroupId"]);
                    int universityId = Convert.ToInt32(Session["UniversityId"]);
                    GetGroupDetails(universityId, groupId);
                }

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
                mDate.Value = i.GroupMeetingDate.ToString("yyyy-MM-dd");
                mTime.Value = i.GroupMeetingTime.ToString();
            }
        }

        protected void btnUpdate_OnServerClick(object sender, EventArgs e)
        {
            int groupId = Convert.ToInt32(RouteData.Values["GroupId"]);
            int universityId = Convert.ToInt32(Session["UniversityId"]);
            int creatorId = Convert.ToInt32(Session["StudentId"]);
            string groupName = txtGroupName.Value;
            string subject = txtGroupSubject.Value;
            string explanation = txtExplanation.Value;
            string groupImagePath = fileGroupImage.Value;//GetImagePath(fileGroupImage.Value);
            int numberOfMembers = Convert.ToInt32(ddlNumberOfMembers.Value);
            string meetingDate = mDate.Value;
            string meetingTime = mTime.Value;
            string meetingLocation = txtMeetingLocation.Value;
            if (groupImagePath != String.Empty)
            {
                groupImagePath = GetImagePath(fileGroupImage.Value);
            }
            else
            {
                var list = _groupManager.GetGroupDetails(universityId, groupId);
                foreach (var i in list)
                {
                    groupImagePath = i.GroupImagePath;
                }
            }
            _groupManager.Update(new Group()
            {
                GroupId = groupId,
                FkCreatorId = creatorId,
                Name = groupName,
                Subject = subject,
                Explanation = explanation,
                GroupImagePath = groupImagePath,
                NumberOfMembers = numberOfMembers,
                MeetingDate = Convert.ToDateTime(meetingDate),
                MeetingTime = TimeSpan.Parse(meetingTime),
                MeetingLocation = meetingLocation
            });
            GetGroupDetails(universityId, groupId);
        }

        protected void btnDeleteGroup_OnServerClick(object sender, EventArgs e)
        {
            int groupId = Convert.ToInt32(RouteData.Values["GroupId"]);
            _groupManager.Delete(groupId);
            Response.Redirect("MyGroups.aspx");
        }
        private string GetImagePath(string value)
        {
            var fileName = "";
            var path = "";
            var rootPath = "/ImproveEnglishProject/assets/img/";
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
                        var folder = Server.MapPath(rootPath);
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

        protected void btnSendMesssage_OnServerClick(object sender, EventArgs e)
        {
            string message = "";
            foreach (RepeaterItem item in rptGroupDetail.Items)
            {
                HtmlTextArea box = (HtmlTextArea)item.FindControl("txtMessage");
                message = box.Value;
            }

            _groupNotificationManager.Add(new SentGroupNotification()
            {
                FkFromToUserId = Convert.ToInt32(Session["StudentId"]),
                FkSentToGroupId = Convert.ToInt32(RouteData.Values["GroupId"]),
                Context = message,
                SentDateTime = DateTime.Now
            });
        }
    }
}