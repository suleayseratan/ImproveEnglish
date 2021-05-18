using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Model
{
    public class DepartmentsOfUniversityModel
    {
        public int DepartmentId { get; set; }

        public string DepartmentName { get; set; }

        public int DepartmentOfUniversityId { get; set; }

        public int UniversityId { get; set; }

        public string UniversityName { get; set; }
        public string UniversityEposta { get; set; }
    }
}
