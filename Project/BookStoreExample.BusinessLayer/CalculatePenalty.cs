using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookStoreExample.Data;
using BookStoreExample.Data.Repository;

namespace BookStoreExample.BusinessLayer
{

    public class CalculatePenalty : RepositoryBase
    {
        public CalculatePenalty()
        {

        }

        /// <summary>
        /// This method is about calculate penalty with parameters.
        /// </summary>
        /// <param name="CheckedOutDate">Book Checked Out Date</param>
        /// <param name="ReturnedDate">Book Returnet Date</param>
        /// <param name="CountryId">Client Country Id</param>
        public ResultModel Calculate(DateTime CheckedOutDate, DateTime ReturnedDate, int CountryId)
        {
            //master
            var country = db.Countries.FirstOrDefault(x => x.Id == CountryId);
            var countryHolidayOfWeekk = db.CountryHolidayDayOfWeeks.FirstOrDefault(x => x.CountryId == CountryId);
            var countryCustomHolidayDays = db.CountryCustomHolidayDays.Where(x => x.CountryId == CountryId).ToList();

            List<DateTimeResult> bookReservationResult = new List<DateTimeResult>();

            double passTime = (ReturnedDate.AddDays(1) - CheckedOutDate).TotalDays;
            double holidayCount = 0;

            bool isHoliday;
            bool isCustomHoliday;
            for (int i = 0; i < passTime; i++)
            {
                isHoliday = false;
                isCustomHoliday = false;

                var _tempDate = CheckedOutDate.AddDays(i);
                string dayName = _tempDate.DayOfWeek.ToString();

                //check custom date control
                DateTime _checkDate = new DateTime(_tempDate.Year, _tempDate.Month, _tempDate.Day);
                var _checkCustomDate = countryCustomHolidayDays.FirstOrDefault(x => x.HolidayDate == _checkDate);
                if (_checkCustomDate != null)
                {
                    isCustomHoliday = true;
                }

                //weekends control
                switch (dayName)
                {
                    case "Monday":
                        if (countryHolidayOfWeekk.Monday == true && isCustomHoliday == false)
                        {
                            isHoliday = true;
                        }
                        break;
                    case "Tuesday":
                        if (countryHolidayOfWeekk.Tuesday == true && isCustomHoliday == false)
                        {
                            isHoliday = true;
                        }
                        break;
                    case "Wednesday":
                        if (countryHolidayOfWeekk.Wednesday == true && isCustomHoliday == false)
                        {
                            isHoliday = true;
                        }
                        break;
                    case "Thursday":
                        if (countryHolidayOfWeekk.Thursday == true && isCustomHoliday == false)
                        {
                            isHoliday = true;
                        }
                        break;
                    case "Friday":
                        if (countryHolidayOfWeekk.Friday == true && isCustomHoliday == false)
                        {
                            isHoliday = true;
                        }
                        break;
                    case "Saturday":
                        if (countryHolidayOfWeekk.Saturday == true && isCustomHoliday == false)
                        {
                            isHoliday = true;
                        }
                        break;
                    case "Sunday":
                        if (countryHolidayOfWeekk.Sunday == true && isCustomHoliday == false)
                        {
                            isHoliday = true;
                        }
                        break;
                }


                if (isHoliday)
                {
                    holidayCount++;

                    bookReservationResult.Add(new DateTimeResult()
                    {
                        DateTime = _tempDate,
                        Description = "Holiday"
                    });
                }
                else if (isCustomHoliday)
                {
                    holidayCount++;

                    bookReservationResult.Add(new DateTimeResult()
                    {
                        DateTime = _tempDate,
                        Description = "CUSTOM Holiday"
                    });
                }
                else
                {
                    bookReservationResult.Add(new DateTimeResult()
                    {
                        DateTime = _tempDate,
                        Description = "Work Day"
                    });
                }

            }

            var HolidayCount = holidayCount;
            var PassedDayCount = passTime;
            var LateDays = (passTime - holidayCount) - 10;

            var totalPenalyAmount = country.PenaltyAmount.Value * Convert.ToDecimal(LateDays);

            return new ResultModel()
            {
                HolidayCount = HolidayCount,
                PassedDayCount = PassedDayCount,
                LateDays = LateDays,
                TotalPenaltyAmount = totalPenalyAmount,
                BookReservationResult = bookReservationResult,
                country = country
            };
        }
    }
}
