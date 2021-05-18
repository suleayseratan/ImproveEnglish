using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;

namespace ImproveEnglish.DataAccess.Abstract
{
    public interface IDepartmentOfUniversityRepository:IRepository<DepartmentsOfUniversity>
    {
        List<DepartmentsOfUniversityModel> GetAllDepartmentOfUniversity();
    }
}
