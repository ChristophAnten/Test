USE [dynamics]
GO
/****** Object:  View [dbo].[v_Saldo_IFRS]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_Saldo_IFRS]
AS
SELECT 
	TRY_CAST(a.Buchungsperiode AS datetime) AS Buchungsperiode,
	coa.[IFRS Account ],
	CAST(REPLACE(a.Soll,',','.') as money) AS Soll,
	CAST(REPLACE(a.Haben,',','.') as money) AS Haben
FROM Saldo a
JOIN v_Konto k
ON k.DVKontonummer = a.DVKontonummer
JOIN v_CoAMapping coa
ON coa.[Accounts local software PLX GmbH (Diamant)] = k.Kontonummer
WHERE a.Buchungsperiode <> ''

GO
