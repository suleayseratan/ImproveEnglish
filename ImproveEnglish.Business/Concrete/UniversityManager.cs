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
    public class UniversityManager:IUniversityService
    {
        private IUniversityRepository _universityRepository;

        public UniversityManager(IUniversityRepository universityRepository)
        {
            _universityRepository = universityRepository;
        }

        public List<University> GetAll()
        {
            var universityList = _universityRepository.GetAll();
            return universityList;
        }

        public void Remove(int id)
        {
            var entity = _universityRepository.GetById(id);
            if (entity!= null)
            {
                _universityRepository.Delete(id);
            }
        }
    }
}
