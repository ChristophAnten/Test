USE [dynamics]
GO
/****** Object:  Table [dbo].[Export Arbeitspakete ohne Kennzahlen]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export Arbeitspakete ohne Kennzahlen](
	[Hauptprojekt] [nvarchar](2000) NULL,
	[Projekt] [nvarchar](2000) NULL,
	[Vorgang-Nummer] [nvarchar](2000) NULL,
	[Vorgang] [nvarchar](2000) NULL,
	[Arbeitspaket-Nummer] [nvarchar](2000) NULL,
	[Arbeitspaket Bezeichnung] [nvarchar](2000) NULL,
	[Tätigkeit] [nvarchar](2000) NULL,
	[Fakturierbar] [nvarchar](2000) NULL,
	[Mitarbeiter] [nvarchar](2000) NULL,
	[Plan-Beginn] [nvarchar](2000) NULL,
	[Plan-Ende] [nvarchar](2000) NULL,
	[Beginn Zeiterfassung] [nvarchar](2000) NULL,
	[Ende Zeiterfassung] [nvarchar](2000) NULL,
	[Ist-Ende] [nvarchar](2000) NULL,
	[Arbeitspakete nicht überbuchbar] [nvarchar](2000) NULL,
	[Summe der Arbeitspakete im Vorgang nicht überbuchbar] [nvarchar](2000) NULL,
	[Zeiterfassung nur nach Planbeginn] [nvarchar](2000) NULL,
	[Zeiterfassung nur vor Planende] [nvarchar](2000) NULL,
	[Erlöskonto] [nvarchar](2000) NULL,
	[Kostenstelle] [nvarchar](2000) NULL,
	[Mitarbeiter Kostenstelle] [nvarchar](2000) NULL,
	[Land] [nvarchar](2000) NULL,
	[Projekt-Produkt] [nvarchar](2000) NULL,
	[Rolle] [nvarchar](2000) NULL,
	[Externer Stundensatz] [nvarchar](2000) NULL,
	[Externer Stundensatz (Projektwährung)] [nvarchar](2000) NULL,
	[Währung] [nvarchar](2000) NULL,
	[Intercompany-Stundensatz] [nvarchar](2000) NULL
) ON [PRIMARY]

GO
