using BookStoreExample.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookStoreExample.BusinessLayer
{
    public class ResultModel
    {
        public double PassedDayCount { get; set; }
        public double HolidayCount { get; set; }
        public double LateDays { get; set; }
        public string Message { get; set; }
        public List<DateTimeResult> BookReservationResult { get; set; }
        public Country country { get; set; }

        public decimal TotalPenaltyAmount { get; set; }
    }

    public class DateTimeResult
    {
        public DateTime DateTime { get; set; }
        public string Description { get; set; }

    }

}
