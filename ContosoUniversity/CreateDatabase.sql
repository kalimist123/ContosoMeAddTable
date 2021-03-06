USE [master]
GO
/****** Object:  Database [ContosoMeAddTable]    Script Date: 11/10/2017 11:03:15 ******/
CREATE DATABASE [ContosoMeAddTable]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ContosoMeAddTable', FILENAME = N'C:\Users\Mick\ContosoMeAddTable.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ContosoMeAddTable_log', FILENAME = N'C:\Users\Mick\ContosoMeAddTable_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ContosoMeAddTable] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContosoMeAddTable].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContosoMeAddTable] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET ARITHABORT OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ContosoMeAddTable] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ContosoMeAddTable] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ContosoMeAddTable] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ContosoMeAddTable] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ContosoMeAddTable] SET  MULTI_USER 
GO
ALTER DATABASE [ContosoMeAddTable] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ContosoMeAddTable] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ContosoMeAddTable] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ContosoMeAddTable] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ContosoMeAddTable] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ContosoMeAddTable]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 11/10/2017 11:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] NOT NULL,
	[Credits] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseAssignment]    Script Date: 11/10/2017 11:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignment](
	[CourseID] [int] NOT NULL,
	[InstructorID] [int] NOT NULL,
 CONSTRAINT [PK_CourseAssignment] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC,
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/10/2017 11:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Budget] [money] NOT NULL,
	[InstructorID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[RowVersion] [timestamp] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 11/10/2017 11:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[EnrollmentID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Grade] [int] NULL,
	[StudentID] [int] NOT NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OfficeAssignment]    Script Date: 11/10/2017 11:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeAssignment](
	[InstructorID] [int] NOT NULL,
	[Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_OfficeAssignment] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 11/10/2017 11:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[HireDate] [datetime2](7) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EnrollmentDate] [datetime2](7) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SchoolBook]    Script Date: 11/10/2017 11:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolBook](
	[SchoolBookID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [money] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Author] [nvarchar](50) NULL,
	[RowVersion] [timestamp] NULL,
 CONSTRAINT [PK_SchoolBook] PRIMARY KEY CLUSTERED 
(
	[SchoolBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_Course_DepartmentID]    Script Date: 11/10/2017 11:03:15 ******/
CREATE NONCLUSTERED INDEX [IX_Course_DepartmentID] ON [dbo].[Course]
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseAssignment_InstructorID]    Script Date: 11/10/2017 11:03:15 ******/
CREATE NONCLUSTERED INDEX [IX_CourseAssignment_InstructorID] ON [dbo].[CourseAssignment]
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Department_InstructorID]    Script Date: 11/10/2017 11:03:15 ******/
CREATE NONCLUSTERED INDEX [IX_Department_InstructorID] ON [dbo].[Department]
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Enrollment_CourseID]    Script Date: 11/10/2017 11:03:15 ******/
CREATE NONCLUSTERED INDEX [IX_Enrollment_CourseID] ON [dbo].[Enrollment]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Enrollment_StudentID]    Script Date: 11/10/2017 11:03:15 ******/
CREATE NONCLUSTERED INDEX [IX_Enrollment_StudentID] ON [dbo].[Enrollment]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT ((1)) FOR [DepartmentID]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT (N'Instructor') FOR [Discriminator]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Department_DepartmentID]
GO
ALTER TABLE [dbo].[CourseAssignment]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignment_Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseAssignment] CHECK CONSTRAINT [FK_CourseAssignment_Course_CourseID]
GO
ALTER TABLE [dbo].[CourseAssignment]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignment_Instructor_InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Person] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseAssignment] CHECK CONSTRAINT [FK_CourseAssignment_Instructor_InstructorID]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Instructor_InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Person] ([ID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Instructor_InstructorID]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Course_CourseID]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Person_StudentID] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Person] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Person_StudentID]
GO
ALTER TABLE [dbo].[OfficeAssignment]  WITH CHECK ADD  CONSTRAINT [FK_OfficeAssignment_Instructor_InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Person] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OfficeAssignment] CHECK CONSTRAINT [FK_OfficeAssignment_Instructor_InstructorID]
GO
USE [master]
GO
ALTER DATABASE [ContosoMeAddTable] SET  READ_WRITE 
GO
