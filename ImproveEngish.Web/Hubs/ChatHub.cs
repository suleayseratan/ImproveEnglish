using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Entity;
using ImproveEngish.Web.SingleRClasses;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.Hubs
{
    public class ChatHub : Hub
    {
        static List<Student> ConnectedStudent = new List<Student>();
        static List<Message> CurrentMessage = new List<Message>();
        StudentManager _studentManager = new StudentManager(new EfStudentRepository());
        SentMessageManager _sentMessageManager = new SentMessageManager(new EfSentMessageRepository());
        
        public void Send(string name, string message)
        {
            Clients.All.broadcastMessage(name,message);
        }

        public void Connect(string email)
        {
            var connectionId = Context.ConnectionId;
            var student = _studentManager.GetByEmail(email);

            foreach (var s in student)
            {
                if (s.ConnectionId == null)
                {
                    _studentManager.Update(new Student()
                    {
                        StudentId = s.StudentId,
                        FkNationalityId = s.FkNationalityId,
                        FkUniversityId = s.FkUniversityId,
                        FkDepartmentId = s.FkDepartmentId,
                        NameSurname = s.NameSurname,
                        Gender = s.Gender,
                        Password = s.Password,
                        Eposta = s.Eposta,
                        ProfileImagePath = s.ProfileImagePath,
                        EmailVeryFied = s.EmailVeryFied,
                        ActivationCode = s.ActivationCode,
                        ConnectionId = connectionId,
                    });

                    // send to caller
                    Clients.Caller.onConnected(connectionId, s.NameSurname,ConnectedStudent , CurrentMessage);

                    // send to all except caller client
                    Clients.AllExcept(connectionId).onNewUserConnected(connectionId, s.NameSurname);

                }
            }
        }
        public void SendPrivateMessage(string fromUserId,string toUserId, string message)
        {
            var toUser = _studentManager.GetStudentById(Convert.ToInt32(toUserId)).FirstOrDefault();
            var fromUser = _studentManager.GetStudentById(Convert.ToInt32(fromUserId)).FirstOrDefault();

            if (toUser != null && fromUser != null)
            {
                _sentMessageManager.Add(new SentMessage()
                {
                    FkFromToUserId = Convert.ToInt32(fromUserId),
                    FkSentToUserId = Convert.ToInt32(toUserId),
                    MessageContent = message,
                    SentDateTime = DateTime.Now
                });

                // send to 
                Clients.Client(toUser.ConnectionId).sendPrivateMessage(fromUser.ConnectionId, fromUser.NameSurname, message);

                // send to caller user
                Clients.Caller.sendPrivateMessage(toUser.ConnectionId, fromUser.NameSurname, message);
            }

        }

    }
}