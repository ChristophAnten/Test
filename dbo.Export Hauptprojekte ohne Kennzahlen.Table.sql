USE [dynamics]
GO
/****** Object:  Table [dbo].[Export Hauptprojekte ohne Kennzahlen]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export Hauptprojekte ohne Kennzahlen](
	[Kunde] [nvarchar](2000) NULL,
	[DiamantId] [nvarchar](2000) NULL,
	[Kundenansprechpartner] [nvarchar](2000) NULL,
	[Opportunity-ID SalesForce] [nvarchar](2000) NULL,
	[Opportunity-Link SalesForce] [nvarchar](2000) NULL,
	[Plan-Beginn] [nvarchar](2000) NULL,
	[Plan-Ende] [nvarchar](2000) NULL,
	[Fakturierbar] [nvarchar](2000) NULL,
	[Intern] [nvarchar](2000) NULL,
	[Hauptunit] [nvarchar](2000) NULL,
	[Unit] [nvarchar](2000) NULL,
	[Projektleiter] [nvarchar](2000) NULL,
	[Service Coordinator] [nvarchar](2000) NULL,
	[Status] [nvarchar](2000) NULL,
	[Gruppierung] [nvarchar](2000) NULL,
	[Produkte] [nvarchar](2000) NULL,
	[Rechnungsempfänger] [nvarchar](2000) NULL,
	[Abweichende Debitoren] [nvarchar](2000) NULL,
	[Zahlungsziel] [nvarchar](2000) NULL,
	[Vertragsart] [nvarchar](2000) NULL,
	[Abrechnungsart] [nvarchar](2000) NULL,
	[Abrechnungsrhythmus] [nvarchar](2000) NULL,
	[Versandart] [nvarchar](2000) NULL,
	[per Mail] [nvarchar](2000) NULL,
	[Template Rechnung] [nvarchar](2000) NULL,
	[Rechnungsverantwortlicher] [nvarchar](2000) NULL,
	[Zeiterfassung nur nach Planbeginn] [nvarchar](2000) NULL,
	[Zeiterfassung nur vor Planende] [nvarchar](2000) NULL,
	[Projekt nicht überbuchbar] [nvarchar](2000) NULL,
	[Faktura Bemerkungen] [nvarchar](2000) NULL,
	[Externer Stundensatz] [nvarchar](2000) NULL,
	[Währung] [nvarchar](2000) NULL,
	[Tagesaktuellen Kurs verwenden] [nvarchar](2000) NULL,
	[Fester Kurs] [nvarchar](2000) NULL,
	[Spezieller Tagessatz in der Rechnung] [nvarchar](2000) NULL,
	[Auftragsdatum] [nvarchar](2000) NULL,
	[Summe Forecast] [nvarchar](2000) NULL,
	[Gruppiert nach   ] [nvarchar](2000) NULL,
	[Nachweis zur Rechnung] [nvarchar](2000) NULL,
	[Kundenzusatzfelder] [nvarchar](2000) NULL,
	[Reisekosteninformationen] [nvarchar](2000) NULL,
	[COS] [nvarchar](2000) NULL,
	[Hauptprojekt Nummer] [nvarchar](2000) NULL,
	[Hauptprojekt Bezeichnung] [nvarchar](2000) NULL,
	[Kundenansprechpartner Nummer] [nvarchar](2000) NULL
) ON [PRIMARY]

GO
