USE [dynamics]
GO
/****** Object:  View [dbo].[v_SALESTAXEXEMPTNUMBERS]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	
JoinedQuery
	let
		Quelle = Table.NestedJoin(#"Kreditorenliste PLX DE Online", {"Kontonummer"}, #"BIC Bankkto Sammelkto Online", {"Kontonummer"}, "ExportBICBankkontoSammelkonto", JoinKind.LeftOuter),
		#"Erweiterte ExportBICBankkontoSammelkonto" = Table.ExpandTableColumn(Quelle, "ExportBICBankkontoSammelkonto", {"Sammelkonto", "BIC", "Bankkonto"}, {"Sammelkonto", "BIC", "Bankkonto"}),
		#"Zusammengeführte Abfragen" = Table.NestedJoin(#"Erweiterte ExportBICBankkontoSammelkonto", {"Land"}, Diamant_Country_Format_Description, {"DiamantID"}, "Diamant_Country_Format_Description", JoinKind.LeftOuter),
		#"Erweiterte Diamant_Country_Format_Description" = Table.ExpandTableColumn(#"Zusammengeführte Abfragen", "Diamant_Country_Format_Description", {"ISO3"}, {"ISO3"}),
		#"Zusammengeführte Abfragen1" = Table.NestedJoin(#"Erweiterte Diamant_Country_Format_Description", {"ISO3"}, EUCountries, {"ISO 3166-1 Alpha-3"}, "EUCountries", JoinKind.LeftOuter),
		#"Erweiterte EUCountries" = Table.ExpandTableColumn(#"Zusammengeführte Abfragen1", "EUCountries", {"ISO 3166-1 Alpha-3"}, {"ISO 3166-1 Alpha-3"}),
		IsEUCountry = Table.AddColumn(#"Erweiterte EUCountries", "IsEUCountry", each if [#"ISO 3166-1 Alpha-3"] = null then false else true),
		#"Entfernte Spalten" = Table.RemoveColumns(IsEUCountry,{"ISO 3166-1 Alpha-3"})

Kreditorenliste PLX DE Online
	let
		Quelle = Excel.Workbook(Web.Contents("https://yespharmaservices.sharepoint.com/sites/PharmaLex_Prj_ERP_D365/Shared Documents/Data Migration/Raw legacy data/20201023 Excel Export Kreditorenliste PLX DE (aus Anzeige).xlsx"), null, true),
		#"Kreditorenliste PLX DE_Sheet" = Quelle{[Item="Kreditorenliste PLX DE",Kind="Sheet"]}[Data],
		#"Höher gestufte Header" = Table.PromoteHeaders(#"Kreditorenliste PLX DE_Sheet", [PromoteAllScalars=true]),
		#"Geänderter Typ" = Table.TransformColumnTypes(#"Höher gestufte Header",{{"Kontonummer", type text}, {"Column2", type text}, {"UStIdentNr", type text}, {"Steuernummer", type text}, {"#VerbUnternehmen", type text}, {"Zahlungskondition", type text}, {"IBANNummer", type text}, {"BuchenGesperrt", Int64.Type}, {"EMail", type text}, {"Name1", type text}, {"Name2", type text}, {"PLZ", type text}, {"Ort", type text}, {"Strasse", type text}, {"Zahlungsart", type text}, {"Land", Int64.Type}, {"Konto CS+", type text}, {"Column18", type any}}),
		#"Entfernte Spalten" = Table.RemoveColumns(#"Geänderter Typ",{"Column18"})

BIC Bankkto Sammelkto Online
	let
		Quelle = Excel.Workbook(Web.Contents("https://yespharmaservices.sharepoint.com/sites/PharmaLex_Prj_ERP_D365/Shared Documents/Data Migration/Raw legacy data/20201023 Excel Export Kreditorenliste PLX DE (aus Anzeige).xlsx"), null, true),
		#"BIC Bankkto Sammelkto_Sheet" = Quelle{[Item="BIC Bankkto Sammelkto",Kind="Sheet"]}[Data],
		#"Höher gestufte Header" = Table.PromoteHeaders(#"BIC Bankkto Sammelkto_Sheet", [PromoteAllScalars=true]),
		#"Geänderter Typ" = Table.TransformColumnTypes(#"Höher gestufte Header",{{"Kontonummer", type text}, {"Sammelkonto", type text}, {"BIC", type text}, {"Bankkonto", type text}})

Diamant_Country_Format_Description
	let
		Quelle = Csv.Document(Web.Contents("https://yespharmaservices.sharepoint.com/sites/PharmaLex_Prj_ERP_D365/Shared Documents/Data Migration/Raw legacy data/Diamant_Country_Format_Description.csv"),[Delimiter=";", Columns=2, Encoding=1252, QuoteStyle=QuoteStyle.None]),
		#"Höher gestufte Header" = Table.PromoteHeaders(Quelle, [PromoteAllScalars=true]),
		#"Geänderter Typ" = Table.TransformColumnTypes(#"Höher gestufte Header",{{"DiamantID", Int64.Type}, {"ISO3", type text}})
	in
		#"Geänderter Typ"

CountryCodes
	let
		Quelle = Excel.Workbook(Web.Contents("https://yespharmaservices.sharepoint.com/sites/PharmaLex_Prj_ERP_D365/Shared Documents/Data Migration/Refurbish/ISO3166 Country Codes (de).xlsx"), null, true),
		CountryCodes_Table = Quelle{[Item="CountryCodes",Kind="Table"]}[Data],
		#"Geänderter Typ" = Table.TransformColumnTypes(CountryCodes_Table,{{"Land", type text}, {"ISO 3166-1 ALPHA-2", type text}, {"ISO 3166-1 ALPHA-3", type text}, {"ISO 3166-1 numerisch", Int64.Type}})
*/

