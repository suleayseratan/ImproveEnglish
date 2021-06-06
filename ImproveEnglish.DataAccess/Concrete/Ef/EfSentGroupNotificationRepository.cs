using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;
using ImproveEnglish.DataAccess.Abstract;

namespace ImproveEnglish.DataAccess.Concrete.Ef
{
    public class EfSentGroupNotificationRepository:EfGenericRepository<SentGroupNotification,ImproveEnglishContext>, ISentGroupNotificationRepository
    {
        public List<GroupNotificationModel> GetAll(int studentId)
        {
            using (ImproveEnglishContext context = new ImproveEnglishContext())
            {
                SqlParameter prmStudentId = new SqlParameter("@StudentId", studentId);
                var list = context.Database
                    .SqlQuery<GroupNotificationModel>("GroupNotification @StudentId", prmStudentId).ToList();
                return list;
            }
        }
    }
}
