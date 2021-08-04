USE [dynamics]
GO
/****** Object:  Table [dbo].[Mapping_Language]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mapping_Language](
	[Sprache] [varchar](50) NULL,
	[ISO-Sprach­bezeichnung] [varchar](50) NULL,
	[639-1] [varchar](50) NULL,
	[639-2 T] [varchar](50) NULL,
	[639-2 B] [varchar](50) NULL,
	[Endonym] [varchar](50) NULL
) ON [PRIMARY]
GO
