USE GitHub
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnHnM]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnHnM]
GO
--returns hours and minutes (h:mm) to an integer number of minutes
CREATE FUNCTION dbo.fnHnM(@mi integer)
RETURNS nvarchar(25)
AS
BEGIN 
RETURN(
SELECT CAST(ABS(@mi/60) AS nvarchar(23)) + ':' +
       REPLICATE('0', 2 - DATALENGTH(CAST(@mi-(ABS(@mi/60)*60) AS varchar(2)))) + CAST(@mi-(ABS(@mi/60)*60) AS varchar(2))
)
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

