using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;

namespace ImproveEnglish.Business.Abstract
{
    public interface IRelationshipService
    {
        void Add(Relationship relationship);
        List<Student> GetAll(int studentId);
    }
}
