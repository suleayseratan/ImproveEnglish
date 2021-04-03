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
    public class NationalityManager:INationalityService
    {
        private INationalityRepository _nationalityRepository;

        public NationalityManager(INationalityRepository nationalityRepository)
        {
            this._nationalityRepository = nationalityRepository;
        }


        public List<Nationality> GetAll()
        {
            var list = _nationalityRepository.GetAll();
            return list;
        }
    }
}
