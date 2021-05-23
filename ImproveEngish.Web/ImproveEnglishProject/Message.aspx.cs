using System;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class Message : System.Web.UI.Page
    {
        public string Email;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Session["Email"].ToString()))
            {
                Email = Session["Email"].ToString();
            }
        }
    }
}