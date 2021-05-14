using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using ImproveEnglish.DataAccess.Abstract;

namespace ImproveEnglish.DataAccess.Concrete.Ef
{
    public class EfRelationshipRepository: EfGenericRepository<Relationship, ImproveEnglishContext>, IRelationshipRepository
    {
        public List<Student> GetAllRelationships(int studentId)
        {
            using (ImproveEnglishContext context = new ImproveEnglishContext())
            {
                SqlParameter prmStudentId = new SqlParameter("@StudentId", studentId);
                var list = context.Database
                    .SqlQuery<Student>("RelationshipList @StudentId",prmStudentId ).ToList();
                return list;
            }
        }
    }
}
