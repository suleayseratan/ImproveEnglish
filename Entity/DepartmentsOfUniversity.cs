using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class DepartmentsOfUniversity
    {
        [Key]
        public int DepartmentOfUniversityId { get; set; }
        public int FkUniversityId { get; set; }
        [ForeignKey("FkUniversityId")]
        public virtual University University { get; set; }
        public int FkDepartmentId { get; set; }
        [ForeignKey("FkDepartmentId")]
        public virtual Department Department { get; set; }


    }
}
