using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class Relationship
    {
        [Key]
        public int RelationshipId { get; set; }
        public int FkFromStudentId { get; set; }

        [ForeignKey("FkFromStudentId")]
        public virtual Student Student { get; set; }
        public int FkToStudentId { get; set; }
        [ForeignKey("FkToStudentId")]
        public virtual Student Student2 { get; set; }
    }
}
