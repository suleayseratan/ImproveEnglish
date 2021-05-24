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
        private IRelatonshipRepository _relatonshipRepository;

        public RelationshipManager(IRelatonshipRepository relatonshipRepository)
        {
            this._relatonshipRepository = relatonshipRepository;
        }
        public void Add(Relationship relationship)
        {
            _relatonshipRepository.Add(relationship);
        }
    }
}
