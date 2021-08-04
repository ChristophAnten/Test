USE [dynamics]
GO
/****** Object:  View [dbo].[v_FixedAssetBookV2Entity]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_FixedAssetBookV2Entity]
AS 
WITH Base AS (
	SELECT *
	FROM Anlage
), Reduce AS (
	SELECT a.*
	FROM Base a
	JOIN (
		SELECT x.Anlagenummer, COUNT(*) AS cnt
		FROM Base x
		GROUP BY x.Anlagenummer
		HAVING COUNT(*) = 1
	) b
	ON a.Anlagenummer = b.Anlagenummer
), Refurbish AS (
	SELECT 
		--*,
		a.Anlagenummer AS [FIXEDASSETNUMBER],
		books.BOOKID,
		REPLACE(TRY_CONVERT(nvarchar, TRY_CONVERT(datetime, a.Anschaffungsdatum, 104), 126), 'T', ' ') AS [ACQUISITIONDATE],
		TRY_CONVERT(nvarchar, TRY_CONVERT(money, CASE
			WHEN c.AKHKGesamt <> '0' 
			THEN c.AKHKMaske 
			ELSE c.AKHKGesamt 
		END)) AS [ACQUISITIONPRICE],
		N'EUR' AS [ACQUISITIONPRICEREPORTINGCURRENCY],
		CASE WHEN c.AfAMethode = N'KA' THEN N'KEINE' ELSE N'LINV' END AS [DEPRECIATIONPROFILEID],
		a.Anlagegruppe + b.[IFRS Account ] AS [FIXEDASSETGROUPID],
		REPLACE(TRY_CONVERT(nvarchar, TRY_CONVERT(datetime, a.Anschaffungsdatum, 104), 126), 'T', ' ') AS [PLACEDINSERVICE],
		c.Nutzungsdauer AS [SERVICELIFE],
		dbo.GenerateAccountDisplayValue(NULL, NULL, a.Kostenstelle) AS [DIMENSIONDISPLAYVALUE]

		/*****************************************************/
		--a.Bezeichnung + a.Bezeichnung2 AS [Name]
	FROM Reduce a
	JOIN v_CoAMapping b
	ON a.Anlagekonto = b.[Accounts local software PLX GmbH (Diamant)] 
	JOIN AnlageAfAArt c
	ON c.DVAnlagenummer = a.DVAnlagenummer
	CROSS JOIN (
		SELECT 'HGB' AS [BOOKID]
		UNION ALL
		SELECT 'IFRS'
		UNION ALL
		SELECT 'TAX'
	) books

)
SELECT *
FROM Refurbish

--SELECT TOP 10 *
--FROM Anlage
--SELECT DISTINCT AKHKGesamt
--FROM AnlageAfAArt -- Wenn AKHKGesamt Gefüllt Gesmt nehmen sonst AKHKMaske

GO
