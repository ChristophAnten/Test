USE [dynamics]
GO
/****** Object:  Table [dbo].[Tradingpartner]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tradingpartner](
	[Unternehmensnummer] [nvarchar](200) NULL,
	[Bezeichnung] [nvarchar](200) NULL,
	[Mandantennummer] [nvarchar](200) NULL
) ON [PRIMARY]
GO
