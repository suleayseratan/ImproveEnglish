using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;

namespace ImproveEnglish.Business.Abstract
{
    public interface ISentGroupNotificationService
    {
        void Add(SentGroupNotification sentGroupNotifiation);
        List<GroupNotificationModel> GetGroupNotifications(int studentId);
    }
}
