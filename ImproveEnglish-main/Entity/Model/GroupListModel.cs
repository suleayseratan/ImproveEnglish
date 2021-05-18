using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Model
{
    public class GroupListModel
    {
        public int GroupId { get; set; }
        public string GroupName { get; set; }
        public string GroupSubject { get; set; }
        public string GroupExplanation { get; set; }
        public string GroupImagePath { get; set; }
        public int NumberOfGroupMembers { get; set; }
        public DateTime GroupMeetingDate { get; set; }
        public TimeSpan GroupMeetingTime { get; set; }
        public string GroupMeetingLocation { get; set; }
        public int CreatorId { get; set; }
        public string CreatorNameSurname { get; set; }
        public string CreatorImagePath { get; set; }

    }
}
