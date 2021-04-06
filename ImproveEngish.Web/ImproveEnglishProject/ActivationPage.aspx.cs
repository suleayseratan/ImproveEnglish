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
    public partial class ActivationPage : System.Web.UI.Page
    {
        StudentManager _studentManager = new StudentManager(new EfStudentRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Guid activationCode = Guid.Parse(Request.QueryString["ActivationCode"]);
                int studentId = Convert.ToInt32(Request.QueryString["StudentId"]);
                var check = _studentManager.CheckUpdateEmailVeryFied(studentId, activationCode);
                if (check.Equals(true))
                {
                    lblMessage.Text = "Your account has been activated.";
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblMessage.Text = "Your account has not been activated.";
                }
            }

        }
    }
}