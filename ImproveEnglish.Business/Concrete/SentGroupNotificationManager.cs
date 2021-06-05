using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.DataAccess.Abstract;

namespace ImproveEnglish.Business.Concrete
{
    public class SentGroupNotificationManager:ISentGroupNotificationService
    {
        private ISentGroupNotificationRepository _groupNotificationRepository;
        public SentGroupNotificationManager(ISentGroupNotificationRepository sentGroupNotificationRepository)
        {
            this._groupNotificationRepository = sentGroupNotificationRepository;
        }


        public void Add(SentGroupNotification sentGroupNotifiation)
        {
            _groupNotificationRepository.Add(sentGroupNotifiation);
        }
    }
}
