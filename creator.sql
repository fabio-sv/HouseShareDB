DROP DATABASE IF EXISTS HouseShare;
GO

CREATE DATABASE HouseShare;
GO

DROP TABLE IF EXISTS PropertyType;
GO

DROP TABLE IF EXISTS Location;
GO

CREATE TABLE PropertyType (
    propertyTypeId int IDENTITY(1,1),
    [type] varchar(255) NOT NULL
);
GO


CREATE TABLE Location (
    [locationID] int IDENTITY(1,1) NOT NULL,
    [latitude] decimal(8, 6) NOT NULL,
    [longitude] decimal(9, 6) NOT NULL
);
GO     