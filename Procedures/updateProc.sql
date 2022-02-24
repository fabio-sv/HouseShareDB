Use HouseShare;
GO

CREATE PROCEDURE [uspUpdateAllStatuses]
AS
  DECLARE @Counter INT 
  DECLARE @total INT
  SELECT TOP 1 @Counter = [AccommodationID] FROM [Accommodation]
  SELECT @total = COUNT(*) + 1 FROM [Accommodation]

  WHILE ( @Counter <= @total)
  BEGIN
      EXEC uspSetAccommodationStatus @accommodationID = @counter;
      SET @Counter  = @Counter  + 1
  END
GO

-- Will Run the proc
EXEC uspUpdateAllStatuses;
GO