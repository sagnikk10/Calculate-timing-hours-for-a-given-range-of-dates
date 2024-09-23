# Calculate-timing-hours-for-a-given-range-of-dates
Create a stored procedure to get the number of hours between two dates having a DateTime format. You should exclude all Sundays and 1st and 2nd Saturdays if it comes within the date range. If either of the input dates are Sunday or the 1st or 2nd Saturday, then include that particular date too. 


Stored Procedure : CalculateWorkHours

This stored procedure calculates the total number of working hours between two provided dates. It excludes all Sundays and 1st & 2nd Saturdays within the date range.

Input Parameters:

@StartDate: Starting date and time(DATETIME fromat). @EndDate: Ending date and time(DATETIME fromat).

Output:

The procedure inserts the @StartDate, @EndDate and calculated total working hours (NO_OF_HOURS) into a table named counttotalworkinhours.

Note:

i.The database supports the necessary functions like DATEDIFF, DATEPART and DATEADD.

ii.The counttotalworkinhours table already exists with appropriate columns for START_DATE,END_DATE and NO_OF_HOURS.
