using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity.Model;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.DataAccess;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEnglish.Business.Concrete
{
    public class StudentScheduleManager:IStudentSheduleService
    {
        IStudentScheduleRepository _studentScheduleRepository = new EfStudentScheduleRepository();

        public StudentScheduleManager(IStudentScheduleRepository studentScheduleRepository)
        {
            _studentScheduleRepository = studentScheduleRepository;
        }
        public List<StudentScheduleModel> SearchStudentSheduleByDetaptmetId(int departmentId, int studentId, int universityId, string meetingTime,
            string startTime, string endTime)
        {
            var list = _studentScheduleRepository.SearchStudent(universityId, meetingTime, startTime, endTime).Where(p=>p.StudentId != studentId).ToList();
            return (List<StudentScheduleModel>)list;
        }
    }
}
