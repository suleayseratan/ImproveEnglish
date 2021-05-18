using System;
using System.Globalization;
using Entity;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class SingleMeetingDetail : System.Web.UI.Page
    {
        private StudentManager _studentManager = new StudentManager(new EfStudentRepository());
        private  StudentScheduleManager _studentScheduleManager = new StudentScheduleManager(new EfStudentScheduleRepository()); 
        RelationshipManager _relationshipManager = new RelationshipManager(new EfRelationshipRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RouteData.Values["StudentId"] != null || Convert.ToInt32(RouteData.Values["StudentId"]) != 0)
            {
                Response.Write(RouteData.Values["StudentId"]);
                if (!IsPostBack)
                {
                    int studentId = Convert.ToInt32(RouteData.Values["StudentId"]);
                    GetStudentDetail(studentId);
                    GetStudentAgenda(studentId);
                }
            }
        }

        private void GetStudentAgenda(int studentId)
        {
            string systemDate = DateTime.Now.ToShortDateString();
            var student = _studentScheduleManager.GetStudentAgenda(studentId,systemDate);
            rptStudentAgenda.DataSource = student;
            rptStudentAgenda.DataBind();
        }

        private void GetStudentDetail(int studentId)
        {
            var student = _studentManager.GetStudentById(studentId);
            rptStudentDetail.DataSource = student;
            rptStudentDetail.DataBind();
        }

        protected void btnSendMessage_OnServerClick(object sender, EventArgs e)
        {
            _relationshipManager.Add(new Relationship()
            {
                FkFromStudentId = Convert.ToInt32(Session["StudentId"]),
                FkToUserId = Convert.ToInt32(RouteData.Values["StudentId"])
            });
        }
    }
}