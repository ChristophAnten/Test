USE [dynamics]
GO
/****** Object:  Table [bl].[GeneralJournal_GuV_Monthly]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [bl].[GeneralJournal_GuV_Monthly](
	[JOURNALBATCHNUMBER] [nvarchar](100) NULL,
	[JOURNALNAME] [nvarchar](200) NULL,
	[LINENUMBER] [varchar](6) NULL,
	[ACCOUNTDISPLAYVALUE] [nvarchar](200) NULL,
	[ACCOUNTTYPE] [nvarchar](6) NULL,
	[CREDITAMOUNT] [nvarchar](200) NULL,
	[CURRENCYCODE] [nvarchar](3) NULL,
	[DEBITAMOUNT] [nvarchar](200) NULL,
	[TEXT] [nvarchar](46) NULL,
	[OFFSETACCOUNTDISPLAYVALUE] [nvarchar](200) NULL,
	[OFFSETACCOUNTTYPE] [nvarchar](6) NULL,
	[TRANSDATE] [nvarchar](4000) NULL,
	[VOUCHER] [nvarchar](16) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
