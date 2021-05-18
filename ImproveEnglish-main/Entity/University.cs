using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class University
    {
        [Key]
        public int UniversityId { get; set; }
        public string UniversityName { get; set; }
        public string Eposta { get; set; }
    }
}
