using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class StudentSchedule
    {
        [Key]
        public int ScheduleId { get; set; }
        public int FkStudentId { get; set; }
        [ForeignKey("FkStudentId")]
        public virtual Student Student { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
        public DateTime MeetingDate { get; set; }
        public bool IsFull { get; set; }
    }
}
