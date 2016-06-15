using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Vanaraha.BusinessEntities
{
    [Serializable]
    [DataContract(IsReference = true)]
    public class ItemLinkEntity
    {
        [DataMember]
        public long Id { get; set; }
        [DataMember]
        public int ItemId { get; set; }
        [DataMember]
        public string LinkUrl { get; set; }
        [DataMember]
        public string ItemLinkName { get; set; }
        [DataMember]
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        [DataMember]
        public string UpdatedBy { get; set; }
        [DataMember]
        public System.DateTime CreatedDate { get; set; }
        [DataMember]
        public string CreatedBy { get; set; }

        private string _timeSince;
        [DataMember]
        public string TimeSince
        {
            get
            {
                TimeSpan timeSince = DateTime.Now.Subtract(CreatedDate);
                if (timeSince.TotalMilliseconds < 1) return "not yet";
                if (timeSince.TotalMinutes < 1) return "just now";
                if (timeSince.TotalMinutes < 2) return "1 minute ago";
                if (timeSince.TotalMinutes < 60) return string.Format("{0} minutes ago", timeSince.Minutes);
                if (timeSince.TotalMinutes < 120) return "1 hour ago";
                if (timeSince.TotalHours < 24) return string.Format("{0} hours ago", timeSince.Hours);
                if (timeSince.TotalDays < 2) return "yesterday";
                if (timeSince.TotalDays < 7) return string.Format("{0} days ago", timeSince.Days);
                if (timeSince.TotalDays < 14) return "last week";
                if (timeSince.TotalDays < 21) return "2 weeks ago";
                if (timeSince.TotalDays < 28) return "3 weeks ago";
                if (timeSince.TotalDays < 60) return "last month";
                if (timeSince.TotalDays < 365) return string.Format("{0} months ago", Math.Round(timeSince.TotalDays / 30));
                if (timeSince.TotalDays < 730) return "last year"; //last but not least...
                return string.Format("{0} years ago", Math.Round(timeSince.TotalDays / 365));
            }
            set
            {
                _timeSince = value;
            }
        }

        //[DataMember]
        //public virtual ItemEntity Item { get; set; }
    }
}
