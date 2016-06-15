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
    public class ItemLinkController : ApiController
    {
         private readonly IItemLinkServices _itemLinkServices;

        #region Public Constructor

        /// <summary>
        /// Public constructor to initialize product service instance
        /// </summary>
         public ItemLinkController()
        {
            _itemLinkServices = new ItemLinkServices();
        }

        #endregion

        // GET api/product
        
        public HttpResponseMessage GetAllItemLinksById(int Id)
        {
            var itemLinks = _itemLinkServices.GetAllItemLinksByItem(Id);
            if (itemLinks != null)
            {
                var itemLinkEntities = itemLinks as List<ItemLinkEntity> ?? itemLinks.ToList();
                if (itemLinkEntities.Any())
                    return Request.CreateResponse(HttpStatusCode.OK, itemLinkEntities);
            }
            return Request.CreateErrorResponse(HttpStatusCode.NotFound, "ItemLinks not found");
        }

        // GET api/product/5
        public HttpResponseMessage Get(int id)
        {
            var itemLink = _itemLinkServices.GetItemLinkById(id);
            if (itemLink != null)
                return Request.CreateResponse(HttpStatusCode.OK, itemLink);
            return Request.CreateErrorResponse(HttpStatusCode.NotFound, "No itemlink found for this id");
        }
    }
}
