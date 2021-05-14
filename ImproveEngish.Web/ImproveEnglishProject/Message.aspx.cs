using System;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.ImproveEnglishProject
{
    public partial class Message : System.Web.UI.Page
    {
        RelationshipManager _relationshipManager = new RelationshipManager(new EfRelationshipRepository());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int studentId = Convert.ToInt32(Session["StudentId"]);
                GetRelationships(studentId);
            }
        }

        private void GetRelationships(int studentId)
        {
            var list = _relationshipManager.GetAll(studentId);
            rptRelationship.DataSource = list;
            rptRelationship.DataBind();
        }

    }
}