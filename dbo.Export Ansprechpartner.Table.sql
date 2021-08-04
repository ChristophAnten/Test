USE [dynamics]
GO
/****** Object:  Table [dbo].[Export Ansprechpartner]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export Ansprechpartner](
	[Nummer Debitor] [nvarchar](255) NULL,
	[Firmenname] [nvarchar](255) NULL,
	[Nummer Ansprechpartner] [nvarchar](255) NULL,
	[Funktion] [nvarchar](255) NULL,
	[Abteilung] [nvarchar](255) NULL,
	[Anrede] [nvarchar](255) NULL,
	[Titel] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Vorname] [nvarchar](255) NULL,
	[Adresse] [nvarchar](255) NULL,
	[Postfach] [nvarchar](255) NULL,
	[Plz] [nvarchar](255) NULL,
	[Ort] [nvarchar](255) NULL,
	[Land] [nvarchar](255) NULL,
	[Telefon] [nvarchar](255) NULL,
	[Mobil] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[E-Mail-Adresse] [nvarchar](255) NULL,
	[Office] [nvarchar](255) NULL,
	[Gebäude] [nvarchar](255) NULL,
	[Bemerkung] [nvarchar](255) NULL,
	[Sprache] [nvarchar](255) NULL
) ON [PRIMARY]
GO
