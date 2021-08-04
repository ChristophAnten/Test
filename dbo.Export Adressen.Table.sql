USE [dynamics]
GO
/****** Object:  Table [dbo].[Export Adressen]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export Adressen](
	[Nr# Debitor] [nvarchar](200) NULL,
	[Firmenname] [nvarchar](200) NULL,
	[Abweichender Kontaktname] [nvarchar](200) NULL,
	[Adressart] [nvarchar](200) NULL,
	[Nr# Adresse] [nvarchar](200) NULL,
	[Straße] [nvarchar](200) NULL,
	[Plz] [nvarchar](200) NULL,
	[Ort] [nvarchar](200) NULL,
	[Land] [nvarchar](200) NULL,
	[Hauspostcode] [nvarchar](200) NULL
) ON [PRIMARY]

GO
