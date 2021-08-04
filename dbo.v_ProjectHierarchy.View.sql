USE [dynamics]
GO
/****** Object:  View [dbo].[v_ProjectHierarchy]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_ProjectHierarchy]
AS
WITH Base AS (
	SELECT
		a.[Hauptprojekt Nummer]
		, a.[Hauptprojekt Bezeichnung]
		, a.[Teilprojekt Nummer]
		, a.[Teilprojekt Bezeichnung]
		, a.[Arbeitspaket-Nummer]
		, a.[Arbeitspaket Bezeichnung]
		, a.[Vorgang-Nummer]
		, a.Vorgang
		, a.Tätigkeit
		, a.Mitarbeiter
		, a.[Externer Stundensatz]
		, a.[Externer Stundensatz (Projektwährung)]
		, a.[Intercompany-Stundensatz]
	FROM [Export Arbeitspakete mit Kennzahlen] a	
	--WHERE a.[Hauptprojekt Nummer] = 'BAPH16005' -- u.a. dieses Hauptprojekt existiert in [Export Hauptprojekte ohne Kennzahlen] aber nicht in [Export Arbeitspakete mit Kennzahlen]
), ProjectLevel_0 AS (
	SELECT DISTINCT 
		0									AS [Level]
		, NULL								AS [ParentProject]
		, a.[Hauptprojekt Nummer]			AS [ProjectId]
		, a.[Hauptprojekt Bezeichnung]		AS [Projectname]
	FROM Base a
), ProjectLevel_1 AS (
	SELECT DISTINCT 
		1									AS [Level]
		, a.[Hauptprojekt Nummer]				AS [ParentProject]
		, a.[Teilprojekt Nummer]			AS [ProjectId]
		, a.[Teilprojekt Bezeichnung]		AS [Projectname]
	FROM Base a
), ProjectLevel_2 AS (
	SELECT DISTINCT 
		2									AS [Level]
		, a.[Teilprojekt Nummer]			AS [ParentProject]
		, a.[Vorgang-Nummer]				AS [ProjectId]
		, a.Vorgang							AS [Projectname]
	FROM Base a
), ProjectLevel_3 AS (
	SELECT DISTINCT 
		2									AS [Level]
		, a.[Vorgang-Nummer]				AS [ParentProject]
		, a.[Arbeitspaket-Nummer]			AS [ProjectId]
		, a.[Arbeitspaket Bezeichnung]		AS [Projectname]
	FROM Base a
), UnionStructure AS (
	SELECT *
	FROM ProjectLevel_0
	UNION ALL
	SELECT *
	FROM ProjectLevel_1
	UNION ALL
	SELECT *
	FROM ProjectLevel_2
	UNION ALL
	SELECT *
	FROM ProjectLevel_3
)
SELECT *
FROM Base
--ORDER BY Level, ParentProject

GO
