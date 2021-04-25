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
        List<GroupListModel> GetGroups(int universityId,string systemDate);

        List<GroupListModel> SearchGroup(int universityId, string sunject, string meetingDate, string meetingStartTime,
            string meetingEndTime);
    }
}
