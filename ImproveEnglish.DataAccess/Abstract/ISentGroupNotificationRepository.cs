using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;

namespace ImproveEnglish.DataAccess.Abstract
{
    public interface ISentGroupNotificationRepository:IRepository<SentGroupNotification>
    {
        List<GroupNotificationModel> GetAll(int strudentId);
    }
}
