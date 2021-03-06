USE [EffortEst]
GO
/****** Object:  Table [dbo].[Actuals]    Script Date: 17/01/2019 12:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[Forecast]    Script Date: 17/01/2019 12:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE TABLE [dbo].[Forecast](
--	[Salary ID] [nvarchar](50) NULL,
--	[Tribe] [nvarchar](50) NULL,
--	[PR Code] [nvarchar](50) NULL,
--	[Description] [nvarchar](255) NULL,
--	[Cost Center Code] [nvarchar](50) NULL,
--	[Approver] [nvarchar](50) NULL,
--	[Role] [nvarchar](50) NULL,
--	[Resource Name] [nvarchar](50) NULL,
--	[Location] [nvarchar](50) NULL,
--	[28-Jan-19] [nvarchar](50) NULL,
--	[4-Feb-19] [nvarchar](50) NULL,
--	[11-Feb-19] [nvarchar](50) NULL,
--	[18-Feb-19] [nvarchar](50) NULL,
--	[25-Feb-19] [nvarchar](50) NULL,
--	[4-Mar-19] [nvarchar](50) NULL,
--	[11-Mar-19] [nvarchar](50) NULL,
--	[18-Mar-19] [nvarchar](50) NULL,
--	[25-Mar-19] [nvarchar](50) NULL,
--	[1-Apr-19] [nvarchar](50) NULL,
--	[8-Apr-19] [nvarchar](50) NULL,
--	[15-Apr-19] [nvarchar](50) NULL,
--	[22-Apr-19] [nvarchar](50) NULL,
--	[29-Apr-19] [nvarchar](50) NULL,
--	[6-May-19] [nvarchar](50) NULL,
--	[13-May-19] [nvarchar](50) NULL,
--	[20-May-19] [nvarchar](50) NULL,
--	[27-May-19] [nvarchar](50) NULL,
--	[Days] [nvarchar](50) NULL,
--	[Rate/Day] [nvarchar](50) NULL,
--	[Cost] [nvarchar](50) NULL
--) ON [PRIMARY]

Create Table tblScrumTeam
(
ScrumTeamId int identity  primary key,
ScrumTeam nvarchar(50)
)
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
	[14-Jan-19] [nvarchar](50) NULL,	[21-Jan-19] [nvarchar](50) NULL,	
	[28-Jan-19] [nvarchar](50) NULL,	
	[4-Feb-19] [nvarchar](50) NULL,	[11-Feb-19] [nvarchar](50) NULL,	[18-Feb-19] [nvarchar](50) NULL,	[25-Feb-19] [nvarchar](50) NULL,	
	[4-Mar-19] [nvarchar](50) NULL,	[11-Mar-19] [nvarchar](50) NULL,	[18-Mar-19] [nvarchar](50) NULL,	[25-Mar-19] [nvarchar](50) NULL,	
	[1-Apr-19] [nvarchar](50) NULL,	[8-Apr-19] [nvarchar](50) NULL,	[15-Apr-19] [nvarchar](50) NULL,	[22-Apr-19] [nvarchar](50) NULL,	[29-Apr-19] [nvarchar](50) NULL,	
	[6-May-19] [nvarchar](50) NULL,	[13-May-19] [nvarchar](50) NULL,	[20-May-19] [nvarchar](50) NULL,	[27-May-19] [nvarchar](50) NULL,	
	[3-Jun-19] [nvarchar](50) NULL,	[10-Jun-19] [nvarchar](50) NULL,	[17-Jun-19] [nvarchar](50) NULL,	[24-Jun-19] [nvarchar](50) NULL,	
	[1-Jul-19] [nvarchar](50) NULL,	[8-Jul-19] [nvarchar](50) NULL,	[15-Jul-19] [nvarchar](50) NULL,	[22-Jul-19] [nvarchar](50) NULL,	[29-Jul-19] [nvarchar](50) NULL,	
	[5-Aug-19] [nvarchar](50) NULL,	[12-Aug-19] [nvarchar](50) NULL,	[19-Aug-19] [nvarchar](50) NULL,	[26-Aug-19] [nvarchar](50) NULL,	
	[2-Sep-19] [nvarchar](50) NULL,	[9-Sep-19] [nvarchar](50) NULL,	[16-Sep-19] [nvarchar](50) NULL,	[23-Sep-19] [nvarchar](50) NULL,	[30-Sep-19] [nvarchar](50) NULL,	
	[7-Oct-19] [nvarchar](50) NULL,	[14-Oct-19] [nvarchar](50) NULL,	[21-Oct-19] [nvarchar](50) NULL,	[28-Oct-19] [nvarchar](50) NULL,	
	[4-Nov-19] [nvarchar](50) NULL,	[11-Nov-19] [nvarchar](50) NULL,	[18-Nov-19] [nvarchar](50) NULL,	[25-Nov-19] [nvarchar](50) NULL,	
	[2-Dec-19] [nvarchar](50) NULL,	[9-Dec-19] [nvarchar](50) NULL,	[16-Dec-19] [nvarchar](50) NULL,	[23-Dec-19] [nvarchar](50) NULL,	[30-Dec-18] [nvarchar](50) NULL,

	[Days] [nvarchar](50) NULL,
	[Rate/Day] [nvarchar](50) NULL,
	[Cost] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[ActDec-18]    Script Date: 17/01/2019 12:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ActDec-18] 
	@SV_SalaryId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)='12/2018'),0) as Effort11,'' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


GO
/****** Object:  StoredProcedure [dbo].[ActFeb-19]    Script Date: 17/01/2019 12:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)='02/2019'),0) as Effort11,'' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


GO
/****** Object:  StoredProcedure [dbo].[ActJan-19]    Script Date: 17/01/2019 12:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ActJan-19] 
	@SV_SalaryId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT Forecast.[28-Jan-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)='01/2019'),0) as Effort11,'' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


GO
/****** Object:  StoredProcedure [dbo].[ActMar-19]    Script Date: 17/01/2019 12:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)='03/2019'),0) as Effort11,'' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


GO
/****** Object:  StoredProcedure [dbo].[ActNov-18]    Script Date: 17/01/2019 12:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ActNov-18] 
	@SV_SalaryId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)='11/2018'),0) as Effort11,'' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


GO
/****** Object:  StoredProcedure [dbo].[ForcFeb-19]    Script Date: 17/01/2019 12:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
	--SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)='01/2019'),0) as Effort11,'' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


GO
/****** Object:  StoredProcedure [dbo].[ForcJan-19]    Script Date: 17/01/2019 12:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ForcJan-19] 
	@SV_SalaryId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Forecast.[28-Jan-19] FROM [Forecast] as Forecast where [Salary ID] = @SV_SalaryId
	--SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)='12/2018'),0) as Effort11,'' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


GO
/****** Object:  StoredProcedure [dbo].[ForcMar-19]    Script Date: 17/01/2019 12:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
	--SELECT IsNull((SELECT Sum(CAST(Actuals.[Hours Per Day Uncapped] as decimal)) FROM [Actuals] as Actuals where [Salary ID] = @SV_SalaryId and SUBSTRING([Date], 4,7)='02/2019'),0) as Effort11,'' as blank
		  --FROM [Forecast] as Forecast
	 --INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END


GO
/****** Object:  StoredProcedure [dbo].[SummaryFA]    Script Date: 17/01/2019 12:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SummaryFA] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Forecast.[Salary ID] as SalaryID, Forecast.[Tribe] as Tribe,
	 Forecast.[PR Code] as PRCode,
	  Forecast.[Description] as Description,
	   Actuals.[Project Name] as ProjectName,
	    Actuals.[Project Cost Centre] as ProjectCostCentre,
		 Actuals.[Date] as Date,
		 [Actuals].[Resource Name] as ResourceName
		  FROM [Forecast] as Forecast
	 INNER JOIN [Actuals] as Actuals on Forecast.[Salary ID]=Actuals.[Salary ID]
	return 0
	
END

GO
