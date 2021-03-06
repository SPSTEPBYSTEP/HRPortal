USE [SWCCorp]
GO
/****** Object:  Table [dbo].[CurrentProducts]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CurrentProducts](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[RetailPrice] [money] NULL,
	[OriginationDate] [datetime] NULL,
	[ToBeDeleted] [bit] NULL,
	[Category] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpID] [int] IDENTITY(15,1) NOT NULL,
	[LastName] [varchar](30) NULL,
	[FirstName] [varchar](20) NULL,
	[HireDate] [datetime] NULL,
	[LocationID] [int] NULL,
	[ManagerID] [int] NULL,
	[Status] [char](12) NULL,
 CONSTRAINT [PK__Employee__AF2DBA79D918C347] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grant]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grant](
	[GrantID] [char](3) NOT NULL,
	[GrantName] [nvarchar](50) NOT NULL,
	[EmpID] [int] NULL,
	[Amount] [smallmoney] NULL,
UNIQUE NONCLUSTERED 
(
	[GrantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] NOT NULL,
	[Street] [varchar](30) NULL,
	[City] [varchar](20) NULL,
	[State] [char](2) NULL,
UNIQUE NONCLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MgmtTraining]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MgmtTraining](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[ClassDurationHours] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaidTimeOff]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaidTimeOff](
	[PtoRequestID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[EmpID] [int] NOT NULL,
	[HoursRequested] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[ReasonRejected] [varchar](20) NULL,
	[ManagerID] [int] NULL,
 CONSTRAINT [PK_PaidTimeOff] PRIMARY KEY CLUSTERED 
(
	[PtoRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PayRates]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayRates](
	[EmpID] [int] NOT NULL,
	[YearlySalary] [smallmoney] NULL,
	[MonthlySalary] [smallmoney] NULL,
	[HourlyRate] [smallmoney] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheet](
	[TimesheetId] [int] IDENTITY(1,1) NOT NULL,
	[DateOfTimesheet] [datetime] NOT NULL,
	[TotalHoursByDay] [decimal](4, 2) NOT NULL,
	[EmpId] [int] NOT NULL,
	[PtoRequestID] [int] NULL,
 CONSTRAINT [PK_TimeSheet] PRIMARY KEY CLUSTERED 
(
	[TimesheetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[PaidTimeOff]  WITH CHECK ADD  CONSTRAINT [FK_PaidTimeOff_Employee] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employee] ([EmpID])
GO
ALTER TABLE [dbo].[PaidTimeOff] CHECK CONSTRAINT [FK_PaidTimeOff_Employee]
GO
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_Employee] FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employee] ([EmpID])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_Employee]
GO
/****** Object:  StoredProcedure [dbo].[GetEmployee]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetEmployee]
(
	@EmployeeID int
)AS

SELECT *
FROM Employee
WHERE EmpID = @EmployeeID
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEmployee]
(
	@FirstName varchar(20),
	@LastName varchar(30),
	@EmpId int output
)AS

BEGIN
	INSERT INTO Employee (FirstName, LastName)
	VALUES (@FirstName, @LastName)

	SET @EmpId = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeLastAndState]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spGetEmployeeLastAndState]
@eid char(3)
as
select e.Lastname, a.state
from Employee as e inner join Location as a
on e.LocationID = a.LocationID
where e.LocationID = @eid

GO
/****** Object:  StoredProcedure [dbo].[SubmitNewTimeSheet]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SubmitNewTimeSheet]
(
@dateOfSheet date,
@totalHrsThatDay int,
@empId int
)
as

insert into TimeSheet(DateOfTimesheet,TotalHoursByDay,EmpId)
Values(@dateOfSheet,@totalHrsThatDay, @empId)



GO
/****** Object:  StoredProcedure [dbo].[SubmitPtoRequest]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SubmitPtoRequest]
(
	@EmpId int,
	@HoursRequested int,
	@Date Date
)AS

INSERt INto PaidTimeOff ([status], EmpID, HoursRequested, [Date])
Values ('Submitted', @EmpId, @HoursRequested, @Date)
GO
/****** Object:  StoredProcedure [dbo].[TimeTrackerSummary]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[TimeTrackerSummary]
(
@empID int
)
as

select * from TimeSheet
inner join Employee on TimeSheet.EmpId = Employee.EmpID
where TimeSheet.EmpId = @empID
order by DateOfTimesheet desc
GO
/****** Object:  StoredProcedure [dbo].[TotalHoursWorked]    Script Date: 7/22/2015 11:56:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TotalHoursWorked]
(
	@employeeID int
)AS


Select SUM(TotalHoursByDay) as TotalHoursWorked
From TimeSheet t
	INNER JOIN Employee e
	ON t.EmpId = e.EmpID
WHERE t.EmpId =@employeeID
group by t.EmpId, e.FirstName, e.LastName


GO
