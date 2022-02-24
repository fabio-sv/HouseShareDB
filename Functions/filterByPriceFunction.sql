USE [HouseShare]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[filterByPrice]
(
@MiminumPrice decimal(10,2) = 0, 
@MaximumPrice decimal(10,2) = 50000
)  
RETURNS TABLE   
AS    
RETURN
    SELECT roomID, accommodationID, price  
    FROM Room
	WHERE Price >= @MiminumPrice AND Price <= @MaximumPrice AND occupied = 0
