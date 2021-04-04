using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using Entity;
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
    }
}
