USE [dynamics]
GO
/****** Object:  Table [dbo].[Saldo]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saldo](
	[Nummer] [nvarchar](200) NULL,
	[DVKontonummer] [nvarchar](200) NULL,
	[WJBeginn] [nvarchar](200) NULL,
	[Buchungsperiode] [nvarchar](200) NULL,
	[Waehrung] [nvarchar](200) NULL,
	[Soll] [nvarchar](200) NULL,
	[Haben] [nvarchar](200) NULL,
	[Warenumsatz] [nvarchar](200) NULL,
	[VorlSoll] [nvarchar](200) NULL,
	[VorlHaben] [nvarchar](200) NULL,
	[VorlWarenumsatz] [nvarchar](200) NULL
) ON [PRIMARY]

GO
