using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity.Model;

namespace ImproveEnglish.Business.Abstract
{
    public interface IStudentSheduleService
    {
        List<StudentScheduleModel> SearchStudentSheduleByDetaptmetId(int departmentId,int studentId, int universityId,
            string meetingTime, string startTime, string endTime);

        List<StudentScheduleModel> GetStudentAgenda(int studentId);
    }
}
