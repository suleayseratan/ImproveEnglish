﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using ImproveEnglish.DataAccess.Abstract;

namespace ImproveEnglish.DataAccess.Concrete.Ef
{
    public class EfSentGroupMessageRepository:EfGenericRepository<SentGroupNotifiation,ImproveEnglishContext>, ISentGroupMessageRepository
    {
    }
}
