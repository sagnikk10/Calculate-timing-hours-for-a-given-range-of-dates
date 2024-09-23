-- SQL

CREATE PROCEDURE CalculateWorkHours 
(
  @StartDate DATETIME,
  @EndDate DATETIME
)
AS
BEGIN
  DECLARE @TotalHours DECIMAL(10, 2);

  -- Calculate total hours (consider potential adjustments)
  SET @TotalHours = DATEDIFF(HOUR, @StartDate, DATEADD(HOUR, 23, @EndDate)) + 1;  -- Include full EndDate

  -- Weekends and potential adjustments at the beginning/end
  SET @TotalHours = @TotalHours - 
                   DATEDIFF(WEEK, @StartDate, @EndDate) * 48  -- Subtract weekend hours
                   - CASE WHEN DATEPART(dw, @StartDate) IN (1, 6) THEN 
                          CASE WHEN DATEPART(day, @StartDate) <= 2 THEN 16 ELSE 0 END  -- Subtract 1st or 2nd Saturday at start (if needed)
                       ELSE 0 END
                   - CASE WHEN DATEPART(dw, @EndDate) = 6 THEN 
                          CASE WHEN DATEPART(day, @EndDate) > 2 THEN 24 ELSE 0 END  -- Subtract remaining Friday hours (if needed)
                       ELSE 0 END;

  INSERT INTO dbo.counttotalworkinhhours (START_DATE, END_DATE, NO_OF_HOURS)
  VALUES (@StartDate, @EndDate, @TotalHours);
END;
