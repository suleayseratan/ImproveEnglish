using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;
using ImproveEnglish.DataAccess.Abstract;

namespace ImproveEnglish.DataAccess.Concrete.Ef
{
    public class EfGroupRepository : EfGenericRepository<Group, ImproveEnglishContext>, IGroupRepository
    {
        public List<GroupListModel> GetGroups(int universityId)
        {
            using (ImproveEnglishContext context = new ImproveEnglishContext())
            {
                SqlParameter prmUniversityId = new SqlParameter("@UniversityId", universityId);
                var list = context.Database.SqlQuery<GroupListModel>("GroupList @UniversityId", prmUniversityId)
                    .ToList();
                return list;
            }
        }

    }
}
