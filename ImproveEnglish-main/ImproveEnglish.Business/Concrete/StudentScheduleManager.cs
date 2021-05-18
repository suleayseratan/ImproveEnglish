using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.DataAccess;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEnglish.Business.Concrete
{
    public class StudentScheduleManager : IStudentSheduleService
    {
        private IStudentScheduleRepository _studentScheduleRepository;
        public StudentScheduleManager(IStudentScheduleRepository studentScheduleRepository)
        {
            _studentScheduleRepository = studentScheduleRepository;
        }
        public List<StudentScheduleModel> SearchStudentSheduleByDetaptmetId(int departmentId, int nationalityId, int studentId, int universityId, string meetingTime,
            string startTime, string endTime)
        {
            var list = _studentScheduleRepository.SearchStudent(universityId, meetingTime, startTime, endTime).Where(p => p.StudentId != studentId && p.NationalityId != nationalityId && p.DepartmentId == departmentId).ToList();
            return list;
        }

        public List<StudentScheduleModel> GetStudentAgenda(int studentId, string systemDate)
        {
            var list = _studentScheduleRepository.GetStudentSchedule(studentId).Where(p => p.MeetingDate >= Convert.ToDateTime(systemDate)).ToList();
            return list;
        }

        public bool Add(StudentSchedule studentSchedule)
        {
            var list = _studentScheduleRepository.GetAll().Where(p =>
                p.FkStudentId == studentSchedule.FkStudentId && p.MeetingDate == studentSchedule.MeetingDate &&
                p.StartTime <= studentSchedule.StartTime && p.EndTime >= studentSchedule.EndTime);
            if (list.Count() == 0)
            {
                _studentScheduleRepository.Add(studentSchedule);
                return true;
            }

            return false;
        }

        public List<StudentSchedule> List(int studentId, string systemDate)
        {

            var list = _studentScheduleRepository.GetAll()
                .Where(p => p.FkStudentId == studentId && p.MeetingDate >= Convert.ToDateTime(systemDate)).ToList();
            return list;
        }

        public void Update(StudentSchedule studentSchedule)
        {
            if (_studentScheduleRepository.GetById(studentSchedule.ScheduleId) != null)
            {
                _studentScheduleRepository.Update(studentSchedule);
            }

        }

        public void Delete(int scheduleId)
        {
            _studentScheduleRepository.Delete(scheduleId);
        }
    }
}
