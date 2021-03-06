USE [EffortEst]
GO
/****** Object:  Table [dbo].[tblScrumTeam]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblScrumTeam]') AND type in (N'U'))
DROP TABLE [dbo].[tblScrumTeam]
GO
/****** Object:  Table [dbo].[Forecast]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Forecast]') AND type in (N'U'))
DROP TABLE [dbo].[Forecast]
GO
/****** Object:  Table [dbo].[Actuals]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Actuals]') AND type in (N'U'))
DROP TABLE [dbo].[Actuals]
GO
/****** Object:  StoredProcedure [dbo].[SummaryFA]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SummaryFA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SummaryFA]
GO
/****** Object:  StoredProcedure [dbo].[SP_Forecast_19]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Forecast_19]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_Forecast_19]
GO
/****** Object:  StoredProcedure [dbo].[SP_Forec_191]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Forec_191]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_Forec_191]
GO
/****** Object:  StoredProcedure [dbo].[SP_Forec_19]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Forec_19]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_Forec_19]
GO
/****** Object:  StoredProcedure [dbo].[SP_Act_19]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Act_19]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_Act_19]
GO
/****** Object:  StoredProcedure [dbo].[ForcMar-19]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForcMar-19]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ForcMar-19]
GO
/****** Object:  StoredProcedure [dbo].[ForcJan-19]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForcJan-19]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ForcJan-19]
GO
/****** Object:  StoredProcedure [dbo].[ForcFeb-19]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForcFeb-19]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ForcFeb-19]
GO
/****** Object:  StoredProcedure [dbo].[ActNov-18]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActNov-18]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ActNov-18]
GO
/****** Object:  StoredProcedure [dbo].[ActMar-19]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActMar-19]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ActMar-19]
GO
/****** Object:  StoredProcedure [dbo].[ActJan-19]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActJan-19]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ActJan-19]
GO
/****** Object:  StoredProcedure [dbo].[ActFeb-19]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActFeb-19]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ActFeb-19]
GO
/****** Object:  StoredProcedure [dbo].[ActDec-18]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActDec-18]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ActDec-18]
GO
/****** Object:  StoredProcedure [dbo].[Act-19]    Script Date: 04-02-2019 2:25:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Act-19]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Act-19]
GO
/****** Object:  StoredProcedure [dbo].[Act-19]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Act-19]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
Create PROCEDURE [dbo].[Act-19] 
	@SV_SalaryId nvarchar(50),
	@Month nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT Forecast.[28-Jan-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''01/2019''),0) as Effort11,'''' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[ActDec-18]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActDec-18]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
Create PROCEDURE [dbo].[ActDec-18] 
	@SV_SalaryId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''12/2018''),0) as Effort11,'''' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[ActFeb-19]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActFeb-19]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
Create PROCEDURE [dbo].[ActFeb-19] 
	@SV_SalaryId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT Forecast.[28-Jan-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	--SELECT Forecast.[4-Feb-19] + Forecast.[11-Feb-19] + Forecast.[18-Feb-19] + Forecast.[25-Feb-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''02/2019''),0) as Effort11,'''' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[ActJan-19]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActJan-19]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
Create PROCEDURE [dbo].[ActJan-19] 
	@SV_SalaryId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT Forecast.[28-Jan-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''01/2019''),0) as Effort11,'''' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[ActMar-19]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActMar-19]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
Create PROCEDURE [dbo].[ActMar-19] 
	@SV_SalaryId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT Forecast.[28-Jan-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	--SELECT Forecast.[4-Feb-19] + Forecast.[11-Feb-19] + Forecast.[18-Feb-19] + Forecast.[25-Feb-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	--SELECT Forecast.[4-Mar-19] + Forecast.[11-Mar-19] + Forecast.[18-Mar-19] + Forecast.[25-Mar-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''03/2019''),0) as Effort11,'''' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[ActNov-18]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActNov-18]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[ActNov-18] 
	@SV_SalaryId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''11/2018''),0) as Effort11,'''' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	--return 0
	
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[ForcFeb-19]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForcFeb-19]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
Create PROCEDURE [dbo].[ForcFeb-19] 
	@SV_SalaryId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT Forecast.[28-Jan-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	SELECT Forecast.[4-Feb-19] + Forecast.[11-Feb-19] + Forecast.[18-Feb-19] + Forecast.[25-Feb-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	--SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''01/2019''),0) as Effort11,'''' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[ForcJan-19]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForcJan-19]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--exec [ForcJan-19] ''L041120''
CREATE PROCEDURE [dbo].[ForcJan-19] 
	@SV_SalaryId nvarchar(50)
AS
BEGIN	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Forecast.[28-Jan-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	--SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''12/2018''),0) as Effort11,'''' as blank
	--	  FROM [Forecast] as Forecast
	-- INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	
	
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[ForcMar-19]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForcMar-19]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
Create PROCEDURE [dbo].[ForcMar-19] 
	@SV_SalaryId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT Forecast.[28-Jan-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	--SELECT Forecast.[4-Feb-19] + Forecast.[11-Feb-19] + Forecast.[18-Feb-19] + Forecast.[25-Feb-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	SELECT Forecast.[4-Mar-19] + Forecast.[11-Mar-19] + Forecast.[18-Mar-19] + Forecast.[25-Mar-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	--SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''02/2019''),0) as Effort11,'''' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Act_19]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Act_19]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--Created By Aftabhusen Multani 
--Created on 03_02_2019
--Desc : Getting All month Data
Create PROCEDURE [dbo].[SP_Act_19] 
	@SV_SalaryId nvarchar(50),
	@Month nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	If(@Month=''Jan'')
	BEGIN
		SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''01/2019''),0) as Effort11,'''' as blank
	END
	If(@Month=''FEB'')
	BEGIN
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''02/2019''),0) as Effort11,'''' as blank
	END
	If(@Month=''MAR'')
	BEGIN
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''03/2019''),0) as Effort11,'''' as blank
	END
	If(@Month=''APR'')
	BEGIN
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''04/2019''),0) as Effort11,'''' as blank
	END
	If(@Month=''MAY'')
	BEGIN
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''05/2019''),0) as Effort11,'''' as blank
	END
	If(@Month=''JUN'')
	BEGIN
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''06/2019''),0) as Effort11,'''' as blank
	END
	If(@Month=''JUL'')
	BEGIN
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''07/2019''),0) as Effort11,'''' as blank
    END
	If(@Month=''AUG'')
	BEGIN
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''08/2019''),0) as Effort11,'''' as blank
	END
	If(@Month=''SEP'')
	BEGIN
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''09/2019''),0) as Effort11,'''' as blank
	END
	If(@Month=''OCT'')
	BEGIN
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''10/2019''),0) as Effort11,'''' as blank
    END
	If(@Month=''NOV'')
	BEGIN
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''11/2019''),0) as Effort11,'''' as blank
    END
	If(@Month=''DEC'')
	BEGIN
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''12/2019''),0) as Effort11,'''' as blank
	END
 --   -- Insert statements for procedure here
	----SELECT Forecast.[28-Jan-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	--SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)=''01/2019''),0) as Effort11,'''' as blank
	--	  --FROM [Forecast] as Forecast
	-- --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	--return 0
	
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Forec_19]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Forec_19]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--Created By Aftabhusen Multani 
--Created on 03_02_2019
--Desc : Getting All month Data

CREATE PROCEDURE [dbo].[SP_Forec_19] 
	@SV_SalaryId nvarchar(50),
	@Month nVarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF (@MONTH=''JAN'')
	BEGIN

    SELECT  cast(cast(ISNULL(Forecast.[7-Jan-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[14-Jan-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[21-Jan-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[28-Jan-19],0) as Decimal(18,2)) as Varchar(500)) ForceData,'''' as Blank 
	FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''FEB'')
	BEGIN
	SELECT cast(cast(ISNULL(Forecast.[4-Feb-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[11-Feb-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[18-Feb-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[25-Feb-19],0) as Decimal(18,2)) as Varchar(500))
    ForceData, '''' as Blank FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''MAR'')
	BEGIN
	SELECT 
	 cast(cast(ISNULL(Forecast.[4-Mar-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[11-Mar-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[18-Mar-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[25-Mar-19],0) as Decimal(18,2)) as Varchar(500))
	 ForceData,'''' as Blank FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''APR'')
	BEGIN
	SELECT 
	cast(cast(ISNULL(Forecast.[1-Apr-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[8-Apr-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[15-Apr-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[22-Apr-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[29-Apr-19],0) as Decimal(18,2)) as Varchar(500))
    ForceData,'''' as Blank FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''MAY'')
	BEGIN
		SELECT 
		cast(cast(ISNULL(Forecast.[6-May-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[13-May-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[20-May-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[27-May-19],0) as Decimal(18,2)) as Varchar(500))
		ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''JUN'')
	BEGIN
	SELECT 
		cast(cast(ISNULL(Forecast.[3-Jun-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[10-Jun-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[17-Jun-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[24-Jun-19],0) as Decimal(18,2)) as Varchar(500))
		ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END

	IF (@MONTH=''JUL'')
	BEGIN
    SELECT 
		cast(cast(ISNULL(Forecast.[1-Jul-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[8-Jul-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[15-Jul-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[22-Jul-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[29-Jul-19],0) as Decimal(18,2)) as Varchar(500))
		ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	
	END
	IF(@Month=''AUG'')
	BEGIN
	SELECT 
		cast(cast(ISNULL(Forecast.[5-Aug-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[12-Aug-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[19-Aug-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[26-Aug-19],0) as Decimal(18,2)) as Varchar(500))
		ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''SEP'')
	BEGIN
	SELECT 
		cast(cast(ISNULL(Forecast.[2-Sep-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[9-Sep-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[16-Sep-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[23-Sep-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[30-Sep-19],0) as Decimal(18,2)) as Varchar(500))
		ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''OCT'')
	BEGIN
	SELECT 
		cast(cast(ISNULL(Forecast.[7-Oct-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[14-Oct-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[21-Oct-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[28-Oct-19],0) as Decimal(18,2)) as Varchar(500))
		ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''NOV'')
	BEGIN
	SELECT 
		cast(cast(ISNULL(Forecast.[4-Nov-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[11-Nov-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[18-Nov-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[25-Nov-19],0) as Decimal(18,2)) as Varchar(500))
	    ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''DEC'')
	BEGIN
	SELECT 
		cast(cast(ISNULL(Forecast.[2-Dec-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[9-Dec-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[16-Dec-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[23-Dec-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[30-Dec-18],0) as Decimal(18,2)) as Varchar(500))
		ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Forec_191]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Forec_191]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--Created By Aftabhusen Multani 
--Created on 03_02_2019
--Desc : Getting All month Data

Create PROCEDURE [dbo].[SP_Forec_191] 
	@SV_SalaryId nvarchar(50),
	@Month nVarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF (@MONTH=''JAN'')
	BEGIN

    SELECT  cast(cast(ISNULL(Forecast.[7-Jan-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[14-Jan-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[21-Jan-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[28-Jan-19],0) as Decimal(18,2)) as Varchar(500)) ForceData,'''' as Blank 
	FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''FEB'')
	BEGIN
	SELECT cast(cast(ISNULL(Forecast.[4-Feb-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[11-Feb-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[18-Feb-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[25-Feb-19],0) as Decimal(18,2)) as Varchar(500))
    ForceData, '''' as Blank FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''MAR'')
	BEGIN
	SELECT 
	 cast(cast(ISNULL(Forecast.[4-Mar-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[11-Mar-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[18-Mar-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[25-Mar-19],0) as Decimal(18,2)) as Varchar(500))
	 ForceData,'''' as Blank FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''APR'')
	BEGIN
	SELECT 
	cast(cast(ISNULL(Forecast.[1-Apr-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[8-Apr-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[15-Apr-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[22-Apr-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[29-Apr-19],0) as Decimal(18,2)) as Varchar(500))
    ForceData,'''' as Blank FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''MAY'')
	BEGIN
		SELECT 
		cast(cast(ISNULL(Forecast.[6-May-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[13-May-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[20-May-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[27-May-19],0) as Decimal(18,2)) as Varchar(500))
		ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''JUN'')
	BEGIN
	SELECT 
		cast(cast(ISNULL(Forecast.[3-Jun-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[10-Jun-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[17-Jun-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[24-Jun-19],0) as Decimal(18,2)) as Varchar(500))
		ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END

	IF (@MONTH=''JUL'')
	BEGIN
    SELECT 
		cast(cast(ISNULL(Forecast.[1-Jul-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[8-Jul-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[15-Jul-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[22-Jul-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[29-Jul-19],0) as Decimal(18,2)) as Varchar(500))
		ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	
	END
	IF(@Month=''AUG'')
	BEGIN
	SELECT 
		cast(cast(ISNULL(Forecast.[5-Aug-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[12-Aug-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[19-Aug-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[26-Aug-19],0) as Decimal(18,2)) as Varchar(500))
		ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''SEP'')
	BEGIN
	SELECT 
		cast(cast(ISNULL(Forecast.[2-Sep-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[9-Sep-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[16-Sep-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[23-Sep-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[30-Sep-19],0) as Decimal(18,2)) as Varchar(500))
		ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''OCT'')
	BEGIN
	SELECT 
		cast(cast(ISNULL(Forecast.[7-Oct-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[14-Oct-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[21-Oct-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[28-Oct-19],0) as Decimal(18,2)) as Varchar(500))
		ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''NOV'')
	BEGIN
	SELECT 
		cast(cast(ISNULL(Forecast.[4-Nov-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[11-Nov-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[18-Nov-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[25-Nov-19],0) as Decimal(18,2)) as Varchar(500))
	    ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''DEC'')
	BEGIN
	SELECT 
		cast(cast(ISNULL(Forecast.[2-Dec-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[9-Dec-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[16-Dec-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[23-Dec-19],0) as Decimal(18,2))	+cast(ISNULL(Forecast.[30-Dec-18],0) as Decimal(18,2)) as Varchar(500))
		ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Forecast_19]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Forecast_19]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--Created By Aftabhusen Multani 
--Created on 03_02_2019
--Desc : Getting All month Data

CREATE PROCEDURE [dbo].[SP_Forecast_19] 
	@SV_SalaryId nvarchar(50),
	@Month nVarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF (@MONTH=''JAN'')
	BEGIN
    SELECT ISNULL(Forecast.[7-Jan-19],0)	+ISNULL(Forecast.[14-Jan-19],0)	+ISNULL(Forecast.[21-Jan-19],0)	+ISNULL(Forecast.[28-Jan-19],0) ForceData,'''' as Blank FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''FEB'')
	BEGIN
	SELECT ISNULL(Forecast.[4-Feb-19],0) + ISNULL(Forecast.[11-Feb-19],0) + ISNULL(Forecast.[18-Feb-19],0) + ISNULL(Forecast.[25-Feb-19],0) ForceData, '''' as Blank FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''MAR'')
	BEGIN
	SELECT ISNULL(Forecast.[4-Mar-19],0)	+ISNULL(Forecast.[11-Mar-19],0)	+ISNULL(Forecast.[18-Mar-19],0)	+ISNULL(Forecast.[25-Mar-19],0) ForceData,'''' as Blank FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''APR'')
	BEGIN
	SELECT ISNULL(Forecast.[1-Apr-19],0)	+ISNULL(Forecast.[8-Apr-19],0)	+ISNULL(Forecast.[15-Apr-19],0)	+ISNULL(Forecast.[22-Apr-19],0)	+ISNULL(Forecast.[29-Apr-19],0) ForceData,'''' as Blank FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''MAY'')
	BEGIN
		SELECT 
		ISNULL(Forecast.[6-May-19],0)	+ISNULL(Forecast.[13-May-19],0)	+ISNULL(Forecast.[20-May-19],0)	+ISNULL(Forecast.[27-May-19],0) ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''JUN'')
	BEGIN
	SELECT 
		ISNULL(Forecast.[3-Jun-19],0)	+ISNULL(Forecast.[10-Jun-19],0)	+ISNULL(Forecast.[17-Jun-19],0)	+ISNULL(Forecast.[24-Jun-19],0) ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END

	IF (@MONTH=''JUL'')
	BEGIN
    SELECT 
		ISNULL(Forecast.[1-Jul-19],0)	+ISNULL(Forecast.[8-Jul-19],0)	+ISNULL(Forecast.[15-Jul-19],0)	+ISNULL(Forecast.[22-Jul-19],0)	+ISNULL(Forecast.[29-Jul-19],0) ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	
	END
	IF(@Month=''AUG'')
	BEGIN
	SELECT 
		ISNULL(Forecast.[5-Aug-19],0)	+ISNULL(Forecast.[12-Aug-19],0)	+ISNULL(Forecast.[19-Aug-19],0)	+ISNULL(Forecast.[26-Aug-19],0) ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''SEP'')
	BEGIN
	SELECT 
		ISNULL(Forecast.[2-Sep-19],0)	+ISNULL(Forecast.[9-Sep-19],0)	+ISNULL(Forecast.[16-Sep-19],0)	+ISNULL(Forecast.[23-Sep-19],0)	+ISNULL(Forecast.[30-Sep-19],0) ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''OCT'')
	BEGIN
	SELECT 
		ISNULL(Forecast.[7-Oct-19],0)	+ISNULL(Forecast.[14-Oct-19],0)	+ISNULL(Forecast.[21-Oct-19],0)	+ISNULL(Forecast.[28-Oct-19],0) ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''NOV'')
	BEGIN
	SELECT 
		ISNULL(Forecast.[4-Nov-19],0)	+ISNULL(Forecast.[11-Nov-19],0)	+ISNULL(Forecast.[18-Nov-19],0)	+ISNULL(Forecast.[25-Nov-19],0) ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
	IF(@Month=''DEC'')
	BEGIN
	SELECT 
		ISNULL(Forecast.[2-Dec-19],0)	+ISNULL(Forecast.[9-Dec-19],0)	+ISNULL(Forecast.[16-Dec-19],0)	+ISNULL(Forecast.[23-Dec-19],0)	+ISNULL(Forecast.[30-Dec-18],0) ForceData,'''' as Blank
		FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	END
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[SummaryFA]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SummaryFA]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[SummaryFA] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  Convert(Varchar(500),Forecast.[Salary ID]) as SalaryID, Forecast.[Tribe] as Tribe,
	 Convert(Varchar(500),Forecast.[PR Code]) as PRCode,
	  Convert(Varchar(MAX),Forecast.[Description]) as Description,
	   --Convert(Varchar(500),Actuals.[Project Name]) as ProjectName,
	   Convert(Varchar(500),Forecast.[Scrum Team]) as ProjectName,
	    Convert(Varchar(500),Actuals.[Project Cost Centre]) as ProjectCostCentre,
		 Convert(Varchar(500),Actuals.[Date]) as Date,
		 Convert(Varchar(500),[Actuals].[Resource Name]) as ResourceName
		  FROM [Forecast] as Forecast
	 INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	--return 0
	
END


' 
END
GO
/****** Object:  Table [dbo].[Actuals]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Actuals]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Actuals](
	[Project Name] [nvarchar](255) NULL,
	[Project ID] [nvarchar](50) NULL,
	[Project Cost Centre] [nvarchar](50) NULL,
	[Payroll Cost Centre] [nvarchar](50) NULL,
	[Manager] [nvarchar](50) NULL,
	[Manager ID] [nvarchar](50) NULL,
	[Resource Name] [nvarchar](50) NULL,
	[Salary ID] [nvarchar](50) NULL,
	[Resource Rate] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL,
	[Hours Per Day Uncapped] [nvarchar](50) NULL,
	[Hours Per Day Capped] [nvarchar](50) NULL,
	[Hours per day Variance] [nvarchar](50) NULL,
	[Daily Charge Uncapped] [nvarchar](50) NULL,
	[Daily Charge Capped] [nvarchar](50) NULL,
	[Approver] [nvarchar](50) NULL,
	[Approver ID] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Forecast]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Forecast]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Forecast](
	[Salary ID] [nvarchar](50) NULL,
	[Tribe] [nvarchar](50) NULL,
	[PR Code] [nvarchar](50) NULL,
	[Scrum Team] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[Cost Center Code] [nvarchar](50) NULL,
	[Approver] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
	[Resource Name] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[7-Jan-19] [nvarchar](50) NULL,
	[14-Jan-19] [nvarchar](50) NULL,
	[21-Jan-19] [nvarchar](50) NULL,
	[28-Jan-19] [nvarchar](50) NULL,
	[4-Feb-19] [nvarchar](50) NULL,
	[11-Feb-19] [nvarchar](50) NULL,
	[18-Feb-19] [nvarchar](50) NULL,
	[25-Feb-19] [nvarchar](50) NULL,
	[4-Mar-19] [nvarchar](50) NULL,
	[11-Mar-19] [nvarchar](50) NULL,
	[18-Mar-19] [nvarchar](50) NULL,
	[25-Mar-19] [nvarchar](50) NULL,
	[1-Apr-19] [nvarchar](50) NULL,
	[8-Apr-19] [nvarchar](50) NULL,
	[15-Apr-19] [nvarchar](50) NULL,
	[22-Apr-19] [nvarchar](50) NULL,
	[29-Apr-19] [nvarchar](50) NULL,
	[6-May-19] [nvarchar](50) NULL,
	[13-May-19] [nvarchar](50) NULL,
	[20-May-19] [nvarchar](50) NULL,
	[27-May-19] [nvarchar](50) NULL,
	[3-Jun-19] [nvarchar](50) NULL,
	[10-Jun-19] [nvarchar](50) NULL,
	[17-Jun-19] [nvarchar](50) NULL,
	[24-Jun-19] [nvarchar](50) NULL,
	[1-Jul-19] [nvarchar](50) NULL,
	[8-Jul-19] [nvarchar](50) NULL,
	[15-Jul-19] [nvarchar](50) NULL,
	[22-Jul-19] [nvarchar](50) NULL,
	[29-Jul-19] [nvarchar](50) NULL,
	[5-Aug-19] [nvarchar](50) NULL,
	[12-Aug-19] [nvarchar](50) NULL,
	[19-Aug-19] [nvarchar](50) NULL,
	[26-Aug-19] [nvarchar](50) NULL,
	[2-Sep-19] [nvarchar](50) NULL,
	[9-Sep-19] [nvarchar](50) NULL,
	[16-Sep-19] [nvarchar](50) NULL,
	[23-Sep-19] [nvarchar](50) NULL,
	[30-Sep-19] [nvarchar](50) NULL,
	[7-Oct-19] [nvarchar](50) NULL,
	[14-Oct-19] [nvarchar](50) NULL,
	[21-Oct-19] [nvarchar](50) NULL,
	[28-Oct-19] [nvarchar](50) NULL,
	[4-Nov-19] [nvarchar](50) NULL,
	[11-Nov-19] [nvarchar](50) NULL,
	[18-Nov-19] [nvarchar](50) NULL,
	[25-Nov-19] [nvarchar](50) NULL,
	[2-Dec-19] [nvarchar](50) NULL,
	[9-Dec-19] [nvarchar](50) NULL,
	[16-Dec-19] [nvarchar](50) NULL,
	[23-Dec-19] [nvarchar](50) NULL,
	[30-Dec-18] [nvarchar](50) NULL,
	[Days] [nvarchar](50) NULL,
	[Rate/Day] [nvarchar](50) NULL,
	[Cost] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tblScrumTeam]    Script Date: 04-02-2019 2:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblScrumTeam]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblScrumTeam](
	[ScrumTeamId] [int] IDENTITY(1,1) NOT NULL,
	[ScrumTeam] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ScrumTeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kumar, Lalit', N'L074010', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Talathi, Payal', N'L104973', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'GTS Product Business Initiative''s', N'PR132124', N'237955', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Pandey, Deepak', N'L104042', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'SBG end to end digital mortgage', N'PR192036', N'501242', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Miryala, Ramashankar', N'L041120', N'58.75', N'29/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Yanaganti, Swetha', N'L098458', N'58.75', N'29/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jana, Anusha', N'L115774', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Danturi, Dedeepya', N'L116450', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Trackroo, Archie', N'L116396', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Ghogre, Aashish', N'L072428', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Gujula, Niranjan Kumar', N'L114848', N'108.25', N'29/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Sub - IT - Matrix - FrontBook', N'PR183129', N'501101', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Reddy, Papasani Kedarnath', N'L103272', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kasinadh, Surya', N'L046966', N'58.75', N'29/10/2019', N'2', N'2', N'0', N'117.5', N'117.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mahato, Partho', N'L091674', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Shanigarapu, Saisrinivas Rao', N'L102248', N'108.25', N'29/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sharma, Vilas', N'L117691', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'MRP Standard Apps', N'PR182090', N'540351', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Shanmugavel Palani, Shailendar', N'L103752', N'108.25', N'29/10/2019', N'2', N'2', N'0', N'216.5', N'216.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CSH Product and Pricing', N'PR182767', N'844469', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Shanmugavel Palani, Shailendar', N'L103752', N'108.25', N'29/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Godugu, Radhika', N'L093372', N'108.25', N'29/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jain, Vardhman', N'L116394', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Prabhakar, Prabeesh', N'L107178', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Manda, Mathuri', N'L064233', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Digital Responsible Lending Review', N'PR173718', N'169536', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Bejugam, Karthik', N'L104076', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Platform', N'PR183422', N'540261', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Nallapareddy, Kiran', N'L072475', N'108.25', N'29/10/2019', N'6', N'6', N'0', N'649.5', N'649.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jain, Pracheer', N'L112692', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Sub - IT - Matrix - FrontBook', N'PR183129', N'501101', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Chunduru, Neeharika', N'L094597', N'58.75', N'29/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Solleti, Hema', N'L072678', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Singh, Ravikesh', N'L102897', N'108.25', N'29/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'SBG end to end digital mortgage', N'PR192036', N'501242', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Rajeev Mishra, Aishwarya', N'L112741', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Maintenance Sales', N'PR182507', N'530577', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Joshi, Kalyan', N'L115650', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CCR - IT Sub-Project', N'PR183393', N'501505', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Cheruku, Swetha', N'L106361', N'51.7', N'29/10/2019', N'2.2', N'2.2', N'0', N'113.74', N'113.74', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Cards Disputes - IT', N'PR173664', N'080601', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kasinadh, Surya', N'L046966', N'58.75', N'29/10/2019', N'2.8', N'2.8', N'0', N'164.5', N'164.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Topalle, Yagna', N'L045443', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Platform', N'PR183422', N'540261', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Nalla, Mahesh Kumar', N'L051997', N'108.25', N'29/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Agrawal, Jayathi', N'L113293', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kasinadh, Surya', N'L046966', N'58.75', N'29/10/2019', N'2', N'2', N'0', N'117.5', N'117.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Veluvolu, Madhavi', N'L056704', N'58.75', N'29/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Hase, Swapnil', N'L083652', N'58.75', N'29/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Sub - IT - Matrix - FrontBook', N'PR183129', N'501101', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Shanmugavel Palani, Shailendar', N'L103752', N'108.25', N'29/10/2019', N'2', N'2', N'0', N'216.5', N'216.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Gujjula, Sai Ramya', N'L096213', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Recurring Payments and Direct Debits', N'PR183117', N'501502', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mude, Ashish', N'L063574', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CCR - Digital Delivery', N'PR183394', N'501505', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Lade, Chakradhara', N'L064929', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Recurring Payments and Direct Debits', N'PR183117', N'501502', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Ramu, Ambaragonda', N'L118335', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Sub - IT - Matrix - FrontBook', N'PR183129', N'501101', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mali, Bhupendra', N'L103968', N'108.25', N'29/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Tummala, Hema Tummala', N'L070034', N'58.75', N'29/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CCR - IT Sub-Project', N'PR183393', N'501505', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Nalla, Mahesh Kumar', N'L051997', N'108.25', N'29/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Consumer Bank Technology Estimations', N'PR172857', N'237055', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Nallapareddy, Kiran', N'L072475', N'108.25', N'29/10/2019', N'2', N'2', N'0', N'216.5', N'216.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'GTS Product Business Initiative''s', N'PR132124', N'237955', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Cheruku, Swetha', N'L106361', N'51.7', N'29/10/2019', N'4.4', N'4.4', N'0', N'227.48', N'227.48', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Lender Assist Technology', N'PR183502', N'501517', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Paladugu, Sanath', N'L072677', N'108.25', N'29/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'IT Automated FSV WBC Unsecured', N'PR182799', N'501519', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Singh, Suraj', N'L096246', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Wood, Peter', N'M005102')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'IT SGB Automated FSV Ph1', N'PR182809', N'501519', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Krishna K, Murali', N'L062961', N'108.25', N'29/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Thandu, Sindhuja', N'L118450', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Beeram, Santhoshi', N'L117692', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Yakala, Srinivas', N'L081226', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Pratap, Ashwani', N'L096306', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'IT Automated FSV WBC Unsecured', N'PR182799', N'501519', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Modi, Anubhav', N'L078455', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sharma, Swati', N'L103629', N'108.25', N'29/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kulkarni, Shalini', N'L093802', N'108.25', N'29/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Govind, Santhosh Kumar', N'L067138', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sangwikar, Saee', N'L111760', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Pasham, Pasham Abishekar Reddy', N'L070033', N'58.75', N'29/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Goel, Mradul', N'L114970', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'IT Automated FSV WBC Unsecured', N'PR182799', N'501519', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jaiswal, Jyoti', N'L098678', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kumar, Amrit', N'L115776', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CCR - IT Sub-Project', N'PR183393', N'501505', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Pidugu, Shiva Shankar', N'L084302', N'58.75', N'29/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Vemula, Lokesh', N'L117037', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Ravikanti, Eshwar', N'L092551', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Basawapuram, Adarsh', N'L054248', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sharma, Rachita', N'L111759', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jain, Ashu', N'L063374', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Cards Disputes - IT', N'PR173664', N'080601', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Cheruku, Swetha', N'L106361', N'51.7', N'29/10/2019', N'2.2', N'2.2', N'0', N'113.74', N'113.74', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Everyday Banking - WBC CCC WOW', N'PR182250', N'120050', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Muzammil, Mohammad', N'L058584', N'58.75', N'29/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sammeta, Girija', N'L118761', N'58.75', N'29/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Wood, Peter', N'M005102')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Madke, Vibha', N'L058372', N'70.57', N'29/10/2019', N'8.8', N'8.8', N'0', N'621.016', N'621.016', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mittapali, Ramprasad', N'L116177', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Singh, Arpanjyot', N'L117679', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Chandure, Virendra', N'L070603', N'108.25', N'29/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Phatak, Nivedita', N'L058378', N'111.38', N'29/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mehta, Annapurna', N'L105211', N'51.7', N'29/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Wood, Peter', N'M005102')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Digital Responsible Lending Review', N'PR173718', N'169536', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Shanigarapu, Saisrinivas Rao', N'L102248', N'108.25', N'29/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kumar, Amrit', N'L115776', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CCR - Digital Delivery', N'PR183394', N'501505', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Lade, Chakradhara', N'L064929', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kasinadh, Surya', N'L046966', N'58.75', N'30/10/2019', N'2', N'2', N'0', N'117.5', N'117.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jana, Anusha', N'L115774', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mahato, Partho', N'L091674', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mittapali, Ramprasad', N'L116177', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kasinadh, Surya', N'L046966', N'58.75', N'30/10/2019', N'2', N'2', N'0', N'117.5', N'117.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Govind, Santhosh Kumar', N'L067138', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Bathina, Durgaprasad', N'L117036', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'IT SGB Automated FSV Ph1', N'PR182809', N'501519', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Krishna K, Murali', N'L062961', N'108.25', N'30/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Digital Responsible Lending Review', N'PR173718', N'169536', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Bejugam, Karthik', N'L104076', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sangwikar, Saee', N'L111760', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Agrawal, Jayathi', N'L113293', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Manda, Mathuri', N'L064233', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Danturi, Dedeepya', N'L116450', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Yakala, Srinivas', N'L081226', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kulkarni, Shalini', N'L093802', N'108.25', N'30/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Sub - IT - Matrix - FrontBook', N'PR183129', N'501101', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Reddy, Papasani Kedarnath', N'L103272', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Chandure, Virendra', N'L070603', N'108.25', N'30/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Lender Assist Technology', N'PR183502', N'501517', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Paladugu, Sanath', N'L072677', N'108.25', N'30/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CCR - IT Sub-Project', N'PR183393', N'501505', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Pidugu, Shiva Shankar', N'L084302', N'58.75', N'30/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mehta, Annapurna', N'L105211', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Wood, Peter', N'M005102')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Singh, Arpanjyot', N'L117679', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CSH Product and Pricing', N'PR182767', N'844469', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Shanmugavel Palani, Shailendar', N'L103752', N'108.25', N'30/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Everyday Banking - WBC CCC WOW', N'PR182250', N'120050', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Muzammil, Mohammad', N'L058584', N'58.75', N'30/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Recurring Payments and Direct Debits', N'PR183117', N'501502', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mude, Ashish', N'L063574', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Prabhakar, Prabeesh', N'L107178', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'IT Automated FSV WBC Unsecured', N'PR182799', N'501519', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Modi, Anubhav', N'L078455', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Phatak, Nivedita', N'L058378', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Consumer Bank Technology Estimations', N'PR172857', N'237055', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Nallapareddy, Kiran', N'L072475', N'108.25', N'30/10/2019', N'2', N'2', N'0', N'216.5', N'216.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sammeta, Girija', N'L118761', N'58.75', N'30/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Wood, Peter', N'M005102')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Pratap, Ashwani', N'L096306', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Sub - IT - Matrix - FrontBook', N'PR183129', N'501101', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mali, Bhupendra', N'L103968', N'108.25', N'30/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Sub - IT - Matrix - FrontBook', N'PR183129', N'501101', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Chunduru, Neeharika', N'L094597', N'58.75', N'30/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Platform', N'PR183422', N'540261', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Nallapareddy, Kiran', N'L072475', N'108.25', N'30/10/2019', N'6', N'6', N'0', N'649.5', N'649.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Maintenance Sales', N'PR182507', N'530577', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Joshi, Kalyan', N'L115650', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'SBG end to end digital mortgage', N'PR192036', N'501242', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Rajeev Mishra, Aishwarya', N'L112741', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Digital Responsible Lending Review', N'PR173718', N'169536', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Shanigarapu, Saisrinivas Rao', N'L102248', N'108.25', N'30/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Gujula, Niranjan Kumar', N'L114848', N'108.25', N'30/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'GTS Product Business Initiative''s', N'PR132124', N'237955', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Cheruku, Swetha', N'L106361', N'51.7', N'30/10/2019', N'4.4', N'4.4', N'0', N'227.48', N'227.48', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'IT Automated FSV WBC Unsecured', N'PR182799', N'501519', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sasmal, Ayan', N'L065535', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Solleti, Hema', N'L072678', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sharma, Vilas', N'L117691', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sharma, Swati', N'L103629', N'108.25', N'30/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Sub - IT - Matrix - FrontBook', N'PR183129', N'501101', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Shanmugavel Palani, Shailendar', N'L103752', N'108.25', N'30/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CCR - IT Sub-Project', N'PR183393', N'501505', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Nalla, Mahesh Kumar', N'L051997', N'108.25', N'30/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CCR - IT Sub-Project', N'PR183393', N'501505', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Cheruku, Swetha', N'L106361', N'51.7', N'30/10/2019', N'2.2', N'2.2', N'0', N'113.74', N'113.74', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Ghogre, Aashish', N'L072428', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jain, Vardhman', N'L116394', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jain, Pracheer', N'L112692', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'IT Automated FSV WBC Unsecured', N'PR182799', N'501519', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Singh, Suraj', N'L096246', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Wood, Peter', N'M005102')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jain, Ashu', N'L063374', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Hase, Swapnil', N'L083652', N'58.75', N'30/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Beeram, Santhoshi', N'L117692', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Shanigarapu, Saisrinivas Rao', N'L102248', N'108.25', N'30/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Platform', N'PR183422', N'540261', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Nalla, Mahesh Kumar', N'L051997', N'108.25', N'30/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Recurring Payments and Direct Debits', N'PR183117', N'501502', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Ramu, Ambaragonda', N'L118335', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Talathi, Payal', N'L104973', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Cards Disputes - IT', N'PR173664', N'080601', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Cheruku, Swetha', N'L106361', N'51.7', N'30/10/2019', N'2.2', N'2.2', N'0', N'113.74', N'113.74', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Godugu, Radhika', N'L093372', N'108.25', N'30/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CCR - IT Sub-Project', N'PR183393', N'501505', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kasinadh, Surya', N'L046966', N'58.75', N'30/10/2019', N'2', N'2', N'0', N'117.5', N'117.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Veluvolu, Madhavi', N'L056704', N'58.75', N'30/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Goel, Mradul', N'L114970', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Vemula, Lokesh', N'L117037', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Cards Disputes - IT', N'PR173664', N'080601', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kasinadh, Surya', N'L046966', N'58.75', N'30/10/2019', N'2.8', N'2.8', N'0', N'164.5', N'164.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sharma, Rachita', N'L111759', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Thandu, Sindhuja', N'L118450', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Ravikanti, Eshwar', N'L092551', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Madke, Vibha', N'L058372', N'70.57', N'30/10/2019', N'8.8', N'8.8', N'0', N'621.016', N'621.016', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'SBG end to end digital mortgage', N'PR192036', N'501242', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Miryala, Ramashankar', N'L041120', N'58.75', N'30/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Topalle, Yagna', N'L045443', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kumar, Lalit', N'L074010', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Singh, Ravikesh', N'L102897', N'108.25', N'30/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Yanaganti, Swetha', N'L098458', N'58.75', N'30/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Basawapuram, Adarsh', N'L054248', N'111.38', N'30/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'GTS Product Business Initiative''s', N'PR132124', N'237955', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Pandey, Deepak', N'L104042', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Tummala, Hema Tummala', N'L070034', N'58.75', N'30/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Gujjula, Sai Ramya', N'L096213', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'IT Automated FSV WBC Unsecured', N'PR182799', N'501519', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jaiswal, Jyoti', N'L098678', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Trackroo, Archie', N'L116396', N'51.7', N'30/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Shanigarapu, Saisrinivas Rao', N'L102248', N'108.25', N'31/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Consumer Bank Technology Estimations', N'PR172857', N'237055', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Nallapareddy, Kiran', N'L072475', N'108.25', N'31/10/2019', N'2', N'2', N'0', N'216.5', N'216.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jain, Pracheer', N'L112692', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CCR - IT Sub-Project', N'PR183393', N'501505', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Pidugu, Shiva Shankar', N'L084302', N'58.75', N'31/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kumar, Amrit', N'L115776', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Sub - IT - Matrix - FrontBook', N'PR183129', N'501101', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Chunduru, Neeharika', N'L094597', N'58.75', N'31/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Yakala, Srinivas', N'L081226', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Ravikanti, Eshwar', N'L092551', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Ghogre, Aashish', N'L072428', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Gujula, Niranjan Kumar', N'L114848', N'108.25', N'31/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Recurring Payments and Direct Debits', N'PR183117', N'501502', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Ramu, Ambaragonda', N'L118335', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Madke, Vibha', N'L058372', N'70.57', N'31/10/2019', N'8.8', N'8.8', N'0', N'621.016', N'621.016', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jana, Anusha', N'L115774', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Cards Disputes - IT', N'PR173664', N'080601', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Cheruku, Swetha', N'L106361', N'51.7', N'31/10/2019', N'2.2', N'2.2', N'0', N'113.74', N'113.74', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kumar, Lalit', N'L074010', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Yanaganti, Swetha', N'L098458', N'58.75', N'31/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Singh, Ravikesh', N'L102897', N'108.25', N'31/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Sub - IT - Matrix - FrontBook', N'PR183129', N'501101', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Reddy, Papasani Kedarnath', N'L103272', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Phatak, Nivedita', N'L058378', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Trackroo, Archie', N'L116396', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Platform', N'PR183422', N'540261', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Nalla, Mahesh Kumar', N'L051997', N'108.25', N'31/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Pasham, Pasham Abishekar Reddy', N'L070033', N'58.75', N'31/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Recurring Payments and Direct Debits', N'PR183117', N'501502', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mude, Ashish', N'L063574', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jain, Ashu', N'L063374', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'SBG end to end digital mortgage', N'PR192036', N'501242', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Rajeev Mishra, Aishwarya', N'L112741', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Goel, Mradul', N'L114970', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'GTS Product Business Initiative''s', N'PR132124', N'237955', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Pandey, Deepak', N'L104042', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Singh, Arpanjyot', N'L117679', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Pratap, Ashwani', N'L096306', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Bathina, Durgaprasad', N'L117036', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'IT Automated FSV WBC Unsecured', N'PR182799', N'501519', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Singh, Suraj', N'L096246', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Wood, Peter', N'M005102')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CCR - IT Sub-Project', N'PR183393', N'501505', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kasinadh, Surya', N'L046966', N'58.75', N'31/10/2019', N'2', N'2', N'0', N'117.5', N'117.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CCR - Digital Delivery', N'PR183394', N'501505', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Lade, Chakradhara', N'L064929', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'GTS Product Business Initiative''s', N'PR132124', N'237955', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Cheruku, Swetha', N'L106361', N'51.7', N'31/10/2019', N'4.4', N'4.4', N'0', N'227.48', N'227.48', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Danturi, Dedeepya', N'L116450', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Vemula, Lokesh', N'L117037', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Hase, Swapnil', N'L083652', N'58.75', N'31/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Digital Responsible Lending Review', N'PR173718', N'169536', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Shanigarapu, Saisrinivas Rao', N'L102248', N'108.25', N'31/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CSH Product and Pricing', N'PR182767', N'844469', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Shanmugavel Palani, Shailendar', N'L103752', N'108.25', N'31/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Veluvolu, Madhavi', N'L056704', N'58.75', N'31/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sharma, Vilas', N'L117691', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Platform', N'PR183422', N'540261', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Nallapareddy, Kiran', N'L072475', N'108.25', N'31/10/2019', N'6', N'6', N'0', N'649.5', N'649.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jain, Vardhman', N'L116394', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Thandu, Sindhuja', N'L118450', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Digital Responsible Lending Review', N'PR173718', N'169536', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Bejugam, Karthik', N'L104076', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'IT Automated FSV WBC Unsecured', N'PR182799', N'501519', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Modi, Anubhav', N'L078455', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CCR - IT Sub-Project', N'PR183393', N'501505', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Cheruku, Swetha', N'L106361', N'51.7', N'31/10/2019', N'2.2', N'2.2', N'0', N'113.74', N'113.74', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Agrawal, Jayathi', N'L113293', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Basawapuram, Adarsh', N'L054248', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kulkarni, Shalini', N'L093802', N'108.25', N'31/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mittapali, Ramprasad', N'L116177', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'IT SGB Automated FSV Ph1', N'PR182809', N'501519', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Krishna K, Murali', N'L062961', N'108.25', N'31/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Solleti, Hema', N'L072678', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'SBG end to end digital mortgage', N'PR192036', N'501242', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Miryala, Ramashankar', N'L041120', N'58.75', N'31/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mehta, Annapurna', N'L105211', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Wood, Peter', N'M005102')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sammeta, Girija', N'L118761', N'58.75', N'31/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Wood, Peter', N'M005102')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'IT Automated FSV WBC Unsecured', N'PR182799', N'501519', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sasmal, Ayan', N'L065535', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Everyday Banking - WBC CCC WOW', N'PR182250', N'120050', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Muzammil, Mohammad', N'L058584', N'58.75', N'31/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sharma, Rachita', N'L111759', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kasinadh, Surya', N'L046966', N'58.75', N'31/10/2019', N'2', N'2', N'0', N'117.5', N'117.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Sub - IT - Matrix - FrontBook', N'PR183129', N'501101', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Shanmugavel Palani, Shailendar', N'L103752', N'108.25', N'31/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Sharma, Swati', N'L103629', N'108.25', N'31/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CCR - IT Sub-Project', N'PR183393', N'501505', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Nalla, Mahesh Kumar', N'L051997', N'108.25', N'31/10/2019', N'4', N'4', N'0', N'433', N'433', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Bank + Invoicing', N'PR173675', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Topalle, Yagna', N'L045443', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Chandure, Virendra', N'L070603', N'108.25', N'31/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Beeram, Santhoshi', N'L117692', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Maintenance Sales', N'PR182507', N'530577', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Joshi, Kalyan', N'L115650', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'CBT SUB Customer Pricing Platform (CPP)', N'PR180122', N'505262', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Prabhakar, Prabeesh', N'L107178', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Gujjula, Sai Ramya', N'L096213', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Lender Assist Technology', N'PR183502', N'501517', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Paladugu, Sanath', N'L072677', N'108.25', N'31/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Cards Disputes - IT', N'PR173664', N'080601', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kasinadh, Surya', N'L046966', N'58.75', N'31/10/2019', N'2.8', N'2.8', N'0', N'164.5', N'164.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Manda, Mathuri', N'L064233', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Sub - IT - Matrix - FrontBook', N'PR183129', N'501101', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mali, Bhupendra', N'L103968', N'108.25', N'31/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'IT Automated FSV WBC Unsecured', N'PR182799', N'501519', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Jaiswal, Jyoti', N'L098678', N'51.7', N'31/10/2019', N'8.8', N'8.8', N'0', N'454.96', N'454.96', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Kasinadh, Surya', N'L046966', N'58.75', N'31/10/2019', N'2', N'2', N'0', N'117.5', N'117.5', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - Core', N'PR183424', N'501984', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Mahato, Partho', N'L091674', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Govind, Santhosh Kumar', N'L067138', N'111.38', N'31/10/2019', N'8', N'8', N'0', N'891.04', N'891.04', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'Temp project for BDART', N'PR183511', N'120365', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Godugu, Radhika', N'L093372', N'108.25', N'31/10/2019', N'8', N'8', N'0', N'866', N'866', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (N'NPP - St George', N'PR183425', N'501886', N'237055', N'Narayana Doss, Kirby', N'L106329', N'Tummala, Hema Tummala', N'L070034', N'58.75', N'31/10/2019', N'8.8', N'8.8', N'0', N'517', N'517', N'Mansell, Greg', N'M471954')
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Actuals] ([Project Name], [Project ID], [Project Cost Centre], [Payroll Cost Centre], [Manager], [Manager ID], [Resource Name], [Salary ID], [Resource Rate], [Date], [Hours Per Day Uncapped], [Hours Per Day Capped], [Hours per day Variance], [Daily Charge Uncapped], [Daily Charge Capped], [Approver], [Approver ID]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L074010', N'Digital (BBDT)', N'PR183511', N'A', N'Merchant Entitlements', NULL, N'Lisa Valentine', N'Developer', N'Radhika Godugu', N'Onshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'224', N'798', N'178752')
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L104973', N'Digital (BBDT)', N'PR183511', N'A', N'Merchant Entitlements', NULL, N'Lisa Valentine', N'Developer', N'Muzamil Mohammad', N'Offshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'224', N'405', N'90720')
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L104042', N'Digital (BBDT)', N'PR183511', N'A', N'Merchant Entitlements', NULL, N'Lisa Valentine', N'Developer', N'Mrudal Goedal', N'Offshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'224', N'405', N'90720')
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L041120', N'Digital (BBDT)', N'PR183511', N'A', N'Merchant Entitlements', NULL, N'Lisa Valentine', N'Developer', N'Ravikesh Singh', N'Onshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'224', N'798', N'178752')
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L098458', N'Digital (BBDT)', N'PR183511', N'A', N'Merchant Entitlements', NULL, N'Lisa Valentine', N'Developer', N'Shalini Kulkarni', N'Onshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'5', N'224', N'798', N'178752')
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L115774', N'Digital (BBDT)', N'PR183511', N'B', N'WL Entitlements', NULL, N'Lisa Valentine', N'Developer', N'Hema Soletti', N'Onshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'184', N'798', N'146832')
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L116450', N'Digital (BBDT)', N'PR183511', N'B', N'WL Entitlements', NULL, N'Lisa Valentine', N'Developer', N'Amrit Kumar', N'Offshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', NULL, NULL, NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', NULL, NULL, NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', NULL, NULL, NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', NULL, NULL, NULL, NULL, N'144', N'405', N'58320')
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L116396', N'Digital (BBDT)', N'PR183511', N'B', N'WL Entitlements', NULL, N'Lisa Valentine', N'Developer', N'Anusha Jana', N'Offshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', NULL, NULL, NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', NULL, NULL, NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', NULL, NULL, NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', NULL, NULL, NULL, NULL, N'144', N'405', N'58320')
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L072428', N'Digital (BBDT)', N'PR173675', N'C', N'BANK+', NULL, N'Lisa Valentine', N'Developer', N'Ashwani Pratap', N'Offshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'184', N'405', N'74520')
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L114848', N'Digital (BBDT)', N'PR173675', N'C', N'BANK+', NULL, N'Lisa Valentine', N'Developer', N'Rachita Sharma', N'Offshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'184', N'405', N'74520')
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L103272', N'Digital (BBDT)', N'PR173675', N'C', N'BANK+', NULL, N'Lisa Valentine', N'Developer', N'Lalit Kumar', N'Onshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'184', N'798', N'146832')
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L046966', N'Digital (BBDT)', N'PR173675', N'C', N'BANK+', NULL, N'Lisa Valentine', N'Developer', N'Adarsh Basawaparum', N'Onshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'184', N'798', N'146832')
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L091674', N'Digital (BBDT)', N'PR173675', N'C', N'BANK+', NULL, N'Lisa Valentine', N'Developer', N'Ashu Jain', N'Onshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'184', N'798', N'146832')
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L102248', N'Digital (BBDT)', N'PR173675', N'C', N'BANK+', NULL, N'Lisa Valentine', N'Developer', N'Yagna Topalle', N'Onshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'184', N'798', N'146832')
GO
INSERT [dbo].[Forecast] ([Salary ID], [Tribe], [PR Code], [Scrum Team], [Description], [Cost Center Code], [Approver], [Role], [Resource Name], [Location], [7-Jan-19], [14-Jan-19], [21-Jan-19], [28-Jan-19], [4-Feb-19], [11-Feb-19], [18-Feb-19], [25-Feb-19], [4-Mar-19], [11-Mar-19], [18-Mar-19], [25-Mar-19], [1-Apr-19], [8-Apr-19], [15-Apr-19], [22-Apr-19], [29-Apr-19], [6-May-19], [13-May-19], [20-May-19], [27-May-19], [3-Jun-19], [10-Jun-19], [17-Jun-19], [24-Jun-19], [1-Jul-19], [8-Jul-19], [15-Jul-19], [22-Jul-19], [29-Jul-19], [5-Aug-19], [12-Aug-19], [19-Aug-19], [26-Aug-19], [2-Sep-19], [9-Sep-19], [16-Sep-19], [23-Sep-19], [30-Sep-19], [7-Oct-19], [14-Oct-19], [21-Oct-19], [28-Oct-19], [4-Nov-19], [11-Nov-19], [18-Nov-19], [25-Nov-19], [2-Dec-19], [9-Dec-19], [16-Dec-19], [23-Dec-19], [30-Dec-18], [Days], [Rate/Day], [Cost]) VALUES (N'L117691', N'Digital (BBDT)', N'PR173675', N'C', N'BANK+', NULL, N'Lisa Valentine', N'Developer', N'Nivideta Phatek', N'Onshore', N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'3', N'4', N'5', N'2', N'2', N'5', N'5', N'5', N'5', N'5', N'5', NULL, NULL, N'184', N'798', N'146832')
GO
SET IDENTITY_INSERT [dbo].[tblScrumTeam] ON 

GO
INSERT [dbo].[tblScrumTeam] ([ScrumTeamId], [ScrumTeam]) VALUES (1, N'A')
GO
INSERT [dbo].[tblScrumTeam] ([ScrumTeamId], [ScrumTeam]) VALUES (2, N'B')
GO
INSERT [dbo].[tblScrumTeam] ([ScrumTeamId], [ScrumTeam]) VALUES (3, N'C')
GO
SET IDENTITY_INSERT [dbo].[tblScrumTeam] OFF
GO
