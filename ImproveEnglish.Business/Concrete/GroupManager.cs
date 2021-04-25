using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity.Model;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.DataAccess.Abstract;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEnglish.Business.Concrete
{
    public class GroupManager:IGroupService
    {
        private IGroupRepository _groupRepository;

        public GroupManager(IGroupRepository groupRepository)
        {
            this._groupRepository = groupRepository;
        }

        public List<GroupListModel> GetGroups(int universityId,string systemDate)
        {
            var list = _groupRepository.GetGroups(universityId).Where(p=>p.GroupMeetingDate >= Convert.ToDateTime(systemDate)).ToList();
            return list;
        }

        public List<GroupListModel> SearchGroup(int universityId, string subject, string meetingDate, string meetingStartTime, string meetingEndTime)
        {
            var list = _groupRepository.GetGroups(universityId)
                .Where(p => p.GroupMeetingDate >= Convert.ToDateTime(meetingDate)
                            && p.GroupMeetingTime >= TimeSpan.Parse(meetingStartTime)
                            && p.GroupMeetingTime <= TimeSpan.Parse(meetingEndTime) 
                            && p.GroupSubject.Contains(subject)).ToList();
            return list;
        }
    }
}
