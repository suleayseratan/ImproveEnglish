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
    public class EfSentNotificationRepository:EfGenericRepository<SentNotification,ImproveEnglishContext>, ISentNotificationRepository
    {
        public List<SingleNotificationModel> GetSingleNotifications(int studentId)
        {
            using (ImproveEnglishContext context = new ImproveEnglishContext())
            {
                SqlParameter prmStudentId = new SqlParameter("@StudentId", studentId);
                var list = context.Database
                    .SqlQuery<SingleNotificationModel>("SingleNotification @StudentId", prmStudentId).ToList();
                return list;
            }
        }
    }
}
