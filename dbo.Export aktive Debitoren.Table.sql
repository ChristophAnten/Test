USE [dynamics]
GO
/****** Object:  Table [dbo].[Export aktive Debitoren]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export aktive Debitoren](
	[Nummer] [nvarchar](200) NULL,
	[DiamantId] [nvarchar](200) NULL,
	[Firmenname] [nvarchar](200) NULL,
	[Firmenzusatz] [nvarchar](200) NULL,
	[Plz] [nvarchar](200) NULL,
	[Ort] [nvarchar](200) NULL,
	[Adresse] [nvarchar](200) NULL,
	[Land] [nvarchar](200) NULL,
	[weitere Adressen] [nvarchar](200) NULL,
	[Ansprechpartner] [nvarchar](200) NULL,
	[Telefon] [nvarchar](200) NULL,
	[Fax] [nvarchar](200) NULL,
	[E-Mail-Adresse] [nvarchar](200) NULL,
	[Sprache] [nvarchar](200) NULL,
	[Web] [nvarchar](200) NULL,
	[Intercompany] [nvarchar](200) NULL,
	[Kundenzusatzfelder] [nvarchar](200) NULL,
	[Währung] [nvarchar](200) NULL,
	[Umsatzsteuer-ID] [nvarchar](200) NULL,
	[Umsatzsteuer] [nvarchar](200) NULL,
	[Steuernummer] [nvarchar](200) NULL,
	[Zahlungsmodalitäten] [nvarchar](200) NULL,
	[Zahlungsziel] [nvarchar](200) NULL,
	[Name der Bank] [nvarchar](200) NULL,
	[IBAN] [nvarchar](200) NULL,
	[BIC] [nvarchar](200) NULL,
	[Anlagedatum] [nvarchar](200) NULL,
	[Fakturierter Umsatz] [nvarchar](200) NULL
) ON [PRIMARY]

GO
