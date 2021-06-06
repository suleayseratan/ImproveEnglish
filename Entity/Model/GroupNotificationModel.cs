using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Model
{
    public class GroupNotificationModel
    {
        public string GroupName { get; set; }
        public int GroupId { get; set; }
        public DateTime GroupMeetingDate { get; set; }
        public string GroupMeetingLocation { get; set; }
        public TimeSpan GroupMeetingTime { get; set; }
        public string FromStudentName { get; set; }
        public DateTime NotificationSentDateTime { get; set; }
        public int SentNotificationId { get; set; }
        public string NotificationContext { get; set; }
    }
}
