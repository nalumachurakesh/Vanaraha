using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Vanaraha.BusinessEntities;

namespace Vanaraha.BusinessServices
{
    /// <summary>
    /// Product Service Contract
    /// </summary>
    public interface IItemLinkServices
    {
        ItemLinkEntity GetItemLinkById(int itemId);
        IEnumerable<ItemLinkEntity> GetAllItemLinksByItem(int itemId);
    }
}
