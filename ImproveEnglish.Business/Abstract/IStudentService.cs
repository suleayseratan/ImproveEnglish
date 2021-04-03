using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImproveEnglish.Business.Abstract
{
    public interface IStudentService
    {
        bool Add(int nationalityId,int universityId,int departmentOfUniversityId,string namesurname,string gender,string password,string email,string profilImagePath);
    }
}
