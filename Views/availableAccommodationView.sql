USE HouseShare;
GO

CREATE VIEW [AvailableAccommodation] AS
SELECT [description], [roomCount], [parking], [petsAllowed], [area], [Location].[streetNumber], [Location].[streetName], [Suburb].[suburbName], [PropertyType].[type]
FROM [Accommodation]
INNER JOIN [Location] ON [Accommodation].[locationID]=[Location].[locationID]
INNER JOIN [Suburb] ON [Location].[suburbID]=[Suburb].[suburbID]
INNER JOIN [PropertyType] ON [Accommodation].[propertyTypeID]=[PropertyType].[propertyTypeID]
WHERE statusID = 1