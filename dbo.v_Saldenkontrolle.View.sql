USE [dynamics]
GO
/****** Object:  View [dbo].[v_Saldenkontrolle]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_Saldenkontrolle]
AS
WITH GJ AS (
	SELECT 
		LEFT(a.ACCOUNTDISPLAYVALUE,8) AS Account,
		YEAR(a.TRANSDATE) AS Jahr,
		MONTH(a.TRANSDATE) AS Monat,
		SUM(ISNULL(CAST(a.CREDITAMOUNT as money),0)-ISNULL(CAST(a.DEBITAMOUNT as money),0)) AS Saldo
	--FROM bl.GeneralJournal_GuV_Monthly a
	FROM v_GeneralJournal_GuV_Monthly a
	GROUP BY
		LEFT(a.ACCOUNTDISPLAYVALUE,8),
		YEAR(a.TRANSDATE), MONTH(a.TRANSDATE)
), Salden AS (
	SELECT 
		a.[IFRS Account ] AS Account,
		YEAR(a.Buchungsperiode) AS Jahr,
		MONTH(a.Buchungsperiode) AS Monat,
		SUM(ISNULL(CAST(a.Haben as money),0)-ISNULL(CAST(a.Soll as money),0)) AS Saldo
	FROM v_Saldo_IFRS a
	GROUP BY a.[IFRS Account ], YEAR(a.Buchungsperiode), MONTH(a.Buchungsperiode)
	
), Result AS (
	SELECT 
		a.Account AS AccountImport,
		a.Jahr AS JahrImport,
		a.Monat AS MonatImport,
		a.Saldo AS SaldoImport,
		b.Account AS AccountSalden,
		b.Jahr AS JahrSalden,
		b.Monat AS MonatSalden,
		b.Saldo AS SaldoSalden,
		CASE WHEN a.Saldo = b.Saldo THEN 1 ELSE 0 END AS IstRichtig
	FROM GJ a
	JOIN Salden b
	ON a.Account = b.Account
	AND a.Jahr = b.Jahr
	AND a.Monat = b.Monat
)
SELECT *
FROM Result
GO
