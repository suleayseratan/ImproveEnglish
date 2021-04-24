using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using Entity;
using Entity.Model;
using ImproveEnglish.DataAccess.Abstract;

namespace ImproveEnglish.DataAccess.Concrete.Ef
{
    public class EfStudentScheduleRepository : EfGenericRepository<StudentSchedule, ImproveEnglishContext>, IStudentScheduleRepository
    {
        public List<StudentScheduleModel> SearchStudent(int universityId, string meetingTime, string startTime, string endTime)
        {
            DateTime mDate = Convert.ToDateTime(meetingTime);
            TimeSpan sTime = TimeSpan.Parse(startTime);
            TimeSpan eTime = TimeSpan.Parse(endTime);
            using (ImproveEnglishContext context = new ImproveEnglishContext())
            {
                SqlParameter prmUniversityId = new SqlParameter("@UniversityId", universityId);
                SqlParameter prmMeetingDate = new SqlParameter("@MeetingDate", mDate);
                SqlParameter prmStartTime = new SqlParameter("@StartTime", sTime);
                SqlParameter prmEndTime = new SqlParameter("@EndTime", eTime);
                var list = context.Database
                    .SqlQuery<StudentScheduleModel>("StudentSchedule @UniversityId,@MeetingDate,@StartTime,@EndTime", prmUniversityId,prmMeetingDate,prmStartTime,prmEndTime).ToList();
                return list;
            }

        }

        //public List<StudentScheduleModel> GetStudentSchedule(int studentId)
        //{
        //    using (ImproveEnglishContext context = new ImproveEnglishContext())
        //    {
        //        var list = (from ss in context.StudentSchedules
        //            join s in context.Students on ss.FkStudentId equals  s.StudentId
        //            where ss.FkStudentId == studentId 
        //            select new
        //            {
        //                SheduleId = ss.ScheduleId,
        //                MeetingDate = ss.MeetingDate,
        //                StartTime = ss.StartTime,
        //                EndTime = ss.EndTime,
        //                IsFull = ss.IsFull
        //            }).ToList();
        //        return list;
        //    }
        //}
    }
}
