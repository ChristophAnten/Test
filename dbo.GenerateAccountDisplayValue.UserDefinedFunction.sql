USE [dynamics]
GO
/****** Object:  UserDefinedFunction [dbo].[GenerateAccountDisplayValue]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[GenerateAccountDisplayValue]
(
	@MainAccount nvarchar(20),
	@CostCenter nvarchar(20),
	@TradingPartner nvarchar(20)
)
RETURNS nvarchar(200)
AS
BEGIN
	DECLARE @Result nvarchar(200)

	--SELECT @Result = @MainAccount + '---' + ISNULL(@CostCenter, '') + '--'
	SELECT @Result = ISNULL(@MainAccount, N'') + N'-' + ISNULL(@CostCenter, '') + '-' + ISNULL(@TradingPartner, '') -- PRT

	RETURN @Result
END

GO
