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
    public class ItemController : ApiController
    {
        private readonly IItemServices _itemServices;

        #region Public Constructor

        /// <summary>
        /// Public constructor to initialize product service instance
        /// </summary>
        public ItemController()
        {
            _itemServices = new ItemServices();
        }

        #endregion

        // GET api/product
        public HttpResponseMessage Get()
        {
            var items = _itemServices.GetAllItems();
            if (items != null)
            {
                var itemEntities = items as List<ItemEntity> ?? items.ToList();
                if (itemEntities.Any())
                    return Request.CreateResponse(HttpStatusCode.OK, itemEntities);
            }
            return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Items not found");
        }

        // GET api/product/5
        public HttpResponseMessage Get(int id)
        {
            var item = _itemServices.GetItemById(id);
            if (item != null)
                return Request.CreateResponse(HttpStatusCode.OK, item);
            return Request.CreateErrorResponse(HttpStatusCode.NotFound, "No item found for this id");
        }
    }
}
