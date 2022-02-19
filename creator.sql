DROP DATABASE IF EXISTS HouseShare;
GO

CREATE DATABASE HouseShare;
GO

DROP TABLE IF EXISTS PropertyType;
GO

CREATE TABLE PropertyType (
    propertyTypeId int IDENTITY(1,1),
    [type] varchar(255) NOT NULL
);
GO
