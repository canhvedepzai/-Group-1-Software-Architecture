USE [master]
GO
/****** Object:  Database [ComicNow]    Script Date: 3/13/2018 11:17:48 AM ******/
CREATE DATABASE [ComicNow]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ComicNow', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ComicNow.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ComicNow_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ComicNow_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ComicNow] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ComicNow].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ComicNow] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ComicNow] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ComicNow] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ComicNow] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ComicNow] SET ARITHABORT OFF 
GO
ALTER DATABASE [ComicNow] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ComicNow] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ComicNow] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ComicNow] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ComicNow] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ComicNow] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ComicNow] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ComicNow] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ComicNow] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ComicNow] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ComicNow] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ComicNow] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ComicNow] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ComicNow] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ComicNow] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ComicNow] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ComicNow] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ComicNow] SET RECOVERY FULL 
GO
ALTER DATABASE [ComicNow] SET  MULTI_USER 
GO
ALTER DATABASE [ComicNow] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ComicNow] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ComicNow] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ComicNow] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ComicNow] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ComicNow', N'ON'
GO
ALTER DATABASE [ComicNow] SET QUERY_STORE = OFF
GO
USE [ComicNow]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ComicNow]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 3/13/2018 11:17:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Author_Comic_List]    Script Date: 3/13/2018 11:17:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author_Comic_List](
	[AuthorId] [int] NOT NULL,
	[ComicId] [int] NOT NULL,
 CONSTRAINT [PK_Author_Comic_List] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC,
	[ComicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 3/13/2018 11:17:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapters]    Script Date: 3/13/2018 11:17:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ComicId] [int] NULL,
	[Name] [nvarchar](500) NOT NULL,
	[PublishingDate] [datetime] NOT NULL,
	[OrderNumber] [float] NOT NULL,
	[PageNumber] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Issues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comic]    Script Date: 3/13/2018 11:17:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comic](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[OtherName] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[PublisherId] [int] NOT NULL,
	[ChapterNumber] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[Rating] [float] NOT NULL,
	[TimeRated] [int] NOT NULL,
	[Views] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ThumbnailUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Series] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 3/13/2018 11:17:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ComicId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[Text] [nvarchar](500) NOT NULL,
	[Date] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteList]    Script Date: 3/13/2018 11:17:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteList](
	[AccountId] [int] NOT NULL,
	[ComicId] [int] NOT NULL,
 CONSTRAINT [PK_FavoriteList] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC,
	[ComicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 3/13/2018 11:17:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ComicId] [int] NULL,
	[ChapterId] [int] NULL,
	[FileName] [nvarchar](500) NOT NULL,
	[URL] [nvarchar](max) NOT NULL,
	[PageNumber] [int] NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 3/13/2018 11:17:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RatingList]    Script Date: 3/13/2018 11:17:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RatingList](
	[AccountId] [int] NOT NULL,
	[ComicId] [int] NOT NULL,
	[Rating] [float] NOT NULL,
 CONSTRAINT [PK_RatingList] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC,
	[ComicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/13/2018 11:17:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] NOT NULL,
	[RoleName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagList]    Script Date: 3/13/2018 11:17:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagList](
	[ComicId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_TagList] PRIMARY KEY CLUSTERED 
(
	[ComicId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 3/13/2018 11:17:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [Username], [Password], [Email], [RoleId], [IsActive]) VALUES (5, N'batman', N'123', N'tphan2883@gmail.com', 1, 1)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [Email], [RoleId], [IsActive]) VALUES (6, N'tri', N'123', N'tphan2883@gmail.com', 2, 1)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [Email], [RoleId], [IsActive]) VALUES (10, N'batman123423', N'123', N'tphan2883@gmail.com', 2, 1)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id], [Name]) VALUES (1, N'Jim Lee')
SET IDENTITY_INSERT [dbo].[Authors] OFF
SET IDENTITY_INSERT [dbo].[Publishers] ON 

INSERT [dbo].[Publishers] ([Id], [Name]) VALUES (1, N'DC Comics')
SET IDENTITY_INSERT [dbo].[Publishers] OFF
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (2, N'User')
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Username]    Script Date: 3/13/2018 11:17:53 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_Username] ON [dbo].[Accounts]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Publisher]    Script Date: 3/13/2018 11:17:53 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_Publisher] ON [dbo].[Publishers]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Tags]    Script Date: 3/13/2018 11:17:53 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_Tags] ON [dbo].[Tags]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
ALTER TABLE [dbo].[Author_Comic_List]  WITH CHECK ADD  CONSTRAINT [FK_Author_Comic_List_Authors] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[Author_Comic_List] CHECK CONSTRAINT [FK_Author_Comic_List_Authors]
GO
ALTER TABLE [dbo].[Author_Comic_List]  WITH CHECK ADD  CONSTRAINT [FK_Author_Comic_List_Comic] FOREIGN KEY([ComicId])
REFERENCES [dbo].[Comic] ([Id])
GO
ALTER TABLE [dbo].[Author_Comic_List] CHECK CONSTRAINT [FK_Author_Comic_List_Comic]
GO
ALTER TABLE [dbo].[Chapters]  WITH CHECK ADD  CONSTRAINT [FK_Chapters_Comic] FOREIGN KEY([ComicId])
REFERENCES [dbo].[Comic] ([Id])
GO
ALTER TABLE [dbo].[Chapters] CHECK CONSTRAINT [FK_Chapters_Comic]
GO
ALTER TABLE [dbo].[Comic]  WITH CHECK ADD  CONSTRAINT [FK_Comic_Publishers] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publishers] ([Id])
GO
ALTER TABLE [dbo].[Comic] CHECK CONSTRAINT [FK_Comic_Publishers]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Accounts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Comic] FOREIGN KEY([ComicId])
REFERENCES [dbo].[Comic] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Comic]
GO
ALTER TABLE [dbo].[FavoriteList]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteList_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[FavoriteList] CHECK CONSTRAINT [FK_FavoriteList_Accounts]
GO
ALTER TABLE [dbo].[FavoriteList]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteList_Comic] FOREIGN KEY([ComicId])
REFERENCES [dbo].[Comic] ([Id])
GO
ALTER TABLE [dbo].[FavoriteList] CHECK CONSTRAINT [FK_FavoriteList_Comic]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_Chapters] FOREIGN KEY([ChapterId])
REFERENCES [dbo].[Chapters] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_Chapters]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_Comic] FOREIGN KEY([ComicId])
REFERENCES [dbo].[Comic] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_Comic]
GO
ALTER TABLE [dbo].[RatingList]  WITH CHECK ADD  CONSTRAINT [FK_RatingList_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[RatingList] CHECK CONSTRAINT [FK_RatingList_Accounts]
GO
ALTER TABLE [dbo].[RatingList]  WITH CHECK ADD  CONSTRAINT [FK_RatingList_Comic] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Comic] ([Id])
GO
ALTER TABLE [dbo].[RatingList] CHECK CONSTRAINT [FK_RatingList_Comic]
GO
ALTER TABLE [dbo].[TagList]  WITH CHECK ADD  CONSTRAINT [FK_TagList_Comic] FOREIGN KEY([ComicId])
REFERENCES [dbo].[Comic] ([Id])
GO
ALTER TABLE [dbo].[TagList] CHECK CONSTRAINT [FK_TagList_Comic]
GO
ALTER TABLE [dbo].[TagList]  WITH CHECK ADD  CONSTRAINT [FK_TagList_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[TagList] CHECK CONSTRAINT [FK_TagList_Tags]
GO
USE [master]
GO
ALTER DATABASE [ComicNow] SET  READ_WRITE 
GO
