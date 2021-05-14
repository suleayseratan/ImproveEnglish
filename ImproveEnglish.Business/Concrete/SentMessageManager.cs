using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.DataAccess.Abstract;
using ImproveEnglish.DataAccess.Concrete.Ef;

namespace ImproveEnglish.Business.Concrete
{
    public class SentMessageManager:ISentMessageService
    {
        private ISentMessageRepository _sentMessageRepository;

        public SentMessageManager(ISentMessageRepository sentMessageRepository)
        {
            this._sentMessageRepository = sentMessageRepository;
        }


        public void Add(SentMessage sentMessage)
        {
            _sentMessageRepository.Add(sentMessage);
        }
    }
}
