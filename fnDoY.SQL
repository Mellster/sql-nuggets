USE GitHub
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnDoY]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnDoY]
GO
--returns year and day number YYYYDOY
CREATE FUNCTION dbo.fnDoY(@date as datetime)
RETURNS char(7)
AS
BEGIN 
RETURN(
SELECT CAST(DATEPART(yyyy, @date) AS char(4)) +
       REPLICATE('0', 3 - DATALENGTH(CAST(DATEPART(dy, @date) AS varchar(3)))) + CAST(DATEPART(dy, @date) AS varchar(3))
)
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

