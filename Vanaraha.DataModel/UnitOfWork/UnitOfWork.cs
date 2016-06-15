using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Vanaraha.DataModel.GenericRepository;
using System.Data.Entity.Validation;
using System.Diagnostics;

namespace Vanaraha.DataModel.UnitOfWork
{
    /// <summary>
    /// Unit of Work class responsible for DB transactions
    /// </summary>
    public class UnitOfWork : IDisposable
    {
        #region Private member variables...

        private VanarahaDbEntities _context = null;
        private GenericRepository<Topic> _topicRepository;
        private GenericRepository<Item> _itemRepository;
        private GenericRepository<ItemLink> _itemLinkRepository;

        #endregion

        public UnitOfWork()
        {
            _context = new VanarahaDbEntities();
        }

        #region Public Repository Creation properties...

        /// <summary>
        /// Get/Set Property for topic repository.
        /// </summary>
        public GenericRepository<Topic> TopicRepository
        {
            get
            {
                if (this._topicRepository == null)
                    this._topicRepository = new GenericRepository<Topic>(_context);
                return _topicRepository;
            }
        }

        /// <summary>
        /// Get/Set Property for Item repository.
        /// </summary>
        public GenericRepository<Item> ItemRepository
        {
            get
            {
                if (this._itemRepository == null)
                    this._itemRepository = new GenericRepository<Item>(_context);
                return _itemRepository;
            }
        }

        /// <summary>
        /// Get/Set Property for ItemLink repository.
        /// </summary>
        public GenericRepository<ItemLink> ItemLinkRepository
        {
            get
            {
                if (this._itemLinkRepository == null)
                    this._itemLinkRepository = new GenericRepository<ItemLink>(_context);
                return _itemLinkRepository;
            }
        }


        #endregion

        #region Public member methods...
        /// <summary>
        /// Save method.
        /// </summary>
        public void Save()
        {
            try
            {
                _context.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {

                var outputLines = new List<string>();
                foreach (var eve in e.EntityValidationErrors)
                {
                    outputLines.Add(string.Format(
                        "{0}: Entity of type \"{1}\" in state \"{2}\" has the following validation errors:", DateTime.Now,
                        eve.Entry.Entity.GetType().Name, eve.Entry.State));
                    foreach (var ve in eve.ValidationErrors)
                    {
                        outputLines.Add(string.Format("- Property: \"{0}\", Error: \"{1}\"", ve.PropertyName, ve.ErrorMessage));
                    }
                }
                System.IO.File.AppendAllLines(@"C:\errors.txt", outputLines);

                throw e;
            }

        }

        #endregion

        #region Implementing IDiosposable...

        #region private dispose variable declaration...
        private bool disposed = false;
        #endregion

        /// <summary>
        /// Protected Virtual Dispose method
        /// </summary>
        /// <param name="disposing"></param>
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    Debug.WriteLine("UnitOfWork is being disposed");
                    _context.Dispose();
                }
            }
            this.disposed = true;
        }

        /// <summary>
        /// Dispose method
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        #endregion
    }
}
