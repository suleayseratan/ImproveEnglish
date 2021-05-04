using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;

namespace ImproveEnglish.Business.Abstract
{
    public interface IStudentSheduleService
    {
        List<StudentScheduleModel> SearchStudentSheduleByDetaptmetId(int departmentId, int nationalityId, int studentId, int universityId,
            string meetingTime, string startTime, string endTime);

        List<StudentScheduleModel> GetStudentAgenda(int studentId,string systemDate);
        bool Add(StudentSchedule studentSchedule);
        List<StudentSchedule> List(int studentId, string systemDate);
        void Update(StudentSchedule studentSchedule);
        void Delete(int scheduleId);
    }
}
