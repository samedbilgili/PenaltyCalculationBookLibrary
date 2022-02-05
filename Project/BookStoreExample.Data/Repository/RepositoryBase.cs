using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookStoreExample.Data;

namespace BookStoreExample.Data.Repository
{
    public class RepositoryBase
    {
        protected BookStoreExampleEntities db;
        private static object lockObject = new object();

        protected RepositoryBase()
        {
            db = new BookStoreExampleEntities();
        }

        public BookStoreExampleEntities CreateContext()
        {
            if (db == null)
            {
                lock (lockObject)
                {
                    if (db == null)
                    {
                        db = new BookStoreExampleEntities();
                    }
                }
            }

            return db;
        }
    }
}
