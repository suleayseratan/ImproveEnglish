using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;

namespace ImproveEnglish.Business.Abstract
{
    public interface IDepartmentService
    {
        List<Department> GetAll();
    }
}
