using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Entity;
using ImproveEngish.Web.SignalRClasses;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEngish.Web.Hubs
{
    public class ChatHub : Hub
    {
        static List<Users> ConnectedUsers = new List<Users>();
        static List<Messages> CurrentMessage = new List<Messages>();
        StudentManager _studentManager = new StudentManager(new EfStudentRepository());
        public void Connect(string email)
        {
            var connectionId = Context.ConnectionId;
            var student = _studentManager.GetByEmail(email).FirstOrDefault();
            string logintime = DateTime.Now.ToString();


            if (!String.IsNullOrEmpty(student.ConnectionId))
            {
                ConnectedUsers.Add(new Users { Id = student.StudentId, ConnectionId = student.ConnectionId, UserName = student.NameSurname, UserImage = student.ProfileImagePath, LoginTime = logintime });
                // send to caller
                Clients.Caller.onConnected(student.StudentId, student.NameSurname, ConnectedUsers, CurrentMessage);

                // send to all except caller client
                Clients.AllExcept(student.ConnectionId).onNewUserConnected(student.StudentId,student.ConnectionId, student.NameSurname, student.ProfileImagePath, logintime);
            }
            else if (String.IsNullOrEmpty(student.ConnectionId))
            {

                _studentManager.Update(new Student()
                {
                    StudentId = student.StudentId,
                    FkNationalityId = student.FkNationalityId,
                    FkUniversityId = student.FkUniversityId,
                    FkDepartmentId = student.FkDepartmentId,
                    NameSurname = student.NameSurname,
                    Gender = student.Gender,
                    Password = student.Password,
                    Eposta = student.Eposta,
                    ProfileImagePath = student.ProfileImagePath,
                    EmailVeryFied = student.EmailVeryFied,
                    ActivationCode = student.ActivationCode,
                    ConnectionId = connectionId,
                });

                ConnectedUsers.Add(new Users {Id = student.StudentId, ConnectionId = connectionId, UserName = student.NameSurname, UserImage = student.ProfileImagePath, LoginTime = logintime });
                // send to caller
                Clients.Caller.onConnected(connectionId, student.NameSurname, ConnectedUsers, CurrentMessage);

                // send to all except caller client
                Clients.AllExcept(connectionId).onNewUserConnected(student.StudentId, connectionId, student.NameSurname, student.ProfileImagePath, logintime);
            }
        }
        public void SendMessageToAll(string userName, string message, string time)
        {
            string UserImg = "ImproveEnglishProject/assets/img/avataaars.png";
            // store last 100 messages in cache
            AddMessageinCache(userName, message, time, UserImg);

            // Broad cast message
            Clients.All.messageReceived(userName, message, time, UserImg);
        }
        private void AddMessageinCache(string userName, string message, string time, string UserImg)
        {
            CurrentMessage.Add(new Messages { UserName = userName, Message = message, Time = time, UserImage = UserImg });

            if (CurrentMessage.Count > 100)
                CurrentMessage.RemoveAt(0);

        }
        public override System.Threading.Tasks.Task OnDisconnected(bool stopCalled)
        {
            var item = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);
            if (item != null)
            {
                ConnectedUsers.Remove(item);

                var id = Context.ConnectionId;
                Clients.All.onUserDisconnected(id, item.UserName);

            }
            return base.OnDisconnected(stopCalled);
        }

        public void SendPrivateMessage(string email, string toUserConnectionId, string message)
        {

            string fromUserConnectionId = _studentManager.GetByEmail(email).FirstOrDefault().ConnectionId;
            //int toUserId = _studentManager.GetAll().FirstOrDefault(x => x.ConnectionId == toUserConnectionId).StudentId;


            var toUser = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == toUserConnectionId);
            var fromUser = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == fromUserConnectionId);

            if (toUser != null && fromUser != null)
            {
                string CurrentDateTime = DateTime.Now.ToString();
                string UserImg = "ImproveEnglishProject/assets/img/avataaars.png";
                // send to 
                Clients.Client(toUserConnectionId).sendPrivateMessage(fromUserConnectionId, fromUser.UserName, message, UserImg, CurrentDateTime);

                // send to caller user
                Clients.Caller.sendPrivateMessage(toUser.Id,toUserConnectionId, fromUser.UserName, message, UserImg, CurrentDateTime);
            }

        }

    }
}