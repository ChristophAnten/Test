USE [dynamics]
GO
/****** Object:  Table [dbo].[Koredaten]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Koredaten](
	[Nummer] [nvarchar](200) NULL,
	[DVBuchungsnummer] [nvarchar](200) NULL,
	[Kostenstelle] [nvarchar](200) NULL,
	[Kostentraeger] [nvarchar](200) NULL,
	[Dimension3] [nvarchar](200) NULL,
	[Dimension4] [nvarchar](200) NULL,
	[Dimension5] [nvarchar](200) NULL,
	[Dimension6] [nvarchar](200) NULL,
	[Dimension7] [nvarchar](200) NULL,
	[Dimension8] [nvarchar](200) NULL,
	[Betrag] [nvarchar](200) NULL,
	[FWBetrag] [nvarchar](200) NULL,
	[Menge] [nvarchar](200) NULL,
	[Aufteilung] [nvarchar](200) NULL,
	[Variabel] [nvarchar](200) NULL,
	[Variator] [nvarchar](200) NULL,
	[KOREVerarbeitet] [nvarchar](200) NULL,
	[KORE2Verarbeitet] [nvarchar](200) NULL,
	[Statistisch] [nvarchar](200) NULL,
	[DVKOKArt] [nvarchar](200) NULL,
	[StS] [nvarchar](200) NULL,
	[Skontokonto] [nvarchar](200) NULL
) ON [PRIMARY]

GO
