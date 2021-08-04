USE [dynamics]
GO
/****** Object:  Table [d365].[ProjectSchedulingResource]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [d365].[ProjectSchedulingResource](
	[RESOURCEID] [nvarchar](300) NULL,
	[RESOURCECOMPANYID] [nvarchar](300) NULL,
	[NAME] [nvarchar](300) NULL,
	[PERSONNELNUMBER] [nvarchar](300) NULL,
	[TYPE] [nvarchar](300) NULL,
	[VENDID] [nvarchar](300) NULL
) ON [PRIMARY]

GO
