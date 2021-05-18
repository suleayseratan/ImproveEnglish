using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;
using ImproveEnglish.DataAccess.Abstract;

namespace ImproveEnglish.DataAccess.Concrete.Ef
{
    public class EfDepartmentOfUniversityRepository : EfGenericRepository<DepartmentsOfUniversity, ImproveEnglishContext>, IDepartmentOfUniversityRepository
    {
        public List<DepartmentsOfUniversityModel> GetAllDepartmentOfUniversity()
        {
            using (ImproveEnglishContext context = new ImproveEnglishContext())
            {
                var departmentList = (from u in context.Universities
                    join du in context.DepartmentsOfUniversities on u.UniversityId equals du.FkUniversityId
                    join d in context.Departments on du.FkDepartmentId equals d.DepartmentId

                    select new DepartmentsOfUniversityModel
                    {
                        DepartmentId = d.DepartmentId,
                        DepartmentName = d.DepartmentName,
                        DepartmentOfUniversityId = du.DepartmentOfUniversityId,
                        UniversityId = u.UniversityId,
                        UniversityName = u.UniversityName,
                        UniversityEposta = u.Eposta
                    }).ToList();
                return departmentList;
            }
        }
    }
}
