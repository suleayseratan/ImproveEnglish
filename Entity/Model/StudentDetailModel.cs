using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Model
{
    public class StudentDetailModel
    {
        public int StudentId { get; set; }
        public int NationalityId { get; set; }
        public string NationalityName { get; set; }
        public int UniversityId { get; set; }
        public string UniversityName { get; set; }
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        public string NameSurname { get; set; }
        public string Gender { get; set; }
        public string Password { get; set; }
        public string Eposta { get; set; }
        public Guid ActivationCode { get; set; }
        public string ProfileImagePath { get; set; }
        public bool EmailVeryFied { get; set; }

    }
}
