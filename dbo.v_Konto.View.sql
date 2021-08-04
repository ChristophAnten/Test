USE [dynamics]
GO
/****** Object:  View [dbo].[v_Konto]    Script Date: 04.08.2021 21:27:37 ******/
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
