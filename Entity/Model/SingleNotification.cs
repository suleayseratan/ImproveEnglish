using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Model
{
    public class SingleNotification
    {
        public int SentNotificationId { get; set; }
        public int FromStudentId { get; set; }
        public string FromNameSurname { get; set; }
        public string FromStudentImage { get; set; }    
        public int ToStudentId { get; set; }
        public string ToNameSurname { get; set; }
        public string MessageContent { get; set; }
        public DateTime SentDateTime { get; set; }
    }
}
