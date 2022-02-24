Use HouseShare;
GO

CREATE PROCEDURE [uspSetAccommodationStatus]
@accommodationID int,
@occupiedCount int,
@roomCount int
AS
  SET @occupiedCount = (SELECT COUNT(AccommodationID) FROM [Room]
  WHERE AccommodationID = @accommodationID);

  SELECT @roomCount = roomCount FROM [Accommodation]
  WHERE [Accommodation].[AccommodationID] = @accommodationID

  IF (@roomCount = @occupiedCount)
  BEGIN
    UPDATE [Accommodation]
    SET [Accommodation].[statusID] = 1
    WHERE [Accommodation].[AccommodationID] = @accommodationID
  END
  ELSE
  BEGIN
    UPDATE [Accommodation]
    SET [Accommodation].[statusID] = 2
    WHERE [Accommodation].[AccommodationID] = @accommodationID
  END
GO