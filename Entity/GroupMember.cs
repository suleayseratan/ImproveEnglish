using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class GroupMember
    {
        [Key]
        public int GroupMemberId { get; set; }
        public int FkGroupId { get; set; }
        [ForeignKey("FkGroupId")]
        public virtual Group Group { get; set; }
        public int FkStudentId { get; set; }
        [ForeignKey("FkStudentId")]
        public virtual Student Student { get; set; }
    }
}
