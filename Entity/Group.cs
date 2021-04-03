using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class Group
    {
        [Key]
        public int GroupId { get; set; }
        public string Name { get; set; }
        public string Subject { get; set; }
        public string Explanation { get; set; }
        public string GroupImagePath { get; set; }
        public int NumberOfMembers { get; set; }
        public DateTime MeetingDate { get; set; }
        public TimeSpan MeetingTime { get; set; }
        public string MeetingLocation { get; set; }
    }
}
