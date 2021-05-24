using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.DataAccess.Abstract;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEnglish.Business.Concrete
{
    public class SentNotificationManager:ISentNotificationService
    {
        ISentNotificationRepository _sentNotificationRepository;
        public SentNotificationManager(ISentNotificationRepository sentNotificationRepository)
        {
            this._sentNotificationRepository = sentNotificationRepository;
        }
        public List<SingleNotification> GetAll(int studentId)
        {
            var list = _sentNotificationRepository.GetSingleNotifications(studentId);
            return list;
        }

        public void Add(SentNotification sentNotification)
        {
            _sentNotificationRepository.Add(sentNotification);
        }
    }
}
