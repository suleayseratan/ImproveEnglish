using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.DataAccess.Abstract;
using ImproveEnglish.DataAccess.Concrete.Ef;
using Unity.Registration;

namespace ImproveEnglish.Business.Concrete
{
    public class GroupManager:IGroupService
    {
        private IGroupRepository _groupRepository;

        public GroupManager(IGroupRepository groupRepository)
        {
            this._groupRepository = groupRepository;
        }

        public List<GroupListModel> GetGroups(int universityId,string systemDate, int creatorId)
        {
            var list = _groupRepository.GetGroups(universityId).Where(p => p.GroupMeetingDate >= Convert.ToDateTime(systemDate) && p.CreatorId != creatorId).ToList();
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

        public void Add(Group group)
        {
            try
            {
                _groupRepository.Add(group);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
            
        }

        public List<GroupListModel> GetGroupDetails(int universityId, int groupId)
        {
            var list = _groupRepository.GetGroups(universityId).Where(p => p.GroupId == groupId).ToList();
            return list;
        }

        public List<GroupListModel> GetMyGroups(int universityId, int creatorId)
        {
            var list = _groupRepository.GetGroups(universityId).Where(p => p.CreatorId == creatorId).ToList();
            return list;
        }

        public void Update(Group group)
        {
            if (_groupRepository.GetById(group.GroupId) != null)
            {
                _groupRepository.Update(group);
            }
        }

        public void Delete(int groupId)
        {
            _groupRepository.Delete(groupId);
        }
    }
}
