USE [dynamics]
GO
/****** Object:  Table [bl].[GeneralJournal_GuV_Monthly]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bl].[GeneralJournal_GuV_Monthly](
	[JOURNALNAME] [nvarchar](100) NULL,
	[ACCOUNTDISPLAYVALUE] [nvarchar](407) NULL,
	[ACCOUNTTYPE] [nvarchar](6) NOT NULL,
	[CREDITAMOUNT] [money] NULL,
	[CURRENCYCODE] [nvarchar](3) NOT NULL,
	[DEBITAMOUNT] [money] NULL,
	[DESCRIPTION] [nvarchar](46) NULL,
	[OFFSETACCOUNTDISPLAYVALUE] [nvarchar](407) NULL,
	[OFFSETACCOUNTTYPE] [nvarchar](6) NOT NULL,
	[TRANSDATE] [date] NULL,
	[Saldo] [money] NULL
) ON [PRIMARY]
GO
