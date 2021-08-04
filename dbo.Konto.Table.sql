USE [dynamics]
GO
/****** Object:  Table [dbo].[Konto]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Konto](
	[DVKontonummer] [nvarchar](200) NULL,
	[Klasse] [nvarchar](200) NULL,
	[Kontonummer] [nvarchar](200) NULL,
	[Filiale] [nvarchar](200) NULL,
	[Bezeichnung] [nvarchar](200) NULL,
	[Bezeichnung2] [nvarchar](200) NULL,
	[Matchcode] [nvarchar](200) NULL,
	[Berechtigung] [nvarchar](200) NULL,
	[OPKonto] [nvarchar](200) NULL,
	[BuchenGesperrt] [nvarchar](200) NULL,
	[LoeschenVorgemerkt] [nvarchar](200) NULL,
	[LetzteKtoSeite] [nvarchar](200) NULL,
	[BezeichnungAlt] [nvarchar](200) NULL,
	[Bezeichnung2Alt] [nvarchar](200) NULL,
	[Konzernobjekt] [nvarchar](200) NULL,
	[IndivAbweichung] [nvarchar](200) NULL,
	[Version] [nvarchar](200) NULL,
	[GeaendertAm] [nvarchar](200) NULL,
	[GeaendertVon] [nvarchar](200) NULL,
	[DVDimension5] [nvarchar](200) NULL,
	[DVDimension6] [nvarchar](200) NULL,
	[BuchenMitDim5] [nvarchar](200) NULL
) ON [PRIMARY]
GO
