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
        bool Add(Student student);
        int GetId(string email);
        bool CheckUpdateEmailVeryFied(int id, Guid activationCode);
        bool CheckLogin(string email,string password);
        bool CheckEmailVeryFied(string email);
        List<Student> GetByEmail(string email);
        void ChagePassword(int id, string password);
        List<StudentDetailModel> GetStudentById(int studentId);
        void Update(Student student);

    }
}
