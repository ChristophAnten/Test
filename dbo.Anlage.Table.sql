USE [dynamics]
GO
/****** Object:  Table [dbo].[Anlage]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anlage](
	[DVAnlagenummer] [nvarchar](300) NULL,
	[Anlagegruppe] [nvarchar](300) NULL,
	[Anlagenummer] [nvarchar](300) NULL,
	[Zusatznummer] [nvarchar](300) NULL,
	[Bezeichnung] [nvarchar](300) NULL,
	[Bezeichnung2] [nvarchar](300) NULL,
	[Status] [nvarchar](300) NULL,
	[Menge] [nvarchar](300) NULL,
	[Alterfassung] [nvarchar](300) NULL,
	[Anlagekonto] [nvarchar](300) NULL,
	[Anschaffungsdatum] [nvarchar](300) NULL,
	[Lieferant] [nvarchar](300) NULL,
	[DVKontonummer] [nvarchar](300) NULL,
	[Standort] [nvarchar](300) NULL,
	[DVAnbuStandort] [nvarchar](300) NULL,
	[Filiale] [nvarchar](300) NULL,
	[Seriennummer] [nvarchar](300) NULL,
	[Selektion] [nvarchar](300) NULL,
	[Matchcode] [nvarchar](300) NULL,
	[Kostenstelle] [nvarchar](300) NULL,
	[Foerdermassnahme] [nvarchar](300) NULL,
	[WBWManuell] [nvarchar](300) NULL,
	[Schrottwert] [nvarchar](300) NULL,
	[Leasingrate] [nvarchar](300) NULL,
	[LeasRhythmus] [nvarchar](300) NULL,
	[LeasAnzRaten] [nvarchar](300) NULL,
	[LeasZinssatz] [nvarchar](300) NULL,
	[LeasBarwert] [nvarchar](300) NULL,
	[Versicherung] [nvarchar](300) NULL,
	[VersicherungsNr] [nvarchar](300) NULL,
	[Gefahrenklasse] [nvarchar](300) NULL,
	[IndexVers] [nvarchar](300) NULL,
	[VersWertManuell] [nvarchar](300) NULL,
	[Einheitswert] [nvarchar](300) NULL,
	[VermoegenswertMan] [nvarchar](300) NULL,
	[AnhalteProzentsatz] [nvarchar](300) NULL,
	[Anhaltewert] [nvarchar](300) NULL,
	[Vermoegenswert] [nvarchar](300) NULL,
	[Text] [nvarchar](300) NULL,
	[GeaendertAm] [nvarchar](300) NULL,
	[GeaendertVon] [nvarchar](300) NULL,
	[Hersteller] [nvarchar](300) NULL,
	[LoeschenVorgemerkt] [nvarchar](300) NULL
) ON [PRIMARY]

GO
