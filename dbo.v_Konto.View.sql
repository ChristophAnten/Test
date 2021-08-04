USE [dynamics]
GO
/****** Object:  View [dbo].[v_Konto]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Konto]
AS
SELECT 
	CAST(a.DVKontonummer as bigint) DVKontonummer,
	a.Kontonummer,
	a.Bezeichnung,
	a.Bezeichnung2
FROM Konto a


GO
