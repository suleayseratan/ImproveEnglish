using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class SentNotification
    {
        [Key]
        public int SentNotificationId { get; set; }
        public int FkFromToUserId { get; set; }
        [ForeignKey("FkFromToUserId")]
        public virtual Student Student { get; set; }
        public int FkSentToUserId { get; set; }
        [ForeignKey("FkSentToUserId")]
        public virtual Student Student2 { get; set; }
        public int FkMessageId { get; set; }

    }
}
