using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Vanaraha.DataModel.UnitOfWork;
using AutoMapper;
using Vanaraha.DataModel;
using Vanaraha.BusinessEntities;

namespace Vanaraha.BusinessServices
{
    public class TopicServices : ITopicServices
    {
        private readonly UnitOfWork _unitOfWork;

        /// <summary>
        /// Public constructor.
        /// </summary>
        public TopicServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        /// <summary>
        /// Fetches product details by id
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        public BusinessEntities.TopicEntity GetTopicById(int topicId)
        {
            var topic = _unitOfWork.TopicRepository.GetByID(topicId);
            if (topic != null)
            {
                Mapper.CreateMap<Topic, TopicEntity>();
                var topicModel = Mapper.Map<Topic, TopicEntity>(topic);
                return topicModel;
            }
            return null;
        }

        /// <summary>
        /// Fetches all the products.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<BusinessEntities.TopicEntity> GetAllTopics()
        {
            var topics = _unitOfWork.TopicRepository.GetAll().ToList();
            if (topics.Any())
            {
                Mapper.CreateMap<Topic, TopicEntity>();
                Mapper.CreateMap<Item, ItemEntity>();

                var topicsModel = Mapper.Map<List<Topic>, List<TopicEntity>>(topics);
                return topicsModel;
            }
            return null;
        }

    }
}
