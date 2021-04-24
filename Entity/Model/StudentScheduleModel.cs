using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Model
{
    public class StudentScheduleModel
    {
        public int StudentId { get; set; }
        public int NationalityId { get; set; }
        public string NationalityName { get; set; }
        public int UniversityId { get; set; }
        public string UniversityName { get; set; }
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        public string NameSurname { get; set; }
        public string Eposta { get; set; }
        public string ProfileImagePath { get; set; }
        public int ScheduleId { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
        public DateTime MeetingDate { get; set; }
        public bool IsFull { get; set; }


    }
}
