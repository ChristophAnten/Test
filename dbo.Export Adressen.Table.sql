USE [dynamics]
GO
/****** Object:  Table [dbo].[Export Adressen]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export Adressen](
	[Nr  Debitor] [nvarchar](255) NULL,
	[Firmenname] [nvarchar](255) NULL,
	[Abweichender Kontaktname] [nvarchar](255) NULL,
	[Adressart] [nvarchar](255) NULL,
	[Nr  Adresse] [nvarchar](255) NULL,
	[Straße] [nvarchar](255) NULL,
	[Plz] [nvarchar](255) NULL,
	[Ort] [nvarchar](255) NULL,
	[Land] [nvarchar](255) NULL,
	[Hauspostcode] [nvarchar](255) NULL
) ON [PRIMARY]
GO