create View [dbo].[v_SALESTAXEXEMPTNUMBERS]
as 
with 
Base as
(
	SELECT
		[UStIdentNr] as [Umsatzsteuer-ID]
		,[ISO3]
		,[Name]
	FROM [dbo].[v_joinedQuerry]
	where [UStIdentNr] != '' 
),
Countrycodes as
(
	select 
		[Land]
		,cast([ISO 3166-1 ALPHA-2] as nvarchar(2)) as [ISO 3166-1 ALPHA-2]
		,cast([ISO 3166-1 ALPHA-3] as nvarchar(3)) as [ISO 3166-1 ALPHA-3]
		,cast([ISO 3166-1 numerisch] as bigint) as [ISO 3166-1 numerisch]
	from [ISO3166 Country Codes (de)]
),
UStIDFormat as
(
	SELECT 
		USF.[ISO 3166]
		,USF.[Code]
		,Cast(USF.[Length] as Bigint) as [Length]
		,CC.[ISO 3166-1 ALPHA-2]
		,Concat(CC.[ISO 3166-1 ALPHA-3],left(USF.[Code],2),[Length]) as [KeyCountry]
	FROM [dbo].[UStID Format] as USF
	left join Countrycodes as CC
		on USF.[ISO 3166]= CC.[ISO 3166-1 ALPHA-2]
)--select * from UStIDFormat
,
TEN_Validate as
(
	select 
		vJQ.[UStIdentNr] as [Umsatzsteuer-ID]
		,vJQ.[ISO3]
		,LEN(vJQ.[UStIdentNr]) as length
		,Concat(vJQ.ISO3,left(vJQ.[UStIdentNr],2),LEN(vJQ.[UStIdentNr])) as [KeyCountry]
		,USF.Code as [CheckKey.Code]
		,REPLACE(
			REPLACE(
				REPLACE(
					REPLACE(
						REPLACE(
							REPLACE(
								REPLACE(
									REPLACE(
										REPLACE(
											REPLACE(vJQ.[UStIdentNr], '0', '9'),
										'1', '9'),
									'2', '9'),
								'3', '9'),
							'4', '9'),
						'5', '9'),
					'6', '9'),
				'7', '9'),
			'8', '9'),
		'9', '9') as [Test Replacement]
		,Cast(
			Case when 
				(REPLACE(
					REPLACE(
						REPLACE(
							REPLACE(
								REPLACE(
									REPLACE(
										REPLACE(
											REPLACE(
												REPLACE(
													REPLACE(vJQ.[UStIdentNr], '0', '9'),
												'1', '9'),
											'2', '9'),
										'3', '9'),
									'4', '9'),
								'5', '9'),
							'6', '9'),
						'7', '9'),
					'8', '9'),
				'9', '9') != USF.Code) or (ISO3 is null) or (USF.Code is null)
			then 1 else 0 end as bit
		) as FormatError
	FROM [dbo].[v_joinedQuerry] vJQ
	left join UStIDFormat USF
		on Concat(vJQ.ISO3,left(vJQ.[UStIdentNr],2),LEN(vJQ.[UStIdentNr]))=USF.[KeyCountry]
	where [UStIdentNr] != ''
)--select * from TEN_Validate
,
TEN_Duplicate as
(
	Select 
		[UStIdentNr] as [Umsatzsteuer-ID]
		--,CONCAT(ltrim(rtrim(Name1)),' ',ltrim(rtrim(Name2))) as [Name]
		--,[ISO3]
	FROM [dbo].[v_joinedQuerry]
	where [UStIdentNr] != ''
	group by [UStIdentNr]
	having count(*) > 1
)--select * from TEN_Duplicate
,
TEN_Ranking as
(
	Select 
		[UStIdentNr] as [Umsatzsteuer-ID]
		,[ISO3]
		,[Name]
		,LEN(Concat([UStIdentNr],'|',ISO3,'|',[Name])) as [Length]
		,ROW_NUMBER() over (partition by [UStIdentNr] order by LEN(Concat([UStIdentNr],'|',ISO3,'|',[Name])) DESC ) as [Rank]
		,Concat([UStIdentNr],'|',ISO3,'|',[Name]) as [Key]
	FROM [dbo].[v_joinedQuerry] vJQ
	--where Name like '%Stadtwerke Karlsruhe GmbH%'
	inner join TEN_Duplicate TD
		on vJQ.UStIdentNr=TD.[Umsatzsteuer-ID]
	where [UStIdentNr] != ''

)
select 
	B.[Umsatzsteuer-ID] as VATNUM
	,B.ISO3 as COUNTRYREGIONID
	,B.[Name] as [NAME]
	--,TV.FormatError
	--,Concat(B.[Umsatzsteuer-ID],'|',B.ISO3,'|',B.[Name]) as [Key]
	--,TR.[Rank]
