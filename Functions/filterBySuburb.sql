USE [HouseShare]
GO
/****** Object:  UserDefinedFunction [dbo].[filterBySuburb]    Script Date: 2022/02/24 14:06:31 ******/
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
	-- Add the SELECT statement with parameter references here
	SELECT Location.* 
	FROM Location INNER JOIN Suburb ON Location.suburbID = Suburb.suburbID 
	WHERE Suburb.suburbName = @Suburb
