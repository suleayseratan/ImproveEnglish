using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;
using ImproveEnglish.DataAccess.Abstract;

namespace ImproveEnglish.DataAccess
{
    public interface IStudentScheduleRepository:IRepository<StudentSchedule>
    {
        List<StudentScheduleModel> SearchStudent(int universityId, string meetingTime, string startTime, string endTime);
        List<StudentScheduleModel> GetStudentSchedule(int studentId);
    }
}
