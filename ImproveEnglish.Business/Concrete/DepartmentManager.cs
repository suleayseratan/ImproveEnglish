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
    public class DepartmentManager:IDepartmentService
    {
        // Dependency injection 
        private IDepartmentRepository _departmentRepository;

        public DepartmentManager(IDepartmentRepository departmentRepository)
        {
            _departmentRepository = departmentRepository;
        }

        public List<Department> GetAll()
        {
            var list = _departmentRepository.GetAll();
            return list;
        }
    }
}
