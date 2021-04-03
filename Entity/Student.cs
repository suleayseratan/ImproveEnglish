using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class Student
    {
        [Key]
        public int StudentId { get; set; }
        public int FkNationalityId { get; set; }
        [ForeignKey("FkNationalityId")]
        public virtual Nationality Nationality { get; set; }
        public int FkUniversityId { get; set; }
        [ForeignKey("FkUniversityId")]
        public virtual University University { get; set; }
        public int FkDepartmentId { get; set; }
        [ForeignKey("FkDepartmentId")]
        public virtual Department Department { get; set; }
        public string NameSurname { get; set; }
        public string Gender { get; set; }
        public string Password { get; set; }
        public string Eposta { get; set; }
        public string ProfileImagePath { get; set; }

    }
}
