USE [dynamics]
GO
/****** Object:  View [dbo].[v_Beleg]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_Beleg]
AS
SELECT 
CAST(a.DVBelegnummer AS bigint) DVBelegnummer,
TRY_CAST(a.Buchungsperiode AS datetime) Buchungsperiode,
TRY_CONVERT(datetime, a.Belegdatum, 104) Belegdatum,
a.Belegnummer,
a.InterneBelegnummer
FROM Beleg a


GO
