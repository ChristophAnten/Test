USE [dynamics]
GO
/****** Object:  View [dbo].[v_VENDORSV2]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE View [dbo].[v_VENDORSV2]
as 

	SELECT
		Kontonummer as VENDORACCOUNTNUMBER
		,EMail as PRIMARYEMAILADDRESS
		,PLZ as ADDRESSZIPCODE
		,Ort as ADDRESSCITY
		,Strasse as ADDRESSSTREET
		,case when JQ.Zahlungskondition = '' then '' else CONCAT('N',REPLACE(Replace(JQ.Zahlungskondition,'Tage netto',''),' ','')) end as DEFAULTPAYMENTTERMSNAME
		,case when JQ.Sammelkonto = '342000' 
			then 
				case when JQ.ISO3 = 'DEU' 
					then 'V-IC-Dom' 
					else case when JQ.IsEUCountry = 1 then 'V-IC-EU' else 'V-IC-Third' end
				end
			else 
				case when JQ.Sammelkonto = '350001' 
					then 'V-Emp'
					else 
						case when ISO3 = 'DEU' 
							then 'V-Dom' 
							else case when JQ.IsEUCountry = 1 then 'V-EU' else 'V-Third' end
						end
				end 
		end as VENDORGROUPID
		,'Business' as ADDRESSLOCATIONROLES
		,JQ.[Name] as VENDORORGANIZATIONNAME
		,ISNULL(JQ.ISO3,'DEU') as ADDRESSCOUNTRYREGIONID
		,TEN.VATNUM as TAXEXEMPTNUMBER
	FROM [dbo].[v_joinedQuerry] JQ
		left join [dbo].v_SALESTAXEXEMPTNUMBERS TEN
			on JQ.UStIdentNr = TEN.VATNUM
		where  BuchenGesperrt = 0
GO
