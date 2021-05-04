using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
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
            string systemDate = DateTime.Now.ToShortDateString();

            int studentId = Convert.ToInt32(Session["StudentId"]);
            string meetingDate = inputDate.Value;
            string startTime = inputStartTime.Value;
            string endTime = inputEndTime.Value;
            bool add = _studentScheduleManager.Add(new StudentSchedule()
            {
                FkStudentId = studentId,
                StartTime = TimeSpan.Parse(startTime),
                EndTime = TimeSpan.Parse(endTime),
                MeetingDate = DateTime.Parse(meetingDate),
                IsFull = false
            });

            if (add.Equals(true))
            {
                Message("Free Time Added",true);
                GetSchedule(studentId,systemDate);
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
            string systemDate = DateTime.Now.ToShortDateString();

            int scheduleId = Convert.ToInt32(txtScheduleId.Value);
            int studentId = Convert.ToInt32(Session["StudentId"]);
            string startTime = mStartTime.Value;
            string endTime = mEndTime.Value;
            string meetingDate = mDate.Value;
            string isFull = radioIsFull.SelectedValue.ToString();

            _studentScheduleManager.Update(new StudentSchedule()
            {
                ScheduleId = scheduleId,
                FkStudentId = studentId,
                StartTime = TimeSpan.Parse(startTime),
                EndTime = TimeSpan.Parse(endTime),
                MeetingDate = DateTime.Parse(meetingDate),
                IsFull = Convert.ToBoolean(isFull)
            });
            GetSchedule(studentId,systemDate);
        }

        protected void btnDelete_OnServerClick(object sender, EventArgs e)
        {
            _studentScheduleManager.Delete(Convert.ToInt32(txtScheduleId));
        }
    }
}