using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.DataAccess.Abstract;

namespace ImproveEnglish.Business.Concrete
{
    public class MessageManager:IMessageService
    {
        private IMessageRepository _messageRepository;

        public MessageManager(IMessageRepository messageRepository)
        {
            this._messageRepository = messageRepository;
        }
        public void Add(Message message)
        {
            _messageRepository.Add(message);
        }
    }
}
