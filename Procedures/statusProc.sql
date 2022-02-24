Use HouseShare;
GO

CREATE PROCEDURE [uspSetAccommodationStatus]
@accommodationID int
AS
  DECLARE @occupiedCount int = -1;
  DECLARE @roomCount int = -1;

  SELECT @occupiedCount = COUNT(*) FROM [Room]
  WHERE [Room].[accommodationID] = @accommodationID
  AND [Room].[occupied] = 1; 

  SELECT @roomCount = roomCount FROM [Accommodation]
  WHERE [Accommodation].[accommodationID] = @accommodationID

  IF (@roomCount != @occupiedCount)
  BEGIN
    UPDATE [Accommodation]
    SET [Accommodation].[statusID] = 1
    WHERE [Accommodation].[accommodationID] = @accommodationID
  END
  ELSE
  BEGIN
    UPDATE [Accommodation]
    SET [Accommodation].[statusID] = 2
    WHERE [Accommodation].[accommodationID] = @accommodationID
  END
GO

-- Will run the proc with @accommodationID = 2
EXEC uspSetAccommodationStatus @accommodationID = 2;
GO
