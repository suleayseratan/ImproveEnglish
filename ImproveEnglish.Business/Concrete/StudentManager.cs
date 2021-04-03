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
    public class StudentManager : IStudentService
    {
        private IStudentRepository _studentRepository;

        public StudentManager(IStudentRepository studentRepository)
        {
            _studentRepository = studentRepository;
        }

        public bool Add(int nationalityId, int universityId, int departmentOfUniversityId, string namesurname, string gender,
            string password, string email, string profilImagePath)
        {
            var list = _studentRepository.GetAll().Where(p => p.Eposta == email);

            if (list.Count() == 0)
            {
                _studentRepository.Add(new Student()
                {
                    FkNationalityId = nationalityId,
                    FkUniversityId = universityId,
                    FkDepartmentId = departmentOfUniversityId,
                    NameSurname = namesurname,
                    Gender = gender,
                    Password = password,
                    Eposta = email,
                    ProfileImagePath = profilImagePath
                });
                return true;
            }
            else
            {
                return false;
            }

        }
    }
}
