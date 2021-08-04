USE [dynamics]
GO
/****** Object:  View [dbo].[v_VENDORBANKACCOUNTS]    Script Date: 04.08.2021 21:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create View [dbo].[v_VENDORBANKACCOUNTS]
as 

with 
Base as
(
	SELECT
		Kontonummer as VENDORACCOUNTNUMBER
		,BIC as SWIFTCODE
		,Bankkonto as BANKACCOUNTNUMBER
		,Replace(IBANNummer,' ','') as IBAN
	FROM [dbo].[v_joinedQuerry]
)

	select 
		B.VENDORACCOUNTNUMBER
		,B.SWIFTCODE
		,B.BANKACCOUNTNUMBER
		,B.IBAN
		,Case when isnull(B.IBAN,'')='' then B.BANKACCOUNTNUMBER else B.IBAN end as BANKNAME
		,ROW_NUMBER() over (partition by B.VENDORACCOUNTNUMBER order by LEN(Concat(B.VENDORACCOUNTNUMBER,B.SWIFTCODE,B.BANKACCOUNTNUMBER,B.IBAN)) DESC ) as VENDORBANKACCOUNTID
	from Base B
	inner join dbo.v_VENDORSV2 V
		on B.VENDORACCOUNTNUMBER = V.VENDORACCOUNTNUMBER
	where not (isnull([IBAN],'')='' and isnull(BANKACCOUNTNUMBER,'')='' )
GO
