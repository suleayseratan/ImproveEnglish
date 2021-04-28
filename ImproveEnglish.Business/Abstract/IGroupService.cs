using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity.Model;

namespace ImproveEnglish.Business.Abstract
{
    public interface IGroupService
    {
        List<GroupListModel> GetGroups(int universityId,string systemDate, int creatorId);

        List<GroupListModel> SearchGroup(int universityId, string sunject, string meetingDate, string meetingStartTime,
            string meetingEndTime);
        void Add(int creatorId, string name, string subject, string explanation, string groupImagePath,
            int numberOfMembers, string meetingDate, string meetingTime, string meetingLocation);

        List<GroupListModel> GetGroupDetails(int universityId, int groupId);
        List<GroupListModel> GetMyGroups(int universityId, int creatorId);
    }
}
