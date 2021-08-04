USE [dynamics]
GO
/****** Object:  View [dbo].[v_CUSTOMERSV3]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --############### --
 --# Contacts V2 # --
 --############### --

--Alter View dbo.v_CONTACTSV2
--as
--	with DebitorenDiamant
--	as (
--		select 
--		Nummer as [Nummer Debitor]
--		,DiamantId
--		,ltrim(rtrim(Concat(Firmenname,' ',Firmenzusatz))) as [Name]
--		,Case 
--			when Land = 'USA' then 'Vereinigte Staaten'
--			when Land = 'UK' then 'Großbritannien' 
--			when Land = 'Republik Nordmazedonien' then 'Nordmazedonien' 
--			when Land = 'Südkorea' then 'Korea, Republik' 
--			when Land = 'Tschechien' then 'Tschechische Republik' 
--			when Land = 'Russland' then 'Russische Föderation' 
--			when Land = 'Isle of Man' then 'Insel Man' 
--			else Land
--		end as LandBereinigt
--		from [dbo].[Export aktive Debitoren]
--	)
--	Select 
--		AP.Funktion					as EMPLOYMENTJOBFUNCTIONNAME
--		,AP.Abteilung				as EMPLOYMENTDEPARTMENT
--		,AP.[Name]					as LASTNAME
--		,AP.Vorname					as FIRSTNAME
--		,AP.Titel					as PROFESSIONALTITLE
--		,AP.Adresse					as PRIMARYADDRESSSTREET
--		,AP.Postfach				as PRIMARYADDRESSPOSTBOX
--		,AP.Plz						as PRIMARYADDRESSZIPCODE
--		,AP.Ort						as PRIMARYADDRESSCITY
--		,AP.Telefon					as PRIMARYPHONENUMBER
--		,AP.Fax						as PRIMARYFAXNUMBER
--		,AP.[E-Mail-Adresse]		as PRIMARYEMAILADDRESS
--		,LT.[ISO Code]				as CONTACTINFORMATIONLANGUAGEID
--		,AP.Gebäude					as PRIMARYADDRESSBUILDINGCOMPLIMENT
--		,AP.Office					as EMPLOYMENTOFFICELOCATION
--		,CC.[ISO 3166-1 ALPHA-2]	as PRIMARYADDRESSCOUNTRYREGIONISOCODE
--		,CC.[ISO 3166-1 ALPHA-3]	as PRIMARYADDRESSCOUNTRYREGIONID
--		,AP.Bemerkung				as NOTES
--		,MG.Gender					as GENDER
--		,DD.DiamantId				as CONTACTPERSONPARTYNUMBER
--	from [dbo].[Export Ansprechpartner] AP
--		full outer join DebitorenDiamant DD
--			on AP.[Nummer Debitor] = DD.[Nummer Debitor]
--		left join [dbo].[ISO3166 Country Codes (de)] as CC
--			on DD.LandBereinigt = CC.Land
--		left join [dbo].[Language Translation] LT
--			on AP.Sprache = LT.[language DE]
--		left join [dbo].[Mapping_Gender] MG
--			on AP.Anrede = MG.Anrede

-- ############################# --
-- # Customer postal addresses # --
-- ############################# --

--Create View [dbo].v_CUSTOMERPOSTALADDRESSES 
--as
--with DebitorenDiamant
--as (
--	select 
--	Nummer as [Nummer Debitor]
--	,Anlagedatum
--	,DiamantId
--	,ltrim(rtrim(Concat(Firmenname,' ',Firmenzusatz))) as [Name]
--	,Case 
--		when Land = 'USA' then 'Vereinigte Staaten'
--		when Land = 'UK' then 'Großbritannien' 
--		when Land = 'Republik Nordmazedonien' then 'Nordmazedonien' 
--		when Land = 'Südkorea' then 'Korea, Republik' 
--		when Land = 'Tschechien' then 'Tschechische Republik' 
--		when Land = 'Russland' then 'Russische Föderation' 
--		when Land = 'Isle of Man' then 'Insel Man' 
--		else Land
--	end as LandBereinigt
--	from [dbo].[Export aktive Debitoren]
--)
--select 
--	DD.DiamantId as CUSTOMERACCOUNTNUMBER
--	,EA.Straße as ADDRESSSTREET
--	,EA.Plz as ADDRESSZIPCODE
--	,EA.Ort as	ADDRESSCITY
--	,CC.[ISO 3166-1 ALPHA-3] as ADDRESSORIGINID
--	,Anlagedatum as EFFECTIVE --add format datetime
--	,case 
--		when EA.Adressart = 'Fakturaanschrift' then 'Invoice'
--		when EA.Adressart = 'Lieferanschrift' then 'Delivery'
--		when EA.Adressart = 'Abweichende Versandanschrift' then 'Other'
--		else ''
--	end as ADDRESSLOCATIONROLES
--	,case when EA.[Abweichender Kontaktname] = '' 
--		then Concat(DD.[Name],' (',EA.Adressart,')') else 
--		CONCAT(EA.[Abweichender Kontaktname],' (',EA.Adressart,')') 
--	end as ADDRESSDESCRIPTION
--	,'P001' as CUSTOMERLEGALENTITYID
--	,'YES' as ISPOSTALADDRESS
--	,case when EA.Adressart = 'Fakturaanschrift' 
--		then 'YES' 
--		else 'NO' 
--	end as ISROLEINVOICE
--	,case when EA.Adressart = 'Delivery' 
--		then 'YES' 
--		else 'NO' 
--	end as ISDELIVERY
--from DebitorenDiamant DD
--	inner join [dbo].[Export Adressen] EA
--		on DD.[Nummer Debitor] = EA.[Nr  Debitor]
--	left join [dbo].[ISO3166 Country Codes (de)] as CC
--		on DD.LandBereinigt = CC.Land
--	Where EA.Adressart != 'Geschäftstelle'
	

-- ################ --
-- # Customers V3 # --
-- ################ --

Create View [dbo].[v_CUSTOMERSV3] 
as
with DebitorenDiamant
as (
	select 
	Nummer as [Nummer Debitor]
	,Anlagedatum
	,DiamantId
	,Zahlungsziel
	,Intercompany
	,Währung
	,Sprache
	,Telefon
	,fax
	,[E-Mail-Adresse]
	,Web
	,[Umsatzsteuer-ID]
	,Ort
	,Adresse
	,Plz
	,[ISO 3166-1 ALPHA-2]
	,ltrim(rtrim(Concat(Firmenname,' ',Firmenzusatz))) as [Name]
	,CC.[ISO 3166-1 ALPHA-3] as [ISO 3166-1 ALPHA-3]
	,Case 
		when DD.Land = 'USA' then 'Vereinigte Staaten'
		when DD.Land = 'UK' then 'Großbritannien' 
		when DD.Land = 'Republik Nordmazedonien' then 'Nordmazedonien' 
		when DD.Land = 'Südkorea' then 'Korea, Republik' 
		when DD.Land = 'Tschechien' then 'Tschechische Republik' 
		when DD.Land = 'Russland' then 'Russische Föderation' 
		when DD.Land = 'Isle of Man' then 'Insel Man' 
		else DD.Land
	end as LandBereinigt
	from [dbo].[Export aktive Debitoren] DD
	left join [dbo].[ISO3166 Country Codes (de)] as CC
		on 
			Case 
				when DD.Land = 'USA' then 'Vereinigte Staaten'
				when DD.Land = 'UK' then 'Großbritannien' 
				when DD.Land = 'Republik Nordmazedonien' then 'Nordmazedonien' 
				when DD.Land = 'Südkorea' then 'Korea, Republik' 
				when DD.Land = 'Tschechien' then 'Tschechische Republik' 
				when DD.Land = 'Russland' then 'Russische Föderation' 
				when DD.Land = 'Isle of Man' then 'Insel Man' 
				else DD.Land 
			end = CC.Land
),
GeschaeftAdressen 
as (
	select *
	from dbo.[Export Adressen]
	where Adressart = 'Geschäftstelle'
)
select 
	DD.DiamantId as CUSTOMERACCOUNT
	,DD.[ISO 3166-1 ALPHA-3] as ADDRESSCOUNTRYREGIONID
	,DD.Telefon as PRIMARYCONTACTPHONE
	,DD.fax as PRIMARYCONTACTFAX
	,DD.[E-Mail-Adresse] as PRIMARYCONTACTEMAIL
	,DD.Web as PRIMARYCONTACTURL
	,DD.[Name] as ORGANIZATIONNAME
	,DD.Ort as ADDRESSCITY
	,DD.Adresse as ADDRESSSTREET
	,DD.Plz as ADDRESSZIPCODE
	,DD.[ISO 3166-1 ALPHA-2] as ADDRESSCOUNTRYREGIONISOCODE
	,case when DD.Zahlungsziel='' 
		then '' 
		else Concat('N',DD.Zahlungsziel) 
	end as PAYMENTTERMS
	,case when DD.Intercompany = 'FALSE' 
		then 
			case when ISNULL(EUCC.[ISO 3166-1 Alpha-3],'')='' 
				then 'C-Third'
				else case when EUCC.[ISO 3166-1 Alpha-3]='DEU' 
					then 'C-Dom' 
					else 'C-EU'
				end
			end
		else 
			case when ISNULL(EUCC.[ISO 3166-1 Alpha-3],'')=''
				then 'C-IC-Third' 
				else case when EUCC.[ISO 3166-1 Alpha-3] = 'Deu' 
					then 'C-IC-dom'
					else 'C-IC-EU'
				end
			end
		end as CUSTOMERGROUPID
		,CT.D365 as SALESCURRENCYCODE
		,LT.[ISO Code] as LANGUAGEID
		,case when ISNULL(GA.[Abweichender Kontaktname],'') = '' 
			then DD.[Name]
			else GA.[Abweichender Kontaktname]
		end as ADDRESSDESCRIPTION
		,case when ISNULL(EUCC.[ISO 3166-1 Alpha-3],'')='' then 'D-Dritt'
			  when EUCC.[ISO 3166-1 Alpha-3] = 'DEU' then 'D-Inl'
			else 'D-EU'
		end as SALESTAXGROUP
		,ST.VATNUM as TAXEXEMPTNUMBER
from DebitorenDiamant DD
	left join dbo.[EU Country Codes] EUCC
		on DD.[ISO 3166-1 ALPHA-3] = EUCC.[ISO 3166-1 Alpha-3]
	left join dbo.[Currency Translation] CT
		on DD.währung = CT.Projectile
	left join [dbo].[Language Translation] LT
		on DD.Sprache = LT.[language DE]
	left join GeschaeftAdressen GA
		on DD.[Nummer Debitor] = GA.[Nr  Debitor]
	left join v_SALESTAXEXEMPTNUMBERS ST
		on DD.[Umsatzsteuer-ID] = ST.VATNUM
GO
