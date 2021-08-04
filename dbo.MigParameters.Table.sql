USE [dynamics]
GO
/****** Object:  Table [dbo].[MigParameters]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MigParameters](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Value] [nvarchar](200) NULL,
	[Type] [nvarchar](200) NULL
) ON [PRIMARY]
GO
