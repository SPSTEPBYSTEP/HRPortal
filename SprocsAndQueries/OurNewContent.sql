USE [SWCCorp]
GO
/****** Object:  Table [dbo].[PaidTimeOff]    Script Date: 7/22/2015 12:01:36 PM ******/
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
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 7/22/2015 12:01:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SubmitNewTimeSheet]    Script Date: 7/22/2015 12:01:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SubmitPtoRequest]    Script Date: 7/22/2015 12:01:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TimeTrackerSummary]    Script Date: 7/22/2015 12:01:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TotalHoursWorked]    Script Date: 7/22/2015 12:01:36 PM ******/
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
