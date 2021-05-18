using System;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class Page : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["NameSurname"]))
            {
                Response.Redirect("/ImproveEnglishProject/Login.aspx");
            }
        }

        protected void btnLogout_OnServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/ImproveEnglishProject/Login.aspx");
        }
    }
}