using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using Entity;
using Entity.Model;
using ImproveEnglish.DataAccess.Abstract;

namespace ImproveEnglish.DataAccess.Concrete.Ef
{
    public class EfStudentRepository:EfGenericRepository<Student,ImproveEnglishContext>, IStudentRepository
    {
        public List<Student> GetByEmail(string email)
        {
            using (ImproveEnglishContext context = new ImproveEnglishContext())
            {
                var list = (from s in context.Students where s.Eposta == email select s).ToList();
                return list;
            }
        }

        public List<StudentDetailModel> GetStudents(int studentId)
        {
            using (ImproveEnglishContext context =new ImproveEnglishContext())
            {
                var list = context.Database.SqlQuery<StudentDetailModel>("Select * From V_StudentDetails")
                    .Where(p=>p.StudentId == studentId).ToList();
                return list;
            }
        }

    }
}
