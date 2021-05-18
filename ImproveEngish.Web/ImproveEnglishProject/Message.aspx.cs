using System;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class Message : System.Web.UI.Page
    {
        public string UserName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Session["NameSurname"].ToString()))
            {
                UserName = Session["NameSurname"].ToString();
            }
        }
    }
}