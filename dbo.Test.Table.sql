USE [dynamics]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[Hauptprojekt Nummer] [nvarchar](300) NULL,
	[Hauptprojekt Bezeichnung] [nvarchar](300) NULL,
	[DiamantId] [nvarchar](300) NULL,
	[Kunde] [nvarchar](300) NULL,
	[Kundenansprechpartner Nummer] [nvarchar](300) NULL,
	[Kundenansprechpartner] [nvarchar](300) NULL,
	[Opportunity-ID SalesForce] [nvarchar](300) NULL,
	[Opportunity-Link SalesForce] [nvarchar](300) NULL,
	[Plan-Beginn] [nvarchar](300) NULL,
	[Plan-Ende] [nvarchar](300) NULL,
	[Fakturierbar] [nvarchar](300) NULL,
	[Intern] [nvarchar](300) NULL,
	[Hauptunit] [nvarchar](300) NULL,
	[Unit] [nvarchar](300) NULL,
	[Projektleiter] [nvarchar](300) NULL,
	[Service Coordinator] [nvarchar](300) NULL,
	[Status] [nvarchar](300) NULL,
	[Gruppierung] [nvarchar](300) NULL,
	[Produkte] [nvarchar](300) NULL,
	[Rechnungsempfänger] [nvarchar](300) NULL,
	[Abweichende Debitoren] [nvarchar](300) NULL,
	[Zahlungsziel] [nvarchar](300) NULL,
	[Vertragsart] [nvarchar](300) NULL,
	[Abrechnungsart] [nvarchar](300) NULL,
	[Abrechnungsrhythmus] [nvarchar](300) NULL,
	[Versandart] [nvarchar](300) NULL,
	[per Mail] [nvarchar](300) NULL,
	[Template Rechnung] [nvarchar](300) NULL,
	[Rechnungsverantwortlicher] [nvarchar](300) NULL,
	[Zeiterfassung nur nach Planbeginn] [nvarchar](300) NULL,
	[Zeiterfassung nur vor Planende] [nvarchar](300) NULL,
	[Projekt nicht überbuchbar] [nvarchar](300) NULL,
	[Faktura Bemerkungen] [nvarchar](300) NULL,
	[Externer Stundensatz] [nvarchar](300) NULL,
	[Währung] [nvarchar](300) NULL,
	[Tagesaktuellen Kurs verwenden] [nvarchar](300) NULL,
	[Fester Kurs] [nvarchar](300) NULL,
	[Spezieller Tagessatz in der Rechnung] [nvarchar](300) NULL,
	[Auftragsdatum] [nvarchar](300) NULL,
	[Summe Forecast] [nvarchar](300) NULL,
	[Gruppiert nach   ] [nvarchar](300) NULL,
	[Nachweis zur Rechnung] [nvarchar](300) NULL,
	[Kundenzusatzfelder] [nvarchar](300) NULL,
	[Reisekosteninformationen] [nvarchar](300) NULL,
	[COS] [nvarchar](300) NULL
) ON [PRIMARY]

GO
