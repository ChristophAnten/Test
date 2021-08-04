USE [dynamics]
GO
/****** Object:  Table [d365].[FinancialDimensionValues]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [d365].[FinancialDimensionValues](
	[FINANCIALDIMENSION] [nvarchar](300) NULL,
	[LEGALENTITYID] [nvarchar](300) NULL,
	[DIMENSIONVALUE] [nvarchar](300) NULL,
	[ACTIVEFROM] [nvarchar](300) NULL,
	[ACTIVETO] [nvarchar](300) NULL,
	[DESCRIPTION] [nvarchar](300) NULL,
	[GROUPDIMENSION] [nvarchar](300) NULL,
	[ISBALANCING_PSN] [nvarchar](300) NULL,
	[ISBLOCKEDFORMANUALENTRY] [nvarchar](300) NULL,
	[ISSUSPENDED] [nvarchar](300) NULL,
	[ISTOTAL] [nvarchar](300) NULL,
	[OWNER] [nvarchar](300) NULL
) ON [PRIMARY]

GO
