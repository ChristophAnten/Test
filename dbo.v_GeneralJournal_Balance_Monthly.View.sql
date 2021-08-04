USE [dynamics]
GO
/****** Object:  View [dbo].[v_GeneralJournal_Balance_Monthly]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_GeneralJournal_Balance_Monthly]
AS
WITH Base AS (
	SELECT 
		bu.Buchungsperiode,
		k.Kontonummer,
		bu.Verdichtung,
		bu.Sammelkonto,
		bu.DVEmpfVerbUntern,
		kr.Kostenstelle,
		coa.[IFRS Account ] AS MAINACCOUNT,
		unt.Unternehmensnummer AS TradingpartnerUnternehmensnummer,
		unt.Bezeichnung AS TradingpartnerName,
		le.DynamicsCompany AS Tradingpartner,
		bu.Haben,
		bu.Soll,
		kr.Betrag
	FROM v_Buchung bu
	JOIN v_Beleg be
	ON	bu.DVBelegnummer = be.DVBelegnummer 
	JOIN v_Konto k
	ON bu.DVKontonummer = k.DVKontonummer
	LEFT JOIN v_Koredaten kr
	ON kr.DVBuchungsnummer = bu.DVBuchungsnummer
	JOIN v_CoAMapping coa
	ON coa.[Accounts local software PLX GmbH (Diamant)] = CASE 
		WHEN bu.Sammelkonto = '' OR bu.Sammelkonto = '0' 
		THEN k.Kontonummer
		ELSE bu.Sammelkonto
	END
	AND CAST(LEFT(coa.[Accounts local software PLX GmbH (Diamant)], 1) AS INT) <= 3
	LEFT JOIN v_SyVerbUnternehmen unt
	ON unt.DVSyVerbUntern = bu.DVEmpfVerbUntern
	LEFT JOIN LEMapping le
	ON le.DiamantCompany = unt.Unternehmensnummer
), PreGuV AS (
	SELECT 
		--a.MAINACCOUNT + '--' + ISNULL(a.Kostenstelle, '') + '-----' AS ACCOUNTDISPLAYVALUE,
		--a.MAINACCOUNT + '---' + ISNULL(a.Kostenstelle, '') + '---' AS ACCOUNTDISPLAYVALUE,
		dbo.GenerateAccountDisplayValue(a.MAINACCOUNT, '', a.Tradingpartner) AS  ACCOUNTDISPLAYVALUE,
		N'Ledger' AS ACCOUNTTYPE,
		CASE 
			WHEN (a.Sammelkonto = '' OR a.Sammelkonto = '0') AND a.Kostenstelle IS NOT NULL
			THEN CASE WHEN a.Betrag > 0 THEN a.Betrag ELSE null END
			ELSE a.Soll
		END AS Soll,
		CASE 
			WHEN (a.Sammelkonto = '' OR a.Sammelkonto = '0') AND a.Kostenstelle IS NOT NULL
			THEN CASE WHEN a.Betrag < 0 THEN -a.Betrag ELSE null END
			ELSE a.Haben
		END AS Haben,
		--N'999999' + '--' + ISNULL(a.Kostenstelle, '') + '-----' AS OFFSETACCOUNTDISPLAYVALUE,
		--N'999999' + '---'  + ISNULL(a.Kostenstelle, '') + '---' AS OFFSETACCOUNTDISPLAYVALUE,
		dbo.GenerateAccountDisplayValue(N'99999999', '', a.Tradingpartner) AS OFFSETACCOUNTDISPLAYVALUE,
		a.Buchungsperiode
	FROM Base a
	WHERE a.Verdichtung = '0'
	AND a.Buchungsperiode BETWEEN '2020-01-01' AND '2020-12-31'
	AND DAY(a.Buchungsperiode) >= 2
), GuV AS (
	SELECT 
		a.ACCOUNTDISPLAYVALUE,
		a.ACCOUNTTYPE,
		SUM(ISNULL(a.Soll,0)) AS Soll,
		SUM(ISNULL(a.Haben,0)) AS Haben,
		a.OFFSETACCOUNTDISPLAYVALUE,
		DATEADD(DAY, -1, DATEFROMPARTS(YEAR(DATEADD(MONTH, 1, a.Buchungsperiode)), MONTH(DATEADD(MONTH, 1, a.Buchungsperiode)), 1)) AS TRANSDATE
	FROM PreGuV a
	GROUP BY a.ACCOUNTDISPLAYVALUE, a.ACCOUNTTYPE, a.OFFSETACCOUNTDISPLAYVALUE, DATEADD(DAY, -1, DATEFROMPARTS(YEAR(DATEADD(MONTH, 1, a.Buchungsperiode)), MONTH(DATEADD(MONTH, 1, a.Buchungsperiode)), 1))
), Result AS (
	SELECT 
		CAST((SELECT TOP 1 Value FROM MigParameters WHERE [Name] = 'NextJournalBatchNumber') AS nvarchar(100)) AS JOURNALBATCHNUMBER,
		(SELECT TOP 1 Value FROM MigParameters WHERE [Name] = 'JournalName') AS JOURNALNAME,
		LTRIM(RTRIM(STR(ROW_NUMBER() OVER (ORDER BY a.TRANSDATE, a.ACCOUNTDISPLAYVALUE) + 1,6,1))) AS LINENUMBER,
		---1 AS LINENUMBER,
		a.ACCOUNTDISPLAYVALUE,
		a.ACCOUNTTYPE,
		[dbo].[ConvertMoneyToNvarchar](
			CASE WHEN a.Haben <= a.Soll THEN null ELSE ABS(a.Haben - a.Soll) END 
		) AS CREDITAMOUNT,
		--CASE WHEN a.Haben <= a.Soll THEN null ELSE ABS(a.Haben - a.Soll) END AS CREDITAMOUNT,
		N'EUR' AS CURRENCYCODE,
		[dbo].[ConvertMoneyToNvarchar](
			CASE WHEN a.Haben >= a.Soll THEN null ELSE ABS(a.Soll - a.Haben) END
		) AS DEBITAMOUNT,
		--CASE WHEN a.Haben >= a.Soll THEN null ELSE ABS(a.Soll - a.Haben) END AS DEBITAMOUNT,
		N'Monatsaldo 2020-' + CAST(MONTH(a.TRANSDATE) AS NVARCHAR) as DESCRIPTION,
		a.OFFSETACCOUNTDISPLAYVALUE,
		N'Ledger' AS OFFSETACCOUNTTYPE,
		REPLACE(CONVERT(NVARCHAR, CAST(a.TRANSDATE AS DATETIME),126), 'T', ' ') TRANSDATE,		
		N'TST-RN-' + RIGHT(N'000000000' + LTRIM(RTRIM(STR(ROW_NUMBER() OVER (ORDER BY a.TRANSDATE, a.ACCOUNTDISPLAYVALUE),6,0))),9) AS VOUCHER
		--a.Haben - a.Soll AS Saldo
	FROM GuV a
)
SELECT *
FROM Result
WHERE NOT (CREDITAMOUNT = '' AND DEBITAMOUNT = '')
GO
