using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class SentGroupMessage
    {
        [Key]
        public int SentMessageId { get; set; }
        public int FkFromToUserId { get; set; }
        [ForeignKey("FkFromToUserId")]
        public virtual Student Student { get; set; }
        public int FkSentToGroupId { get; set; }
        [ForeignKey("FkSentToGroupId")]
        public virtual Student Student2 { get; set; }
        public int FkMessageId { get; set; }
        [ForeignKey("FkMessageId")]
        public virtual Message Message { get; set; }
    }
}
