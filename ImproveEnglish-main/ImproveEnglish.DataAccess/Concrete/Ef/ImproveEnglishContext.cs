using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;

namespace ImproveEnglish.DataAccess.Concrete.Ef
{
    public class ImproveEnglishContext:DbContext
    {
        public DbSet<Department> Departments { get; set; }
        public DbSet<DepartmentsOfUniversity> DepartmentsOfUniversities { get; set; }
        public DbSet<Group> Groups { get; set; }
        public DbSet<GroupMember> GroupMembers { get; set; }
        public DbSet<Menu> Menus { get; set; }
        public DbSet<Message> Messages { get; set; }
        public DbSet<Nationality> Nationalities { get; set; }
        public DbSet<SentGroupMessage> SentGroupMessages { get; set; }
        public DbSet<SentMessage> SentMessages { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<StudentSchedule> StudentSchedules { get; set; }
        public DbSet<University> Universities { get; set; }
        public DbSet<Relationship> Relationships { get; set; }


    }
}
