USE [dynamics]
GO
/****** Object:  View [dbo].[v_Tradingpartner]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Tradingpartner]
AS
SELECT 
	CAST(a.Unternehmensnummer AS nvarchar(2)) AS Unternehmensnummer,
	a.Bezeichnung 
FROM Tradingpartner a


GO
