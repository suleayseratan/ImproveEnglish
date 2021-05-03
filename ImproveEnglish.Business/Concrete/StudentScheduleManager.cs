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
    public class StudentScheduleManager:IStudentSheduleService
    {
        private IStudentScheduleRepository _studentScheduleRepository;
        public StudentScheduleManager(IStudentScheduleRepository studentScheduleRepository)
        {
            _studentScheduleRepository = studentScheduleRepository;
        }
        public List<StudentScheduleModel> SearchStudentSheduleByDetaptmetId(int departmentId,int nationalityId, int studentId, int universityId, string meetingTime,
            string startTime, string endTime)
        {
            var list = _studentScheduleRepository.SearchStudent(universityId, meetingTime, startTime, endTime).Where(p=>p.StudentId != studentId && p.NationalityId != nationalityId && p.DepartmentId == departmentId).ToList();
            return (List<StudentScheduleModel>)list;
        }

        public List<StudentScheduleModel> GetStudentAgenda(int studentId,string systemDate)
        {
            var list = _studentScheduleRepository.GetStudentSchedule(studentId).Where(p=>p.MeetingDate >= Convert.ToDateTime(systemDate)).ToList();
            return list;
        }

        public bool Add(int studentId,string meetingDate, string meetingStartTime, string meetingEndTime)
        {
            var list = _studentScheduleRepository.GetAll().Where(p =>
                p.FkStudentId == studentId && p.MeetingDate == DateTime.Parse(meetingDate) &&
                p.StartTime <= TimeSpan.Parse(meetingStartTime) && p.EndTime >= TimeSpan.Parse(meetingEndTime));
            if (list.Count() == 0)
            {
                _studentScheduleRepository.Add(new StudentSchedule()
                {
                    FkStudentId = studentId,
                    MeetingDate = DateTime.Parse(meetingDate),
                    StartTime = TimeSpan.Parse(meetingStartTime),
                    EndTime = TimeSpan.Parse(meetingEndTime),
                    IsFull = false
                });
                return true;
            }

            return false;
        }

        public List<StudentSchedule> List(int studentId, string systemDate)
        {
            var list =_studentScheduleRepository.GetAll()
                .Where(p => p.FkStudentId == studentId && p.MeetingDate >= Convert.ToDateTime(systemDate)).ToList();
            return list;
        }

        public void Update(int scheduleId, int studentId, string startTime, string endTime, string meetingDate, string isFull)
        {
            _studentScheduleRepository.Update(new StudentSchedule()
            {
                ScheduleId = scheduleId,
                FkStudentId = studentId,
                StartTime = TimeSpan.Parse(startTime),
                EndTime = TimeSpan.Parse(endTime),
                MeetingDate = DateTime.Parse(meetingDate),
                IsFull = Convert.ToBoolean(isFull)
            });
        }

        public void Delete(int scheduleId)
        {
            _studentScheduleRepository.Delete(scheduleId);
        }
    }
}
