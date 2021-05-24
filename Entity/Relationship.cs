using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class Relationship
    {
        public int RelationshipId { get; set; }
        public int FkFromStudentId { get; set; }
        public int FkToStudentId { get; set; }
    }
}
