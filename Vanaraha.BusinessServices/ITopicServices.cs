using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Vanaraha.BusinessEntities;

namespace Vanaraha.BusinessServices
{
    public interface ITopicServices
    {
        TopicEntity GetTopicById(int topicId);
        IEnumerable<TopicEntity> GetAllTopics();
    }
}
