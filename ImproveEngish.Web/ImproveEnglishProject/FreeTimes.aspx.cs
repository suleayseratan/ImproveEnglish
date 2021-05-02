using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class FreeTimes : System.Web.UI.Page
    {
        StudentScheduleManager _studentScheduleManager = new StudentScheduleManager(new EfStudentScheduleRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int studentId = Convert.ToInt32(Session["StudentId"]);
                string systemDate = DateTime.Now.ToShortDateString();
                GetSchedule(studentId,systemDate);
            }
        }

        private void GetSchedule(int studentId, string systemDate)
        {
            var list = _studentScheduleManager.List(studentId, systemDate);
            rptStudentAgenda.DataSource = list;
            rptStudentAgenda.DataBind();
        }

        protected void btnAddFreeTime_OnServerClick(object sender, EventArgs e)
        {
            int studentId = Convert.ToInt32(Session["StudentId"]);
            string date = inputDate.Value;
            string startTime = inputStartTime.Value;
            string endTime = inputEndTime.Value;
            bool add = _studentScheduleManager.Add(studentId, date, startTime, endTime);
            if (add.Equals(true))
            {
                Message("Free Time Added",true);
            }
            else
            {
                Message("This schedule already exists", false);
            }
        }

        private void Message(string message, bool check)
        {
            divMessage.Visible = true;
            divMessage.Attributes.Remove("class");
            if (check.Equals(true))
            {
                divMessage.Attributes.Add("class", "alert alert-success mt-3 w-50");
                divMessage.Attributes.Add("style", "margin-left: 30%");
                divMessage.InnerHtml = message;
            }
            else
            {
                divMessage.Attributes.Add("class", "alert alert-danger mt-3 w-50");
                divMessage.InnerHtml = message;
            }
        }

        protected void btnUpdate_OnServerClick(object sender, EventArgs e)
        {
            
        }
    }
}