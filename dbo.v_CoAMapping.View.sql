USE [dynamics]
GO
/****** Object:  View [dbo].[v_CoAMapping]    Script Date: 8/4/2021 9:46:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_CoAMapping]
AS
SELECT 
	a.[Accounts local software PLX GmbH (Diamant)],
	a.[IFRS Account ]
FROM CoAMapping a
WHERE a.[Accounts local software PLX GmbH (Diamant)] <> ''


GO
