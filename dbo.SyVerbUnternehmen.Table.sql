USE [dynamics]
GO
/****** Object:  Table [dbo].[SyVerbUnternehmen]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SyVerbUnternehmen](
	[Bezeichnung] [nvarchar](200) NULL,
	[GeaendertAm] [nvarchar](200) NULL,
	[GeaendertVon] [nvarchar](200) NULL,
	[DVSyVerbUntern] [nvarchar](200) NULL,
	[Firmennummer] [nvarchar](200) NULL,
	[Unternehmensnummer] [nvarchar](200) NULL
) ON [PRIMARY]

GO
