﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entity
{
    public class RequestView
    {
        public int RequestId { get; set; }
        public int ApartmentId { get; set; }
        public int PackageRequestedId { get; set; }
        public int OwnerId { get; set; }

        public string? RequestDescription { get; set; }

        public DateTime BookDateTime { get; set; }

        public DateTime EndDateTime { get; set; }

        public bool? IsSequence { get; set; }

        public int? RequestSequence { get; set; }

        public string ReqStatus { get; set; }

        public int NumberOfAddOns { get; set; }
    }
}
