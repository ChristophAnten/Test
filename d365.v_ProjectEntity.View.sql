USE [dynamics]
GO
/****** Object:  View [d365].[v_ProjectEntity]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [d365].[v_ProjectEntity]
AS
WITH Transform AS (
	SELECT DISTINCT
		hp.[Hauptprojekt Nummer],
		hp.[Hauptprojekt Bezeichnung],
		hp.[DiamantId],
		hp.[Plan-Beginn],
		hp.[Plan-Ende],
		hp.[Intern],
		--hp.[Unit],
		DimUnit.DIMENSIONVALUE AS [VDC],
		hp.[Projektleiter],
		wkPL.[PERSONNELNUMBER] AS [WorkerResponsiblePersonnelNumber],
		hp.[Status],
		hp.[Produkte],
		DimServiceline.DIMENSIONVALUE AS [Serviceline],
		hp.[Vertragsart],
		hp.[Projekt nicht überbuchbar],
		hp.[Rechnungsverantwortlicher],
		wkIV.[PERSONNELNUMBER] AS [WorkerRespFinancialPersonnelNumber],
		NULL AS [Kostenstelle]
	FROM [Export Hauptprojekte ohne Kennzahlen] hp
	LEFT JOIN [d365].[Worker] wkPL
	ON wkPL.[LASTNAME] + ' ' + wkPL.[FIRSTNAME] = hp.[Projektleiter]
	JOIN [d365].[ProjectSchedulingResource] psrPL
	ON psrPL.[PERSONNELNUMBER] = wkPL.[PERSONNELNUMBER]
	LEFT JOIN [d365].[Worker] wkIV
	ON wkIV.[LASTNAME] + ' ' + wkIV.[FIRSTNAME] = hp.[Rechnungsverantwortlicher]
	JOIN [d365].[ProjectSchedulingResource] psrIV
	ON psrIV.[PERSONNELNUMBER] = wkIV.[PERSONNELNUMBER]
	LEFT JOIN (
		SELECT DISTINCT x.DIMENSIONVALUE, x.DESCRIPTION
		FROM [d365].[FinancialDimensionValues] x
		WHERE x.[FINANCIALDIMENSION] = N'VDC'
	) DimUnit
	ON hp.[Unit] LIKE DimUnit.DESCRIPTION + N'%' 
	LEFT JOIN (
		SELECT DISTINCT x.DIMENSIONVALUE, x.DESCRIPTION
		FROM [d365].[FinancialDimensionValues] x
		WHERE x.[FINANCIALDIMENSION] = N'Serviceline'
	) DimServiceline
	ON hp.[Produkte] LIKE DimServiceline.DESCRIPTION + N'%' 
), Result AS (
	SELECT
		a.[Hauptprojekt Nummer] + '|' + [Hauptprojekt Bezeichnung] AS [Projectname],
		CASE WHEN a.[DiamantId] = '' THEN '' ELSE RIGHT(N'00000000' + a.[DiamantId], 8) END AS [CustomerAccount],
		REPLACE(TRY_CONVERT(NVARCHAR, TRY_CONVERT(datetime, a.[Plan-Beginn], 104), 126), 'T', ' ') AS [ProjectedStartDate],
		REPLACE(TRY_CONVERT(NVARCHAR, TRY_CONVERT(datetime, a.[Plan-Ende], 104), 126), 'T', ' ') AS [ProjectedEndDate],
		--NULL AS [ProjectGroup],
		N'T&M' AS [ProjectGroup],
		--a.Unit -- = VDC
		--+ '-' 
		--+ a.Produkte -- = Serviceline
		--+ '-' 
		--+ a.[Kostenstelle] -- = CostCenter
		--AS [DimensionDisplayValue],
		--a.Unit,
		--a.[VDC],
		a.Produkte,
		a.[Serviceline],
		a.Kostenstelle,
		dbo.GenerateAccountDisplayValue(a.VDC, a.[Serviceline], a.Kostenstelle) AS [DimensionDisplayValue],
		a.[WorkerResponsiblePersonnelNumber], -- TODO: Workertabelle ziehen
		--[Status] AS [ProjectStage], --
		N'InProcess' AS [ProjectStage], -- because only active projects are imported
		N'TimeMaterial' AS [ProjectType], -- TODO: Fix Project type
		--NULL AS [DataAreaId],
		a.[WorkerRespFinancialPersonnelNumber], 
		CASE 
			WHEN a.[Projekt nicht überbuchbar] = '2' 
			THEN N'AllowOverruns' 
			WHEN a.[Projekt nicht überbuchbar] = '1' 
			THEN N'DisallowOverruns' 
			ELSE N'WarnOfOverruns' 
		END AS [BudgetOverrunDefault],
		N'' AS [ParentProject]
	FROM Transform a	
)
SELECT *
FROM Result

--SELECT DISTINCT *
--FROM d365.FinancialDimensionValues a
--WHERE a.FINANCIALDIMENSION = 'Serviceline'
--AND a.DESCRIPTION LIKE '%Writing%'


		--SELECT DISTINCT x.DIMENSIONVALUE, x.DESCRIPTION
		--FROM [d365].[FinancialDimensionValues] x
		--WHERE x.[FINANCIALDIMENSION] = N'VDC'

GO
