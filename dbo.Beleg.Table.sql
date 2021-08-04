USE [dynamics]
GO
/****** Object:  Table [dbo].[Beleg]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beleg](
	[DVBelegnummer] [nvarchar](200) NULL,
	[Buchungsperiode] [nvarchar](200) NULL,
	[Filiale] [nvarchar](200) NULL,
	[Herkunft] [nvarchar](200) NULL,
	[Belegart] [nvarchar](200) NULL,
	[Stapel] [nvarchar](200) NULL,
	[Journalnummer] [nvarchar](200) NULL,
	[WJJournalnummer] [nvarchar](200) NULL,
	[ErfassungAm] [nvarchar](200) NULL,
	[ErfassungVon] [nvarchar](200) NULL,
	[Sortierung] [nvarchar](200) NULL,
	[BuchungAm] [nvarchar](200) NULL,
	[BuchungVon] [nvarchar](200) NULL,
	[Belegdatum] [nvarchar](200) NULL,
	[Belegnummer] [nvarchar](200) NULL,
	[InterneBelegnummer] [nvarchar](200) NULL,
	[Generalumgekehrt] [nvarchar](200) NULL,
	[Unvollstaendig] [nvarchar](200) NULL,
	[Geschaeftskz] [nvarchar](200) NULL,
	[Waehrung] [nvarchar](200) NULL,
	[Kurs] [nvarchar](200) NULL,
	[FWBeleg] [nvarchar](200) NULL,
	[DBTrackingCode] [nvarchar](200) NULL
) ON [PRIMARY]
GO
