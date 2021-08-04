USE [dynamics]
GO
/****** Object:  Table [dbo].[AnlageAfAArt]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnlageAfAArt](
	[AfAArt] [nvarchar](300) NULL,
	[AfAMethode] [nvarchar](300) NULL,
	[LeistungSoll] [nvarchar](300) NULL,
	[LeistungGesamt] [nvarchar](300) NULL,
	[AKHKMaske] [nvarchar](300) NULL,
	[AKHKGesamt] [nvarchar](300) NULL,
	[AfAGesamt] [nvarchar](300) NULL,
	[SAfAGesamt] [nvarchar](300) NULL,
	[TWAfAGesamt] [nvarchar](300) NULL,
	[ZuschussGesamt] [nvarchar](300) NULL,
	[Restbuchwert] [nvarchar](300) NULL,
	[Nutzungsdauer] [nvarchar](300) NULL,
	[Restnutzdauer] [nvarchar](300) NULL,
	[AfAProzent] [nvarchar](300) NULL,
	[AfABeginn] [nvarchar](300) NULL,
	[Schichtfaktor] [nvarchar](300) NULL,
	[VereinfRegel] [nvarchar](300) NULL,
	[SonderAfATabelle] [nvarchar](300) NULL,
	[ManuelleAfA] [nvarchar](300) NULL,
	[Leistung] [nvarchar](300) NULL,
	[AbgangBerechnetBis] [nvarchar](300) NULL,
	[AbgangBerechnetMit] [nvarchar](300) NULL,
	[DVAnlagenummer] [nvarchar](300) NULL
) ON [PRIMARY]

GO
