USE [dynamics]
GO
/****** Object:  Table [dbo].[Export aktive Mitarbeiter]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export aktive Mitarbeiter](
	[Interner Schlüssel] [nvarchar](200) NULL,
	[Name] [nvarchar](200) NULL,
	[Vorname] [nvarchar](200) NULL,
	[Geburtsname] [nvarchar](200) NULL,
	[Unit] [nvarchar](200) NULL,
	[Vertragsverhältnis] [nvarchar](200) NULL,
	[Tätigkeitsstätte] [nvarchar](200) NULL,
	[Kostenstelle aus MA-Vertrag] [nvarchar](200) NULL
) ON [PRIMARY]

GO
