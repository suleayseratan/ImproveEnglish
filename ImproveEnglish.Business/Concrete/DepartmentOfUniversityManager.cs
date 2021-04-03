using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.DataAccess.Abstract;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEnglish.Business.Concrete
{
    public class DepartmentOfUniversityManager : IDepartmentOfUniversityService
    {
        private IDepartmentOfUniversityRepository _departmentOfUniversityRepository;

        public DepartmentOfUniversityManager(IDepartmentOfUniversityRepository departmentOfUniversityRepository)
        {
            _departmentOfUniversityRepository = departmentOfUniversityRepository;
        }
        public List<DepartmentsOfUniversityModel> GetAllDepartmentOfUniversity(int universityId)
        {
            var list = _departmentOfUniversityRepository.GetAllDepartmentOfUniversity()
                .Where(p => p.UniversityId == universityId).ToList();

            return list;
        }
    }
}
