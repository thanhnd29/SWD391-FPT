USE [master]
GO
/****** Object:  Database [Manager_Apartment]    Script Date: 9/19/2023 1:25:19 PM ******/
CREATE DATABASE [Manager_Apartment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Manager_Apartment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Manager_Apartment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Manager_Apartment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Manager_Apartment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Manager_Apartment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Manager_Apartment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Manager_Apartment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Manager_Apartment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Manager_Apartment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Manager_Apartment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Manager_Apartment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Manager_Apartment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Manager_Apartment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Manager_Apartment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Manager_Apartment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Manager_Apartment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Manager_Apartment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Manager_Apartment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Manager_Apartment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Manager_Apartment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Manager_Apartment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Manager_Apartment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Manager_Apartment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Manager_Apartment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Manager_Apartment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Manager_Apartment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Manager_Apartment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Manager_Apartment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Manager_Apartment] SET RECOVERY FULL 
GO
ALTER DATABASE [Manager_Apartment] SET  MULTI_USER 
GO
ALTER DATABASE [Manager_Apartment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Manager_Apartment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Manager_Apartment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Manager_Apartment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Manager_Apartment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Manager_Apartment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Manager_Apartment', N'ON'
GO
ALTER DATABASE [Manager_Apartment] SET QUERY_STORE = OFF
GO
USE [Manager_Apartment]
GO
/****** Object:  Table [dbo].[Apartment]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment](
	[ApartmentID] [int] IDENTITY(1,1) NOT NULL,
	[ApartmentTypeID] [int] NULL,
	[BuildingID] [int] NULL,
	[OwnerID] [int] NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[Sequence] [int] NULL,
	[ApartmentStatus] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApartmentType]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentType](
	[ApartmentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ApartmentTypeName] [varchar](255) NULL,
	[ApartmentTypeDescription] [varchar](255) NULL,
	[ApartmentTypeStatus] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](10) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApartmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset](
	[AssetID] [int] IDENTITY(1,1) NOT NULL,
	[AssetHistoryID] [int] NULL,
	[ApartmentID] [int] NULL,
	[AssetName] [varchar](255) NULL,
	[Quantity] [int] NULL,
	[AssetDescription] [varchar](255) NULL,
	[AssetItemImage] [varchar](255) NULL,
	[AssetStatus] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asset_History]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset_History](
	[AssetHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Description] [varchar](255) NULL,
	[AssetHisQuantity] [int] NULL,
	[AssetHisItemImage] [varchar](255) NULL,
	[AssetHisStatus] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[AssetHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NULL,
	[TotalPrice] [decimal](10, 2) NULL,
	[BillStatus] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[BuildingID] [int] IDENTITY(1,1) NOT NULL,
	[BuildingName] [varchar](255) NULL,
	[BuildingAddress] [varchar](255) NULL,
	[BuildingStatus] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[BuildingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[ApartmentID] [int] NULL,
	[TennantID] [int] NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[ContractImage] [varchar](255) NULL,
	[ContractStatus] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owners]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owners](
	[OwnerID] [int] IDENTITY(1,1) NOT NULL,
	[OwnerName] [varchar](255) NULL,
	[OwnerEmail] [varchar](255) NULL,
	[OwnerPassword] [varchar](255) NULL,
	[OwnerPhone] [varchar](255) NULL,
	[OwnerAddress] [varchar](255) NULL,
	[OwnerStatus] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request_Log]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request_Log](
	[RequestLogID] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NULL,
	[MaintainItem] [varchar](255) NULL,
	[ReqLogDescription] [varchar](255) NULL,
	[RegLogStatus] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[ApartmentID] [int] NULL,
	[ReqDescription] [varchar](255) NULL,
	[BookDateTime] [datetime] NULL,
	[EndDate] [date] NULL,
	[IsSequence] [bit] NULL,
	[Sequence] [int] NULL,
	[ReqStatus] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [int] NOT NULL,
	[ServiceName] [varchar](255) NULL,
	[ServicePrice] [decimal](10, 2) NULL,
	[Unit] [varchar](255) NULL,
	[ServiceStatus] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service_Detail]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_Detail](
	[ServiceDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NULL,
	[RequestID] [int] NULL,
	[SerDeDescription] [varchar](255) NULL,
	[SerDePrice] [decimal](10, 2) NULL,
	[Amount] [int] NULL,
	[ItemBillImage] [varchar](255) NULL,
	[SerDeStatus] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Name] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Password] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[StaffStatus] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff_Log]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff_Log](
	[StaffLogID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NULL,
	[RequestLogID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tennant]    Script Date: 9/19/2023 1:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tennant](
	[TennantID] [int] IDENTITY(1,1) NOT NULL,
	[TennantName] [varchar](255) NULL,
	[TennantEmail] [varchar](255) NULL,
	[TennantPassword] [varchar](255) NULL,
	[TennantStatus] [varchar](255) NULL,
	[TennantPhone] [varchar](255) NULL,
	[TennantAddress] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nchar](30) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[TennantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD FOREIGN KEY([ApartmentTypeID])
REFERENCES [dbo].[ApartmentType] ([ApartmentTypeID])
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Building] ([BuildingID])
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Owners] ([OwnerID])
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD FOREIGN KEY([ApartmentID])
REFERENCES [dbo].[Apartment] ([ApartmentID])
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD FOREIGN KEY([AssetHistoryID])
REFERENCES [dbo].[Asset_History] ([AssetHistoryID])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([RequestID])
REFERENCES [dbo].[Requests] ([RequestID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([ApartmentID])
REFERENCES [dbo].[Apartment] ([ApartmentID])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([TennantID])
REFERENCES [dbo].[Tennant] ([TennantID])
GO
ALTER TABLE [dbo].[Request_Log]  WITH CHECK ADD FOREIGN KEY([RequestID])
REFERENCES [dbo].[Requests] ([RequestID])
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD FOREIGN KEY([ApartmentID])
REFERENCES [dbo].[Apartment] ([ApartmentID])
GO
ALTER TABLE [dbo].[Service_Detail]  WITH CHECK ADD FOREIGN KEY([RequestID])
REFERENCES [dbo].[Requests] ([RequestID])
GO
ALTER TABLE [dbo].[Service_Detail]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[Staff_Log]  WITH CHECK ADD FOREIGN KEY([RequestLogID])
REFERENCES [dbo].[Request_Log] ([RequestLogID])
GO
ALTER TABLE [dbo].[Staff_Log]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
USE [master]
GO
ALTER DATABASE [Manager_Apartment] SET  READ_WRITE 
GO
