USE [dynamics]
GO
/****** Object:  User [YES-INT\RGarcia]    Script Date: 8/4/2021 9:46:23 PM ******/
CREATE USER [YES-INT\RGarcia] FOR LOGIN [YES-INT\RGarcia] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [YES-INT\RGarcia]
GO
