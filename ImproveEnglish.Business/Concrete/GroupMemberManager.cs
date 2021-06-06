using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.DataAccess.Abstract;

namespace ImproveEnglish.Business.Concrete
{
    public class GroupMemberManager:IGroupMemberService
    {
        private IGroupMemberRepository _groupMemberRepository;
        
        public GroupMemberManager(IGroupMemberRepository groupMemberRepository)
        {
            this._groupMemberRepository = groupMemberRepository;
        }

        public string Add(GroupMember groupMember)
        {
            var isJoined = _groupMemberRepository.GetAll().Where(p =>
                p.FkGroupId == groupMember.FkGroupId && p.FkStudentId == groupMember.FkStudentId).ToList().Count;
            if (isJoined != 0)
            {
                return "You have already joined group";
            }
            else
            {
                _groupMemberRepository.Add(groupMember);
                return "Joined group";
            }
        }
    }
}
