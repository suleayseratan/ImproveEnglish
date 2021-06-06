using System;
using System.Data.Entity.Core.Metadata.Edm;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Entity;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class GroupMeetingDetail : System.Web.UI.Page
    {
        GroupManager _groupManager = new GroupManager(new EfGroupRepository());
        GroupMemberManager _groupMemberManager = new GroupMemberManager(new EfGroupMemberRepository());
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
        }

        protected void btnJoinGroup_OnServerClick(object sender, EventArgs e)
        {
            var message = _groupMemberManager.Add(new GroupMember()
            {
                FkGroupId = Convert.ToInt32(RouteData.Values["GroupId"]),
                FkStudentId = Convert.ToInt32(Session["StudentId"])
            });
            foreach (RepeaterItem item in rptGroupDetail.Items)
            {
                HtmlGenericControl box = (HtmlGenericControl)item.FindControl("divMessage");
                box.InnerHtml = message;
                box.Visible = true;
                if (message == "Joined group")
                {
                    box.Attributes.Remove("class");
                    box.Attributes.Add("class", "alert alert-success mt-4 w-100 text-center");
                }
            }
        }
    }
}