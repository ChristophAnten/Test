USE [dynamics]
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertMoneyToNvarchar]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ConvertMoneyToNvarchar] 
(
	@Amount money
)
RETURNS nvarchar(200)
AS
BEGIN
	DECLARE @Result nvarchar(200)
	SELECT @Result = CASE WHEN @Amount IS NULL THEN N'' ELSE LTRIM(RTRIM(STR(@Amount,18,2))) END
	SELECT @Result = REPLACE(@Result, ',','.')
	RETURN @Result
END


GO
