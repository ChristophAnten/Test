USE [dynamics]
GO
/****** Object:  Table [dbo].[Kreditorenliste PLX DE Online]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kreditorenliste PLX DE Online](
	[Kontonummer] [varchar](50) NULL,
	[Column 1] [varchar](50) NULL,
	[UStIdentNr] [varchar](50) NULL,
	[Steuernummer] [varchar](50) NULL,
	[#VerbUnternehmen] [varchar](50) NULL,
	[Zahlungskondition] [varchar](50) NULL,
	[IBANNummer] [varchar](50) NULL,
	[BuchenGesperrt] [varchar](50) NULL,
	[EMail] [varchar](50) NULL,
	[Name1] [varchar](50) NULL,
	[Name2] [varchar](50) NULL,
	[PLZ] [varchar](50) NULL,
	[Ort] [varchar](50) NULL,
	[Strasse] [varchar](50) NULL,
	[Zahlungsart] [varchar](50) NULL,
	[Land] [varchar](50) NULL,
	[Konto CS+] [varchar](50) NULL,
	[Column 17] [varchar](50) NULL
) ON [PRIMARY]
GO
