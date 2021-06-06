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
        public List<SingleNotificationModel> GetAll(int studentId)
        {
            var list = _sentNotificationRepository.GetSingleNotifications(studentId);
            return list;
        }

        public void Add(SentNotification sentNotification)
        {
            _sentNotificationRepository.Add(sentNotification);
        }

        public List<SingleNotificationModel> GetNotificationDetail(int studentId, int notificationId)
        {
            var notification = _sentNotificationRepository.GetById(notificationId);
            if (notification != null)
            {
                var list = _sentNotificationRepository.GetSingleNotifications(studentId)
                    .Where(p => p.SentNotificationId == notificationId).ToList();
                return list;
            }

            return null;
        }
    }
}
