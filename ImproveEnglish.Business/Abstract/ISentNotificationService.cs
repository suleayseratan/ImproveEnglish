using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;

namespace ImproveEnglish.Business.Abstract
{
    public interface ISentNotificationService
    {
        List<SingleNotificationModel> GetAll(int studentId);
        void Add(SentNotification sentNotification);
        List<SingleNotificationModel> GetNotificationDetail(int studentId, int notificationId);
    }
}
