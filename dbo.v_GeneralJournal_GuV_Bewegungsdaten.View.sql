USE [dynamics]
GO
/****** Object:  View [dbo].[v_GeneralJournal_GuV_Bewegungsdaten]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_GeneralJournal_GuV_Bewegungsdaten]
AS
WITH Base AS (
	SELECT 
		bu.Buchungsperiode,
		k.Kontonummer,
		bu.Verdichtung,
		bu.Sammelkonto,
		bu.DVEmpfVerbUntern,
		bu.[Text],   -- > Description
		be.InterneBelegnummer, --> Document
		be.Belegdatum, -- > Documentdate
		be.DVBelegnummer,
		be.Belegnummer,  -- ExterneBuchunsnummer INVOICE Die Hier ist richtig auf str(20)
		bu.DVBuchungsnummer, --< PAYMENTREFERENCE
		kr.Kostenstelle,
		be.[BuchungAm], -- > TRANSDATE
		coa.[IFRS Account ] AS MAINACCOUNT,
		unt.Unternehmensnummer AS TradingpartnerUnternehmensnummer,
		unt.Bezeichnung AS TradingpartnerName,
		bu.Haben, --> haben
		bu.Soll, --> soll
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
	AND CAST(LEFT(coa.[Accounts local software PLX GmbH (Diamant)], 1) AS INT) > 3
	LEFT JOIN v_SyVerbUnternehmen unt
	ON unt.DVSyVerbUntern = bu.DVEmpfVerbUntern
), GuV AS (
	SELECT 
		--a.MAINACCOUNT + '--' + ISNULL(a.Kostenstelle, '') + '-----' AS ACCOUNTDISPLAYVALUE,
		--a.MAINACCOUNT + '---' + ISNULL(a.Kostenstelle, '') + '---' AS ACCOUNTDISPLAYVALUE,
		dbo.GenerateAccountDisplayValue(a.MAINACCOUNT, a.Kostenstelle, '') AS  ACCOUNTDISPLAYVALUE,
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
		a.[Text] AS [TEXT],   -- > Text #####
		a.InterneBelegnummer AS DOCUMENT, --> Document
		a.Belegdatum AS DOCUMENTDATE, -- > Documentdate
		left(a.Belegnummer,20) AS INVOICE,  -- INVOICE
		N'Ledger' AS OFFSETACCOUNTTYPE,
		a.DVBuchungsnummer AS PAYMENTREFERENCE, --> PAYMENTREFERENCE
		--N'999999' + '--' + ISNULL(a.Kostenstelle, '') + '-----' AS OFFSETACCOUNTDISPLAYVALUE,
		--N'999999' + '---'  + ISNULL(a.Kostenstelle, '') + '---' AS OFFSETACCOUNTDISPLAYVALUE,
		dbo.GenerateAccountDisplayValue(N'99999999', a.Kostenstelle, '') AS OFFSETACCOUNTDISPLAYVALUE,
		a.[BuchungAm] as TRANSDATE
	FROM Base a
	WHERE a.Verdichtung = '0'
	AND a.Buchungsperiode >= '2021-01-01'
	--AND DAY(a.Buchungsperiode) >= 2
), Result as (
	select 
		a.ACCOUNTDISPLAYVALUE
		,a.ACCOUNTTYPE
		,[dbo].[ConvertMoneyToNvarchar](
			CASE WHEN ISNULL(a.Haben,0) <= ISNULL(a.Soll,0) THEN null ELSE ABS(ISNULL(a.Haben,0) - ISNULL(a.Soll,0)) END 
		) AS CREDITAMOUNT
		--CASE WHEN a.Haben <= a.Soll THEN null ELSE ABS(a.Haben - a.Soll) END AS CREDITAMOUNT,
		,[dbo].[ConvertMoneyToNvarchar](
			CASE WHEN a.Haben >= ISNULL(a.Soll,0) THEN null ELSE ABS(ISNULL(a.Soll,0) - ISNULL(a.Haben,0)) END
		) AS DEBITAMOUNT
		,a.[TEXT]
		,a.DOCUMENT
		,a.DOCUMENTDATE
		,a.INVOICE
		,a.OFFSETACCOUNTTYPE
		,a.PAYMENTREFERENCE
		,a.OFFSETACCOUNTDISPLAYVALUE
		,a.TRANSDATE
		from GuV a
)
SELECT *
FROM Result
WHERE NOT (CREDITAMOUNT IS NULL AND DEBITAMOUNT IS NULL)
GO
