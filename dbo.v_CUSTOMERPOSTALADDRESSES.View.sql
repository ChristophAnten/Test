USE [dynamics]
GO
/****** Object:  View [dbo].[v_CUSTOMERPOSTALADDRESSES]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ############################# --
-- # Customer postal addresses # --
-- ############################# --

Create View [dbo].[v_CUSTOMERPOSTALADDRESSES] 
as
with DebitorenDiamant
as (
	select 
	Nummer as [Nummer Debitor]
	,Anlagedatum
	,DiamantId
	,ltrim(rtrim(Concat(Firmenname,' ',Firmenzusatz))) as [Name]
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
select 
	DD.DiamantId as CUSTOMERACCOUNTNUMBER
	,EA.Straße as ADDRESSSTREET
	,EA.Plz as ADDRESSZIPCODE
	,EA.Ort as	ADDRESSCITY
	,CC.[ISO 3166-1 ALPHA-3] as ADDRESSORIGINID
	,Anlagedatum as EFFECTIVE --add format datetime
	,case 
		when EA.Adressart = 'Fakturaanschrift' then 'Invoice'
		when EA.Adressart = 'Lieferanschrift' then 'Delivery'
		when EA.Adressart = 'Abweichende Versandanschrift' then 'Other'
		else ''
	end as ADDRESSLOCATIONROLES
	,case when EA.[Abweichender Kontaktname] = '' 
		then Concat(DD.[Name],' (',EA.Adressart,')') else 
		CONCAT(EA.[Abweichender Kontaktname],' (',EA.Adressart,')') 
	end as ADDRESSDESCRIPTION
	,'P001' as CUSTOMERLEGALENTITYID
	,'YES' as ISPOSTALADDRESS
	,case when EA.Adressart = 'Fakturaanschrift' 
		then 'YES' 
		else 'NO' 
	end as ISROLEINVOICE
	,case when EA.Adressart = 'Delivery' 
		then 'YES' 
		else 'NO' 
	end as ISDELIVERY
from DebitorenDiamant DD
	inner join [dbo].[Export Adressen] EA
		on DD.[Nummer Debitor] = EA.[Nr  Debitor]
	left join [dbo].[ISO3166 Country Codes (de)] as CC
		on DD.LandBereinigt = CC.Land
	Where EA.Adressart != 'Geschäftstelle'
GO
