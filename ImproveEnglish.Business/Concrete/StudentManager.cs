using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Security;
using Entity;
using Entity.Model;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.DataAccess.Abstract;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEnglish.Business.Concrete
{
    public class StudentManager : IStudentService
    {
        private IStudentRepository _studentRepository;

        public StudentManager(IStudentRepository studentRepository)
        {
            _studentRepository = studentRepository;
        }

        public bool Add(Student student)
        {
            var list = _studentRepository.GetByEmail(student.Eposta);

            if (list.Count() == 0)
            {
                _studentRepository.Add(student);
                return true;
            }
            else
            {
                return false;
            }
        }

        public int GetId(string email)
        {
            var student = _studentRepository.GetByEmail(email);
            if (student.Count() == 1)
            {
                foreach (var i in student)
                {
                    return i.StudentId;
                }
            }

            return 0;
        }


        public bool CheckUpdateEmailVeryFied(int id, Guid activationCode)
        {
            var student = _studentRepository.GetById(id);
            if (student.ActivationCode == activationCode)
            {
                _studentRepository.Update(new Student
                {
                    StudentId = id,
                    FkNationalityId = student.FkNationalityId,
                    FkUniversityId = student.FkUniversityId,
                    FkDepartmentId = student.FkDepartmentId,
                    NameSurname = student.NameSurname,
                    Gender = student.Gender,
                    Password = student.Password,
                    Eposta = student.Eposta,
                    ProfileImagePath = student.ProfileImagePath,
                    EmailVeryFied = true,
                    ActivationCode = student.ActivationCode
                });
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool CheckLogin(string email,string password)
        {
            bool check = false;
            string md5Password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
            var student = _studentRepository.GetAll();
            if (student.Count() != 0)
            {
                foreach (var i in student)
                {
                    if (email == i.Eposta && md5Password == i.Password)
                    {
                        check = true;
                    }
                    else
                    {
                        check = false;
                    }
                }

            }

            return check;
        }

        public bool CheckEmailVeryFied(string email)
        {
            var student = _studentRepository.GetByEmail(email);
            foreach (var i in student)
            {
                if (i.EmailVeryFied == true)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                
            }

            return false;
        }

        public List<Student> GetByEmail(string email)
        {
            var list = _studentRepository.GetByEmail(email);
            return list;
        }

        public void ChagePassword(int id,string password)
        {
            var student = _studentRepository.GetById(id);
            string md5Password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
            _studentRepository.Update(new Student
            {
                StudentId = id,
                FkNationalityId = student.FkNationalityId,
                FkUniversityId = student.FkUniversityId,
                FkDepartmentId = student.FkDepartmentId,
                NameSurname = student.NameSurname,
                Gender = student.Gender,
                Password = md5Password,
                Eposta = student.Eposta,
                ProfileImagePath = student.ProfileImagePath,
                EmailVeryFied = student.EmailVeryFied,
                ActivationCode = student.ActivationCode
            });
        }

        public List<StudentDetailModel> GetStudentById(int studentId)
        {
            var list = _studentRepository.GetStudents(studentId).ToList();
            return list;
        }

        public void Update(Student student)
        {
            var list = _studentRepository.GetById(student.StudentId);
            if (list != null)
            {
                _studentRepository.Update(student);
            }
        }

        public List<Student> GetAll()
        {
            var list = _studentRepository.GetAll();
            return list;
        }

        
    }
}
