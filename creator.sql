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

CREATE TABLE ApplicationStatus (
    appStatusID int IDENTITY(1,1),
    [status] varchar(255) NOT NULL
);
GO

--Hey Fabs, please can you add your User Table here :)

CREATE TABLE Applicant (
    tenantAppID int IDENTITY(1,1) NOT NULL,
    appStatusID int FOREIGN KEY REFERENCES ApplicationStatus(appStatusID),
    userID int FOREIGN KEY REFERENCES User(userID),
    appDescription varchar(255) NOT NULL
)


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