USE [dynamics]
GO
/****** Object:  View [dbo].[v_CONTACTSV2]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ############### --
-- # Contacts V2 # --
-- ############### --

CREATE View [dbo].[v_CONTACTSV2]
as
	with DebitorenDiamant
	as (
		select 
		Nummer as [Nummer Debitor]
		,DiamantId
		--,ltrim(rtrim(Concat(Firmenname,' ',Firmenzusatz))) as [Name]
		,Case 
			when Land = 'USA' then 'Vereinigte Staaten'
			when Land = 'UK' then 'Großbritannien' 
			when Land = 'Republik Nordmazedonien' then 'Nordmazedonien' 
			when Land = 'Südkorea' then 'Korea, Republik' 
			when Land = 'Tschechien' then 'Tschechische Republik' 
			when Land = 'Russland' then 'Russische Föderation' 
			when Land = 'Isle of Man' then 'Insel Man' 
			else Land
		end as LandBereinigt
		from [dbo].[Export aktive Debitoren]
	)
	Select 
		AP.Funktion					as EMPLOYMENTJOBFUNCTIONNAME
		,AP.Abteilung				as EMPLOYMENTDEPARTMENT
		,AP.[Name]					as LASTNAME
		,AP.Vorname					as FIRSTNAME
		,AP.Titel					as PROFESSIONALTITLE
		,AP.Adresse					as PRIMARYADDRESSSTREET
		,AP.Postfach				as PRIMARYADDRESSPOSTBOX
		,AP.Plz						as PRIMARYADDRESSZIPCODE
		,AP.Ort						as PRIMARYADDRESSCITY
		,AP.Telefon					as PRIMARYPHONENUMBER
		,AP.Fax						as PRIMARYFAXNUMBER
		,AP.[E-Mail-Adresse]		as PRIMARYEMAILADDRESS
		,LT.[ISO Code]				as CONTACTINFORMATIONLANGUAGEID
		,AP.Gebäude					as PRIMARYADDRESSBUILDINGCOMPLIMENT
		,AP.Office					as EMPLOYMENTOFFICELOCATION
		,CC.[ISO 3166-1 ALPHA-2]	as PRIMARYADDRESSCOUNTRYREGIONISOCODE
		,CC.[ISO 3166-1 ALPHA-3]	as PRIMARYADDRESSCOUNTRYREGIONID
		,AP.Bemerkung				as NOTES
		,MG.Gender					as GENDER
		,DD.DiamantId				as CONTACTPERSONPARTYNUMBER
	from [dbo].[Export Ansprechpartner] AP
		full outer join DebitorenDiamant DD
			on AP.[Nummer Debitor] = DD.[Nummer Debitor]
		left join [dbo].[ISO3166 Country Codes (de)] as CC
			on DD.LandBereinigt = CC.Land
		left join [dbo].[Language Translation] LT
			on AP.Sprache = LT.[language DE]
		left join [dbo].[Mapping_Gender] MG
			on AP.Anrede = MG.Anrede
GO
