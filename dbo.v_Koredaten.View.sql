USE [dynamics]
GO
/****** Object:  View [dbo].[v_Koredaten]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_Koredaten]
AS
SELECT 
	CAST(a.DVBuchungsnummer as bigint) DVBuchungsnummer,
	a.Kostenstelle,
	a.Dimension3 AS Projekt,
	CAST(REPLACE(a.Betrag,',','.')  AS money) Betrag,
	CAST(REPLACE(a.FWBetrag,',','.') AS money) FWBetrag
FROM Koredaten a

GO
