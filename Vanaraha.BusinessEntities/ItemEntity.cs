using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Vanaraha.BusinessEntities
{
    [Serializable]
    [DataContract(IsReference = true)]
    public class ItemEntity
    {
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public int TopicId { get; set; }
        [DataMember]
        public string MainUrl { get; set; }
        [DataMember]
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        [DataMember]
        public string UpdatedBy { get; set; }
        [DataMember]
        public System.DateTime CreatedDate { get; set; }
        [DataMember]
        public string CreatedBy { get; set; }
        //[DataMember]
        //public virtual ICollection<ItemLinkEntity> ItemLinks { get; set; }
        //[DataMember]
        public virtual TopicEntity Topic { get; set; }
    }
}