from Base as B
left join TEN_Validate TV
	on B.[Umsatzsteuer-ID] = TV.[Umsatzsteuer-ID]
left join TEN_Ranking TR
	on Concat(B.[Umsatzsteuer-ID],'|',B.ISO3,'|',B.[Name]) = TR.[Key]
where B.[Umsatzsteuer-ID] != ''
	--and B.Name = 'Stadtwerke Karlsruhe GmbH'
	and TV.FormatError = 0
	and (TR.[Rank] = 1 or TR.[Rank] is null)
	and B.ISO3 is not null
group by B.[Umsatzsteuer-ID],B.ISO3,B.[Name]

--DE813808299; Stadtwerke Karlsruhe GmbH
/*	
Sales Tax Exempt Numbers
	let
		Quelle = JoinedQuery,
		#"Gefilterte Zeilen" = Table.SelectRows(Quelle, each ([UStIdentNr] <> "")),
		#"Umbenannte Spalten 0" = Table.RenameColumns(#"Gefilterte Zeilen",{{"UStIdentNr", "Umsatzsteuer-ID"}}),
		#"Hinzugefügte benutzerdefinierte Spalte 0" = Table.AddColumn(#"Umbenannte Spalten 0", "Name", each Text.Trim(Text.Combine({[Name1], " ", [Name2]}))),
		#"Entfernte Spalten" = Table.RemoveColumns(#"Hinzugefügte benutzerdefinierte Spalte 0",{"Kontonummer", "Column2", "Steuernummer", "#VerbUnternehmen", "Zahlungskondition", "IBANNummer", "BuchenGesperrt", "EMail", "Name1", "Name2", "PLZ", "Ort", "Strasse", "Zahlungsart", "Land", "Konto CS+", "Sammelkonto", "BIC", "Bankkonto", "IsEUCountry"}),
		#"Join Validate Tax Exempt Numbers" = Table.NestedJoin(#"Entfernte Spalten", {"Umsatzsteuer-ID"}, #"Validate Tax Exempt Numbers", {"Umsatzsteuer-ID"}, "Validate Tax Exempt Numbers", JoinKind.Inner),
		#"Erweiterte Validate Tax Exempt Numbers" = Table.ExpandTableColumn(#"Join Validate Tax Exempt Numbers", "Validate Tax Exempt Numbers", {"FormatError"}, {"Validate Tax Exempt Numbers.FormatError"}),
		#"Remove Errors" = Table.SelectRows(#"Erweiterte Validate Tax Exempt Numbers", each ([Validate Tax Exempt Numbers.FormatError] = false)),
		#"Create Key" = Table.AddColumn(#"Remove Errors", "Key", each Text.Combine({[#"Umsatzsteuer-ID"],"|",[ISO3],"|",[Name]})),
		#"Join Tax Exempt Number Ranking" = Table.NestedJoin(#"Create Key", {"Key"}, #"Tax Exempt Number Ranking", {"Key"}, "Tax Exempt Number Ranking", JoinKind.LeftOuter),
		#"Erweiterte Tax Exempt Number Ranking" = Table.ExpandTableColumn(#"Join Tax Exempt Number Ranking", "Tax Exempt Number Ranking", {"Rank"}, {"Tax Exempt Number Ranking.Rank"}),
		#"Gefilterte Zeilen1" = Table.SelectRows(#"Erweiterte Tax Exempt Number Ranking", each ([Tax Exempt Number Ranking.Rank] = null or [Tax Exempt Number Ranking.Rank] = 1)),
		#"Entfernte Spalten1" = Table.RemoveColumns(#"Gefilterte Zeilen1",{"Validate Tax Exempt Numbers.FormatError", "Key", "Tax Exempt Number Ranking.Rank"}),
		#"Umbenannte Spalten" = Table.RenameColumns(#"Entfernte Spalten1",{{"Umsatzsteuer-ID", "VATNUM"}, {"ISO3", "COUNTRYREGIONID"}, {"Name", "NAME"}}),
		#"Gruppierte Zeilen" = Table.Group(#"Umbenannte Spalten", {"VATNUM", "COUNTRYREGIONID", "NAME"}, {{"Anzahl", each Table.RowCount(_), Int64.Type}}),
		#"Entfernte Spalten2" = Table.RemoveColumns(#"Gruppierte Zeilen",{"Anzahl"}),
		#"Gefilterte Zeilen2" = Table.SelectRows(#"Entfernte Spalten2", each ([COUNTRYREGIONID] <> null))
*/
GO
