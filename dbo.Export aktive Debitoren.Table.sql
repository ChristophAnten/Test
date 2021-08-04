USE [dynamics]
GO
/****** Object:  Table [dbo].[Export aktive Debitoren]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export aktive Debitoren](
	[Steuernummer] [varchar](50) NULL,
	[Ort] [varchar](50) NULL,
	[Land] [varchar](50) NULL,
	[Nummer] [nvarchar](4000) NULL,
	[DiamantId] [nvarchar](4000) NULL,
	[Firmenname] [nvarchar](4000) NULL,
	[Firmenzusatz] [nvarchar](4000) NULL,
	[Plz] [nvarchar](4000) NULL,
	[Adresse] [nvarchar](4000) NULL,
	[weitere Adressen] [nvarchar](4000) NULL,
	[Ansprechpartner] [nvarchar](4000) NULL,
	[Telefon] [nvarchar](4000) NULL,
	[Fax] [nvarchar](4000) NULL,
	[E-Mail-Adresse] [nvarchar](4000) NULL,
	[Sprache] [nvarchar](4000) NULL,
	[Web] [nvarchar](4000) NULL,
	[Intercompany] [nvarchar](4000) NULL,
	[Kundenzusatzfelder] [nvarchar](4000) NULL,
	[Währung] [nvarchar](4000) NULL,
	[Umsatzsteuer-ID] [nvarchar](4000) NULL,
	[Umsatzsteuer] [nvarchar](4000) NULL,
	[Zahlungsmodalitäten] [nvarchar](4000) NULL,
	[Zahlungsziel] [nvarchar](4000) NULL,
	[Name der Bank] [nvarchar](4000) NULL,
	[IBAN] [nvarchar](4000) NULL,
	[BIC] [nvarchar](4000) NULL,
	[Anlagedatum] [nvarchar](4000) NULL,
	[Fakturierter Umsatz] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
