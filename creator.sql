USE master;
GO

DROP DATABASE IF EXISTS HouseShare;
GO

Create Database HouseShare
GO

USE HouseShare;
GO

DROP TABLE IF EXISTS [ApplicationStatus];
GO
 
DROP TABLE IF EXISTS [Landlord];
GO
 
DROP TABLE IF EXISTS [Lease];
GO
 
DROP TABLE IF EXISTS [Tenant];
GO
 
DROP TABLE IF EXISTS [Users];
GO
 
DROP TABLE IF EXISTS [Gender];
GO
 
DROP TABLE IF EXISTS [Room];
GO
 
DROP TABLE IF EXISTS [Accomodation];
GO
 
DROP TABLE IF EXISTS [PropertyType];
GO
 
DROP TABLE IF EXISTS [Location];
GO
 
DROP TABLE IF EXISTS [AccomodationStatus];
GO

CREATE TABLE [PropertyType] (
    [propertyTypeID] int IDENTITY(1,1) PRIMARY KEY,
    [type] varchar(255) NOT NULL
);
GO

CREATE TABLE [Suburb] (
	[suburbID] int IDENTITY(1,1) PRIMARY KEY,
	[suburbName] varchar(50) NOT NULL
)

CREATE TABLE [Location] (
    [locationID] int IDENTITY(1,1) PRIMARY KEY ,
    [suburbID] FOREIGN KEY REFERENCES [Suburb]([suburbID]),
    [streetName] varchar(100) NOT NULL,
	[streenNumber] int NOT NULL
);
GO  

CREATE TABLE [dbo].[AccommodationStatus](
	[statusID] [int] IDENTITY(1,1) PRIMARY KEY,
	[decsription] [varchar](100) NULL
 );
GO

CREATE TABLE [dbo].[Accommodation](
	[accommodationID] [int] IDENTITY(1,1) PRIMARY KEY,
	[locationID] [int] FOREIGN KEY REFERENCES [Location]([locationID]),
	[statusID] [int] FOREIGN KEY REFERENCES [AccommodationStatus]([statusID]),
	[propertyTypeID] [int] FOREIGN KEY REFERENCES [PropertyType]([propertyTypeID]),
	[description] [varchar](300) NOT NULL,
	[roomCount] [int] NOT NULL,
	[bathroomCount] [int] NOT NULL,
	[parking] [int] NULL,
	[petsAllowed] [bit] NOT NULL,
	[area] [int] NOT NULL
 );
GO

CREATE TABLE [Gender] (
	[genderID] varchar(1) PRIMARY KEY NOT NULL,
	[description] varchar(255) NOT NULL
);
GO

CREATE TABLE [User] (
	[userID] int IDENTITY(1, 1) PRIMARY KEY,
	[firstName] varchar(255) NOT NULL,
	[lastName] varchar(255) NOT NULL,
	[age] int NOT NULL,
	[email] varchar(255) NOT NULL,
	[genderID] varchar(1) NOT NULL FOREIGN KEY REFERENCES [Gender]([genderID])
);
GO

CREATE TABLE [ApplicationStatus] (
    [appStatusID] int IDENTITY(1,1) PRIMARY KEY,
    [status] varchar(255) NOT NULL
);
GO

CREATE TABLE [Applicant] (
    [tenantAppID] int IDENTITY(1,1) PRIMARY KEY,
    [appStatusID] int FOREIGN KEY REFERENCES [ApplicationStatus](appStatusID),
    [userID] int FOREIGN KEY REFERENCES [User](userID),
    [appDescription] varchar(255) NOT NULL
);
GO

CREATE TABLE [Landlord] (
    [landlordID] int IDENTITY(1,1) PRIMARY KEY,
    [accommodationID] int FOREIGN KEY REFERENCES [Accommodation](accommodationID),
    [userID] int FOREIGN KEY REFERENCES [User](userID),
);
GO

CREATE TABLE [Room] (
    [roomID] int IDENTITY(1,1) PRIMARY KEY,
    [accommodationID] int FOREIGN KEY REFERENCES [Accommodation](accommodationID),
    [price] decimal(10, 2) NOT NULL,
    [occupied] bit NOT NULL
);
GO

CREATE TABLE [Tenant] (
	[tenantId] [int] IDENTITY(1,1) PRIMARY KEY,
	[userID] [int] FOREIGN KEY REFERENCES [User]([userID]),
	[roomId] [int] FOREIGN KEY REFERENCES [Room]([roomId]),
	
);
GO

CREATE TABLE [Lease] (
	[leaseId] [int] IDENTITY(1,1) PRIMARY KEY,
	[tenantId] [int] FOREIGN KEY REFERENCES [Tenant]([tenantId]),
	[leaseAgreement] [varchar](255),
);
GO