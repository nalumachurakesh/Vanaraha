using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Vanaraha.BusinessServices;
using Vanaraha.BusinessEntities;

namespace Vanraha.Controllers
{
    public class TopicController : ApiController
    {
         private readonly ITopicServices _topicServices;

        #region Public Constructor

        /// <summary>
        /// Public constructor to initialize product service instance
        /// </summary>
         public TopicController()
        {
            _topicServices = new TopicServices();
        }

        #endregion

        // GET api/product
        public HttpResponseMessage Get()
        {
            var topics = _topicServices.GetAllTopics();
            if (topics != null)
            {
                var productEntities = topics as List<TopicEntity> ?? topics.ToList();
                if (productEntities.Any())
                    return Request.CreateResponse(HttpStatusCode.OK, productEntities);
            }
            return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Topics not found");
        }

        // GET api/product/5
        public HttpResponseMessage Get(int id)
        {
            var topic = _topicServices.GetTopicById(id);
            if (topic != null)
                return Request.CreateResponse(HttpStatusCode.OK, topic);
            return Request.CreateErrorResponse(HttpStatusCode.NotFound, "No topic found for this id");
        }
    }
}
