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
    public class RelationshipManager:IRelationshipService
    {
        private IRelationshipRepository _relationshipRepository;
        public RelationshipManager(IRelationshipRepository relationshipRepository)
        {
            this._relationshipRepository = relationshipRepository;
        }


        public void Add(Relationship relationship)
        {
            var relation = _relationshipRepository.GetAll().Where(p =>
                    (p.FkFromStudentId == relationship.FkFromStudentId && p.FkToUserId == relationship.FkToUserId) ||
                    (p.FkFromStudentId == relationship.FkToUserId && p.FkToUserId == relationship.FkFromStudentId))
                .ToList();
            if (relation.Count == 0)
            {
                _relationshipRepository.Add(relationship);
            }
        }

        public List<Student> GetAll(int studentId)
        {
            var list = _relationshipRepository.GetAllRelationships(studentId);
            return list;
        }
    }
}
