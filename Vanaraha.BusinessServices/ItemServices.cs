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
    /// <summary>
    /// Offers services for product specific CRUD operations
    /// </summary>
    public class ItemServices : IItemServices
    {
        private readonly UnitOfWork _unitOfWork;

        /// <summary>
        /// Public constructor.
        /// </summary>
        public ItemServices()
        {
            _unitOfWork = new UnitOfWork();
        }

        /// <summary>
        /// Fetches product details by id
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        public BusinessEntities.ItemEntity GetItemById(int itemId)
        {
            var item = _unitOfWork.ItemRepository.GetByID(itemId);
            if (item != null)
            {
                Mapper.CreateMap<Item, ItemEntity>();
                var itemModel = Mapper.Map<Item, ItemEntity>(item);
                return itemModel;
            }
            return null;
        }

        /// <summary>
        /// Fetches all the products.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<BusinessEntities.ItemEntity> GetAllItems()
        {
            var items = _unitOfWork.ItemRepository.GetAll().ToList();
            if (items.Any())
            {
                Mapper.CreateMap<Item, ItemEntity>();
                var itemsModel = Mapper.Map<List<Item>, List<ItemEntity>>(items);
                return itemsModel;
            }
            return null;
        }

    }
}
