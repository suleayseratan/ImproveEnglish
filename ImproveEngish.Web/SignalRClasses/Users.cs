using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImproveEngish.Web.SignalRClasses
{
    public class Users
    {
        public int Id { get; set; }
        public string ConnectionId { get; set; }
        public string UserName { get; set; }
        public string UserImage { get; set; }
        public string LoginTime { get; set; }
    }
}