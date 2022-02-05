using BookStoreExample.BusinessLayer;
using BookStoreExample.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BookStoreExample.Controllers
{
    public class DefaultController : Controller
    {
        // GET: Default
        public ActionResult Index()
        {
            CountryManager countryManager = new CountryManager();

            //country list
            List<Country> countryList = countryManager.Get();
            ViewBag.CountryList = new SelectList(countryList, "Id", "Name");

            return View();
        }

        [HttpPost]
        public ActionResult Index(DateTime? CheckedOutDate, DateTime? ReturnedDate, int CountryId)
        {
            if (CheckedOutDate == null || ReturnedDate == null || CountryId <= 0)
            {
                return RedirectToAction("Index");
            }

            CountryManager countryManager = new CountryManager();
            //country list
            List<Country> countryList = countryManager.Get();
            ViewBag.CountryList = new SelectList(countryList, "Id", "Name");

            CalculatePenalty calculatePenalty = new CalculatePenalty();

            ViewBag.Result = calculatePenalty.Calculate(CheckedOutDate.Value, ReturnedDate.Value, CountryId);

            return View();
        }
    }
}