using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Vanaraha.DataModel.UnitOfWork;
using Vanaraha.DataModel;
using Vanaraha.BusinessEntities;
using AutoMapper;

namespace Vanaraha.BusinessServices
{
    public class ItemLinkServices : IItemLinkServices
    {
        private readonly UnitOfWork _unitOfWork;

        /// <summary>
        /// Public constructor.
        /// </summary>
        public ItemLinkServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        /// <summary>
        /// Fetches product details by id
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        public BusinessEntities.ItemLinkEntity GetItemLinkById(int itemLinkId)
        {
            var itemLink = _unitOfWork.ItemLinkRepository.GetByID(itemLinkId);
            if (itemLink != null)
            {
                Mapper.CreateMap<ItemLink, ItemLinkEntity>();
                var itemLinkModel = Mapper.Map<ItemLink, ItemLinkEntity>(itemLink);
                return itemLinkModel;
            }
            return null;
        }

        /// <summary>
        /// Fetches all the itemlInks by itemId which is passed.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<BusinessEntities.ItemLinkEntity> GetAllItemLinksByItem(int itemId)
        {
            Func<ItemLink, bool> byItemId = s =>
            {
                if (s.ItemId == itemId)
                    return true;
                else
                    return false;
            };

            var itemLinks = _unitOfWork.ItemLinkRepository.GetMany(byItemId);
            //if (itemLinks.Any())
            //{
            //    Mapper.CreateMap<ItemLink, ItemLinkEntity>();
            //    var itemLinksModel = Mapper.Map<List<ItemLink>, List<ItemLinkEntity>>(itemLinks);
            //    return itemLinksModel;
            //}
            if (itemLinks.Any())
            {
                Mapper.CreateMap<Topic, TopicEntity>();
                Mapper.CreateMap<Item, ItemEntity>();
                Mapper.CreateMap<ItemLink, ItemLinkEntity>();
                var itemLinksModel = Mapper.Map<List<ItemLink>, List<ItemLinkEntity>>(itemLinks.ToList());
                return itemLinksModel;
            }
            return null;
        }
    }
}
