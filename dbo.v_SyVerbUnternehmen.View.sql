USE [dynamics]
GO
/****** Object:  View [dbo].[v_SyVerbUnternehmen]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SyVerbUnternehmen] 
AS

SELECT 
	a.Bezeichnung,
	CAST(a.DVSyVerbUntern AS bigint) DVSyVerbUntern,
	CAST(a.Unternehmensnummer AS nvarchar(2)) Unternehmensnummer
FROM SyVerbUnternehmen a

GO
