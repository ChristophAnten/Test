USE [dynamics]
GO
/****** Object:  Table [dbo].[Export Festpreise und Abos]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export Festpreise und Abos](
	[Vertragsart] [nvarchar](2000) NULL,
	[Abrechnungsart] [nvarchar](2000) NULL,
	[Hauptprojekt] [nvarchar](2000) NULL,
	[Budget] [nvarchar](2000) NULL,
	[Kostenstelle] [nvarchar](2000) NULL,
	[Rechnungsverantwortlicher] [nvarchar](2000) NULL,
	[Kunde] [nvarchar](2000) NULL,
	[Land] [nvarchar](2000) NULL,
	[Umsatzsteuer] [nvarchar](2000) NULL,
	[Kategorie] [nvarchar](2000) NULL,
	[Abrechnungsintervall] [nvarchar](2000) NULL,
	[Leistungszeitraum unbekannt] [nvarchar](2000) NULL,
	[Beginn] [nvarchar](2000) NULL,
	[Ende] [nvarchar](2000) NULL,
	[Festpreis   Abo] [nvarchar](2000) NULL,
	[Festpreis   Abo (€)] [nvarchar](2000) NULL,
	[Fertigstellungsgrad %] [nvarchar](2000) NULL
) ON [PRIMARY]

GO
