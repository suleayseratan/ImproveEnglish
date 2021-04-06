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
    public partial class ChangePassword : System.Web.UI.Page
    {
        StudentManager _studentManager = new StudentManager(new EfStudentRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }
        private bool CheckPassword(string password, string confirmPassword)
        {
            bool checkIsUpper = false;
            bool checkIsLower = false;
            bool checkIsNumber = false;

            if (password.Equals(confirmPassword))
            {
                foreach (var i in password)
                {
                    if (char.IsUpper(i))
                    {
                        checkIsUpper = true;
                    }
                    else if (char.IsLower(i))
                    {
                        checkIsLower = true;
                    }
                    else if (char.IsNumber(i))
                    {
                        checkIsNumber = true;
                    }
                }

                if (checkIsUpper == true && checkIsLower == true && checkIsNumber == true && password.Length >= 8 &&
                    password.Length <= 15)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }

        }

        protected void btnChangePassword_OnServerClick(object sender, EventArgs e)
        {
            var password = txtPassword.Value;
            var passwordAgain = txtPasswordAgain.Value; 
            CheckPassword(password, passwordAgain);

            Guid activationCode = Guid.Parse(Request.QueryString["ActivationCode"]);
            int studentId = Convert.ToInt32(Request.QueryString["StudentId"]);
            var check = _studentManager.CheckUpdateEmailVeryFied(studentId, activationCode);
            if (check.Equals(true))
            {
                _studentManager.ChagePassword(studentId,password);
                Message("Password changed",true);
                Response.Redirect("Login.aspx");
            }
            else
            {
                Message("Please enter password again.",false);
            }
        }

        private void Message(string message, bool check)
        {
            divMessage.Visible = true;
            divMessage.Attributes.Remove("class");
            if (check.Equals(true))
            {
                divMessage.Attributes.Add("class", "alert alert-success mt-4");
                divMessage.InnerHtml = message;
            }
            else
            {
                divMessage.Attributes.Add("class", "alert alert-danger mt-4");
                divMessage.InnerHtml = message;
            }
        }
    }
}