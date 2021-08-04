USE [dynamics]
GO
/****** Object:  Table [dbo].[Buchung]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buchung](
	[DVBuchungsnummer] [nvarchar](200) NULL,
	[DVBelegnummer] [nvarchar](200) NULL,
	[DVKontonummer] [nvarchar](200) NULL,
	[Buchungsperiode] [nvarchar](200) NULL,
	[Steuerschluessel] [nvarchar](200) NULL,
	[Buchungskz] [nvarchar](200) NULL,
	[InfoGegenkonto] [nvarchar](200) NULL,
	[Soll] [nvarchar](200) NULL,
	[Haben] [nvarchar](200) NULL,
	[Warenumsatz] [nvarchar](200) NULL,
	[KontendruckSeite] [nvarchar](200) NULL,
	[Text] [nvarchar](200) NULL,
	[FwSoll] [nvarchar](200) NULL,
	[FwHaben] [nvarchar](200) NULL,
	[FwWarenumsatz] [nvarchar](200) NULL,
	[SammelktoBuchung] [nvarchar](200) NULL,
	[Sammelkonto] [nvarchar](200) NULL,
	[Sammelbu] [nvarchar](200) NULL,
	[Verdichtung] [nvarchar](200) NULL,
	[Verdichtungsbu] [nvarchar](200) NULL,
	[Filiale] [nvarchar](200) NULL,
	[SachKtoAuszNr] [nvarchar](200) NULL,
	[WechselKz] [nvarchar](200) NULL,
	[GebuchteSteuer] [nvarchar](200) NULL,
	[FwGebuchteSteuer] [nvarchar](200) NULL,
	[InUStVA] [nvarchar](200) NULL,
	[DVBewegungsart] [nvarchar](200) NULL,
	[Herkunft] [nvarchar](200) NULL,
	[DVAbgVerbUntern] [nvarchar](200) NULL,
	[DVEmpfVerbUntern] [nvarchar](200) NULL
) ON [PRIMARY]

GO
