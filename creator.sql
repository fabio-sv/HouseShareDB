DROP DATABASE IF EXISTS HouseShare;
GO

CREATE DATABASE HouseShare;
GO

DROP TABLE IF EXISTS PropertyType;
GO

CREATE TABLE PropertyType (
    propertyTypeId int NOT NULL PRIMARY KEY,
    type varchar(255) NOT NULL,
);
GO