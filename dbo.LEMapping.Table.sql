USE [dynamics]
GO
/****** Object:  Table [dbo].[LEMapping]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LEMapping](
	[DiamantCompany] [nvarchar](4) NULL,
	[DynamicsCompany] [nvarchar](4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UIX_UniqueMapping]    Script Date: 8/4/2021 9:46:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIX_UniqueMapping] ON [dbo].[LEMapping]
(
	[DiamantCompany] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
