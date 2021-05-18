﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class Message
    {
        [Key]
        public int MessageId { get; set; }
        public string MessageContent { get; set; }
        public DateTime SentDateTime { get; set; }
    }
}
