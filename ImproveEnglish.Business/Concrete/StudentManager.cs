using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.DataAccess.Abstract;

namespace ImproveEnglish.Business.Concrete
{
    public class StudentManager:IStudentService
    {
        private IStudentRepository _studentRepository;

        public StudentManager(IStudentRepository studentRepository)
        {
            _studentRepository = studentRepository;
        }
        
    }
}
