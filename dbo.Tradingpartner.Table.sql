USE [dynamics]
GO
/****** Object:  Table [dbo].[Tradingpartner]    Script Date: 8/4/2021 9:46:23 PM ******/
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
