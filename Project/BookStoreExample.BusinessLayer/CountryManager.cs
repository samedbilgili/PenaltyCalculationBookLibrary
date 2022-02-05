using BookStoreExample.Data.Repository;
using BookStoreExample.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookStoreExample.BusinessLayer
{
    public class CountryManager : RepositoryBase
    {
        public List<Country> Get()
        {
            return db.Countries.Where(x => x.Status == true).ToList();
        }

        public Country Get(int CountryId)
        {
            return db.Countries.FirstOrDefault(x => x.Id == CountryId);
        }
    }
}
