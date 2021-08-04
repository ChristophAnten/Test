USE [dynamics]
GO
/****** Object:  View [dbo].[v_Buchung]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_Buchung]
AS
SELECT 
CAST(a.DVBuchungsnummer AS bigint) DVBuchungsnummer,
CAST(a.DVBelegnummer AS bigint) DVBelegnummer,
CAST(a.DVKontonummer AS bigint) DVKontonummer,
CAST(a.Buchungsperiode AS DATETIME) Buchungsperiode,
CAST(REPLACE(a.Soll,',','.') AS money) Soll,
CAST(REPLACE(a.Haben,',','.') AS money) Haben,
a.Text,
a.Sammelkonto,
CAST(a.Verdichtung AS int) Verdichtung,
CAST(a.DVEmpfVerbUntern AS bigint) DVEmpfVerbUntern

FROM Buchung a
GO
