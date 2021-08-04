USE [dynamics]
GO
/****** Object:  Table [dbo].[Export Arbeitspakete mit Kennzahlen]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export Arbeitspakete mit Kennzahlen](
	[Hauptprojekt Nummer] [nvarchar](2000) NULL,
	[Hauptprojekt Bezeichnung] [nvarchar](2000) NULL,
	[Teilprojekt Nummer] [nvarchar](2000) NULL,
	[Teilprojekt Bezeichnung] [nvarchar](2000) NULL,
	[Arbeitspaket-Nummer] [nvarchar](2000) NULL,
	[Arbeitspaket Bezeichnung] [nvarchar](2000) NULL,
	[Vorgang-Nummer] [nvarchar](2000) NULL,
	[Vorgang] [nvarchar](2000) NULL,
	[Tätigkeit] [nvarchar](2000) NULL,
	[Status] [nvarchar](2000) NULL,
	[Fakturierbar] [nvarchar](2000) NULL,
	[Interner Schlüssel] [nvarchar](2000) NULL,
	[Mitarbeiter] [nvarchar](2000) NULL,
	[Plan-Beginn] [nvarchar](2000) NULL,
	[Plan-Ende] [nvarchar](2000) NULL,
	[Ist-Ende] [nvarchar](2000) NULL,
	[Arbeitspakete nicht überbuchbar] [nvarchar](2000) NULL,
	[Summe der Arbeitspakete im Vorgang nicht überbuchbar] [nvarchar](2000) NULL,
	[Kostenstelle] [nvarchar](2000) NULL,
	[MA-Kostenstelle] [nvarchar](2000) NULL,
	[Land] [nvarchar](2000) NULL,
	[Projekt-Produkt] [nvarchar](2000) NULL,
	[Rolle] [nvarchar](2000) NULL,
	[Externer Stundensatz] [nvarchar](2000) NULL,
	[Intercompany-Stundensatz] [nvarchar](2000) NULL,
	[Externer Stundensatz (Projektwährung)] [nvarchar](2000) NULL,
	[Währung] [nvarchar](2000) NULL,
	[Soll-Aufwand] [nvarchar](2000) NULL,
	[Plan-Aufwand] [nvarchar](2000) NULL,
	[Ist-Aufwand] [nvarchar](2000) NULL,
	[Fakturierter Aufwand] [nvarchar](2000) NULL
) ON [PRIMARY]

GO
