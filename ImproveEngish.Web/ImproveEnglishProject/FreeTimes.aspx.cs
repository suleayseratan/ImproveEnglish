using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class FreeTimes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddFreeTime_OnServerClick(object sender, EventArgs e)
        {
            int studentId = Convert.ToInt32(Session["StudentId"]);
            string date = inputDate.Value;
            string startTime = inputStartTime.Value;
            string endTime = inputEndTime.Value;
            
        }
    }
}