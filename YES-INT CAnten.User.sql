USE [dynamics]
GO
/****** Object:  User [YES-INT\CAnten]    Script Date: 8/4/2021 9:46:23 PM ******/
CREATE USER [YES-INT\CAnten] FOR LOGIN [YES-INT\CAnten] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [YES-INT\CAnten]
GO
