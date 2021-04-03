using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class Nationality
    {
        [Key]
        public int NationalityId { get; set; }
        public string NationalityName { get; set; }
    }
}
