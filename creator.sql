DROP DATABASE IF EXISTS HouseShare;
GO

CREATE DATABASE HouseShare;
GO

DROP TABLE IF EXISTS PropertyType;
GO

DROP TABLE IF EXISTS Location;
GO

USE HouseShare

CREATE TABLE PropertyType (
    propertyTypeID int IDENTITY(1,1),
    [type] varchar(255) NOT NULL
);
GO


CREATE TABLE Location (
    [locationID] int IDENTITY(1,1) NOT NULL,
    [latitude] decimal(8, 6) NOT NULL,
    [longitude] decimal(9, 6) NOT NULL
);
GO  

CREATE TABLE [dbo].[AccomodationStatus](
	[statusID] [int] IDENTITY(1,1) NOT NULL,
	[decsription] [varchar](100) NULL,
 CONSTRAINT [PK_accomodationStatus] PRIMARY KEY CLUSTERED
(
	[StatusID] ASC
)
)
GO
CREATE TABLE [dbo].[Accomodation](
	[accomodationID] [int] IDENTITY(1,1) NOT NULL,
	[locationID] [int] NOT NULL,
	[statusID] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
	[description] [varchar](300) NOT NULL,
	[roomCount] [int] NOT NULL,
	[bathroomCount] [int] NOT NULL,
	[parking] [int] NULL,
	[petsAllowed] [bit] NOT NULL,
	[area] [int] NOT NULL,
 CONSTRAINT [PK_accomodation] PRIMARY KEY CLUSTERED 
(
	[accomodationID] ASC
)
)
GO

CREATE TABLE Gender (
	ID varchar(1) PRIMARY KEY NOT NULL,
	description varchar(255) NOT NULL
);
GO

CREATE TABLE Users (
	userID int IDENTITY(1, 1) NOT NULL,
	firstName varchar(255) NOT NULL,
	lastName varchar(255) NOT NULL,
	age int NOT NULL,
	email varchar(255) NOT NULL,
	genderID varchar(1) NOT NULL FOREIGN KEY REFERENCES Gender(ID)
);
GO

CREATE TABLE ApplicationStatus (
    appStatusID int IDENTITY(1,1),
    [status] varchar(255) NOT NULL
);
GO

CREATE TABLE Applicant (
    tenantAppID int IDENTITY(1,1) NOT NULL,
    appStatusID int FOREIGN KEY REFERENCES ApplicationStatus(appStatusID),
    userID int FOREIGN KEY REFERENCES Users(userID),
    appDescription varchar(255) NOT NULL
)

CREATE TABLE Landlord (
    landlordID int IDENTITY(1,1) NOT NULL,
    accomodationID int FOREIGN KEY REFERENCES Accomodation(accomodationID),
    userID int FOREIGN KEY REFERENCES Users(userID),
);
GO

CREATE TABLE Room (
    roomID int IDENTITY(1,1) NOT NULL,
    accomodationID int FOREIGN KEY REFERENCES Accomodation(accomodationID),
    price decimal(10, 2) NOT NULL,
    occupied bit NOT NULL
);
GO


CREATE TABLE Tenant (
	[tenantId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[roomId] [int] NOT NULL,
	
);
GO
CREATE TABLE Lease (
	[leaseId] [int] IDENTITY(1,1) NOT NULL,
	[tenantId] [int] NOT NULL,
	[leaseAgreement] [varchar](255),
);
GO


--Add Foreign Key Constraints Here
ALTER TABLE [dbo].[AccomodationStatus]  WITH CHECK ADD  CONSTRAINT [FK_Accomodation_REFERENCE_AccomodationStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[AccomodationStatus] ([statusID])
GO
ALTER TABLE [dbo].[Accomodation] CHECK CONSTRAINT [FK_Accomodation_REFERENCE_AccomodationStatus]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Accomodation_REFERENCE_Location] FOREIGN KEY([locationID])
REFERENCES [dbo].[Location] ([locationID])
GO
ALTER TABLE [dbo].[Accomodation] CHECK CONSTRAINT [FK_Accomodation_REFERENCE_AccomodationStatus]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Accomodation_REFERENCE_Location] FOREIGN KEY([locationID])
REFERENCES [dbo].[Location] ([locationID])
GO
ALTER TABLE [dbo].[Accomodation] CHECK CONSTRAINT [FK_Accomodation_REFERENCE_AccomodationStatus]
GO
ALTER TABLE [dbo].[PropertyType]  WITH CHECK ADD  CONSTRAINT [FK_Accomodation_REFERENCE_PropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[PropertyType] ([propertyTypeId])
GO
ALTER TABLE [dbo].[Accomodation] CHECK CONSTRAINT [FK_Accomodation_REFERENCE_AccomodationStatus]
GO

--Tried adding my foreign key constraints down here (Tiaan)
ALTER TABLE [dbo].[Lease]  WITH CHECK ADD CONSTRAINT [FK_Tenant_REFERENCE_Lease] FOREIGN KEY([tenantId])
REFERENCES [dbo].[Lease] ([tenantId])
GO
ALTER TABLE [dbo].[Tenant] CHECK CONSTRAINT [FK_Tenant_REFERENCE_Lease]
GO

ALTER TABLE [dbo].[Tenant]  WITH CHECK ADD CONSTRAINT [FK_User_REFERENCE_Tenant] FOREIGN KEY(userId)
REFERENCES [dbo].[Tenant] (userId)
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_REFERENCE_Tenant]
GO

ALTER TABLE [dbo].[Tenant]  WITH CHECK ADD CONSTRAINT [FK_Room_REFERENCE_Tenant] FOREIGN KEY(roomId)
REFERENCES [dbo].[Tenant] (roomId)
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_REFERENCE_Tenant]
GO