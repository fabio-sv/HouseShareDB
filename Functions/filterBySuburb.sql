USE [HouseShare]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER   FUNCTION [dbo].[filterBySuburb] 
(	
	@Suburb varchar(255) = 'Rosebank'
)
RETURNS TABLE 
AS
RETURN
	SELECT Location.* 
	FROM Location INNER JOIN Suburb ON Location.suburbID = Suburb.suburbID 
	WHERE Suburb.suburbName = @Suburb
