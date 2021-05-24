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
        List<SingleNotification> GetAll(int studentId);
        void Add(SentNotification sentNotification);
    }
}
