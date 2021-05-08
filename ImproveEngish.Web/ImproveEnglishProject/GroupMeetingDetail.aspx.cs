using System;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class GroupMeetingDetail : System.Web.UI.Page
    {
        GroupManager _groupManager = new GroupManager(new EfGroupRepository());
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
    }
}