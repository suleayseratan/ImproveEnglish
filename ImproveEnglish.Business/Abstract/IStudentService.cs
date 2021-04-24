using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;

namespace ImproveEnglish.Business.Abstract
{
    public interface IStudentService
    {
        bool Add(int nationalityId,int universityId,int departmentOfUniversityId,string namesurname,string gender,string password,string email,string profilImagePath, Guid activationCode);
        int GetId(string email);
        bool CheckUpdateEmailVeryFied(int id, Guid activationCode);
        bool CheckLogin(string email,string password);
        bool CheckEmailVeryFied(string email);
        List<Student> GetByEmail(string email);
        void ChagePassword(int id, string password);
        List<StudentDetailModel> GetStudentById(int studentId);

    }
}
