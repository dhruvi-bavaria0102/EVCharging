USE [master]
GO
/****** Object:  Database [EVModel]    Script Date: 3/16/2021 12:33:08 PM ******/
CREATE DATABASE [EVModel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EVModel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EVModel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EVModel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EVModel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EVModel] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EVModel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EVModel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EVModel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EVModel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EVModel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EVModel] SET ARITHABORT OFF 
GO
ALTER DATABASE [EVModel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EVModel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EVModel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EVModel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EVModel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EVModel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EVModel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EVModel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EVModel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EVModel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EVModel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EVModel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EVModel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EVModel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EVModel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EVModel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EVModel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EVModel] SET RECOVERY FULL 
GO
ALTER DATABASE [EVModel] SET  MULTI_USER 
GO
ALTER DATABASE [EVModel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EVModel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EVModel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EVModel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EVModel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EVModel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EVModel', N'ON'
GO
ALTER DATABASE [EVModel] SET QUERY_STORE = OFF
GO
USE [EVModel]
GO
/****** Object:  Table [dbo].[BusinessUnits]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessUnits](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessUnitName] [nvarchar](100) NOT NULL,
	[BusinessUnitCode] [nvarchar](20) NULL,
	[CurrencyCode] [nvarchar](10) NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Business__3214EC2783F2CB47] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chargers]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chargers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NULL,
	[ChargerName] [nvarchar](50) NULL,
	[Availability] [nvarchar](300) NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Chargers__3214EC071387CBC0] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Connector Types]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Connector Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConnectorName] [nvarchar](100) NULL,
	[ConnectorStandard] [nvarchar](100) NULL,
	[PowerType] [nvarchar](256) NULL,
	[ConnectorFormate] [nvarchar](256) NULL,
	[ConnectorCategory] [nvarchar](256) NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteDate] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK__Connecto__3214EC0771AB230D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Connectors]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Connectors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChargerId] [int] NULL,
	[LocationId] [int] NULL,
	[ConnectorTypeId] [int] NULL,
	[ConnectorStatus] [nvarchar](50) NULL,
	[SMSCode] [nvarchar](100) NULL,
	[ConnectorUnId] [nvarchar](100) NULL,
	[Tariff] [nvarchar](200) NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteDate] [datetime] NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[SupportMail] [nvarchar](250) NULL,
	[MarketingMail] [nvarchar](100) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[BusinessUnitID] [int] NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[streetAddress] [nvarchar](250) NULL,
	[PostalCode] [nvarchar](20) NULL,
	[City] [nvarchar](80) NULL,
	[Country] [nvarchar](80) NULL,
	[InvoiceStreetAddress] [nvarchar](250) NULL,
	[InvoicePostalCode] [nvarchar](20) NULL,
	[InvoiceCity] [nvarchar](80) NULL,
	[InvoiceCountry] [nvarchar](80) NULL,
	[Site] [nvarchar](max) NULL,
	[Telephone] [nvarchar](50) NULL,
	[RoleId] [nvarchar](50) NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[Password] [nvarchar](100) NULL,
	[resetPasswordCode] [nvarchar](100) NULL,
	[IsEmailverify] [bit] NULL,
	[ConfirmPassword] [nvarchar](100) NULL,
 CONSTRAINT [PK__Customer__3214EC279AF53B47] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Latitude] [numeric](18, 6) NULL,
	[Longitude] [numeric](18, 6) NULL,
	[BusinessUnitName] [nvarchar](60) NULL,
	[CurrencyCode] [nvarchar](50) NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Location__3214EC272729D822] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneNumbers]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneNumbers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TelephoneNumber] [nvarchar](50) NOT NULL,
	[CustomerId] [int] NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RFIDTags]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFIDTags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uid] [nvarchar](100) NOT NULL,
	[Hex] [nvarchar](100) NOT NULL,
	[TagType] [nvarchar](50) NOT NULL,
	[RFIDTagNumber] [nvarchar](50) NOT NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteDate] [datetime] NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [nvarchar](50) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Roles__3214EC27FDF3E015] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](100) NULL,
	[ServiceDescription] [nvarchar](255) NULL,
	[Accepted] [bit] NULL,
	[ServiceStatus] [nvarchar](50) NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteDate] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staticpages]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staticpages](
	[StaticPageId] [int] IDENTITY(1,1) NOT NULL,
	[StaticPageName] [nvarchar](20) NULL,
	[StaticPageContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_Staticpages] PRIMARY KEY CLUSTERED 
(
	[StaticPageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Model] [nvarchar](max) NOT NULL,
	[LicenseId] [nvarchar](max) NOT NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteDate] [datetime] NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Chargers]  WITH CHECK ADD  CONSTRAINT [FK__Chargers__Locati__35BCFE0A] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([ID])
GO
ALTER TABLE [dbo].[Chargers] CHECK CONSTRAINT [FK__Chargers__Locati__35BCFE0A]
GO
ALTER TABLE [dbo].[Connectors]  WITH CHECK ADD  CONSTRAINT [FK__Connector__Charg__36B12243] FOREIGN KEY([ChargerId])
REFERENCES [dbo].[Chargers] ([Id])
GO
ALTER TABLE [dbo].[Connectors] CHECK CONSTRAINT [FK__Connector__Charg__36B12243]
GO
ALTER TABLE [dbo].[Connectors]  WITH CHECK ADD  CONSTRAINT [FK__Connector__Conne__37A5467C] FOREIGN KEY([ConnectorTypeId])
REFERENCES [dbo].[Connector Types] ([Id])
GO
ALTER TABLE [dbo].[Connectors] CHECK CONSTRAINT [FK__Connector__Conne__37A5467C]
GO
ALTER TABLE [dbo].[Connectors]  WITH CHECK ADD  CONSTRAINT [FK__Connector__Locat__38996AB5] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([ID])
GO
ALTER TABLE [dbo].[Connectors] CHECK CONSTRAINT [FK__Connector__Locat__38996AB5]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK__Customers__Busin__398D8EEE] FOREIGN KEY([BusinessUnitID])
REFERENCES [dbo].[BusinessUnits] ([ID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK__Customers__Busin__398D8EEE]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Locations] FOREIGN KEY([ID])
REFERENCES [dbo].[Locations] ([ID])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Locations]
GO
ALTER TABLE [dbo].[PhoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK__PhoneNumb__Custo__3B75D760] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[PhoneNumbers] CHECK CONSTRAINT [FK__PhoneNumb__Custo__3B75D760]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK__Vehicles__Custom__3C69FB99] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK__Vehicles__Custom__3C69FB99]
GO
/****** Object:  StoredProcedure [dbo].[Delete_BusinessUnit]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_BusinessUnit]
(
 
   
	@BusinessUnitName nvarchar(100) ,
	@BusinessUnitCode nvarchar(10) ,
	@CurrencyCode nvarchar(10) ,
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from BusinessUnits

DELETE FROM  
BusinessUnits
WHERE  
ID = @ID END 
 


GO
/****** Object:  StoredProcedure [dbo].[Delete_Charger]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_Charger]
(
 
   
	@LocationID int NULL,
	@Availability nvarchar(300),
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @Id bigint
select @Id=count(Id)+1 from Chargers

DELETE FROM  
Chargers
WHERE  
Id = @Id END 
GO
/****** Object:  StoredProcedure [dbo].[Delete_Connector]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_Connector]
(
 
   
	
	
	@ChargerId int NULL,
	@LocationId int NULL,
	@ConnectorTypeId int NULL,
	@ConnectorStatus nvarchar(50) NULL,
	@SMSCode nvarchar(100) NULL,
	@ConnectorUnId nvarchar(100) NULL,
	@Tariff nvarchar(200) NULL,
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @Id bigint
select @Id=count(Id)+1 from [Connectors]

DELETE FROM  
[Connectors]

WHERE  
Id = @Id END 
GO
/****** Object:  StoredProcedure [dbo].[Delete_Connector Type]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_Connector Type]
(
 
   
	
	@ConnectorName  nvarchar(100) ,
	@ConnectorStandard nvarchar(100) ,
	@PowerType nvarchar(256),
	@ConnectorFormate nvarchar(256) ,
	@ConnectorCategory nvarchar(256) ,
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @Id bigint
select @Id=count(Id)+1 from [Connector Types]

DELETE FROM  
[Connector Types]

WHERE  
Id = @Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Customer]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_Customer]
(
 
   
	
	
	@FirstName nvarchar(100) ,
	@LastName nvarchar(100) ,
	@BusinessUnitID int NULL,
	@EmailAddress nvarchar(100) ,
	@streetAddress nvarchar(250),
	@PostalCode nvarchar(20) ,
	@City nvarchar(80) ,
	@Country nvarchar(80),
	@InvoiceStreetAddress nvarchar(250),
	@InvoicePostalCode nvarchar(20) ,
	@InvoiceCity nvarchar(80),
	@InvoiceCountr nvarchar(80),
	@Site nvarchar (max), 
	@Telephone nvarchar(50) ,
	@RoleId int NULL,
	
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from [Customers]

DELETE FROM  
[Customers]

WHERE  
ID = @ID END 
GO
/****** Object:  StoredProcedure [dbo].[Delete_Location]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_Location]
(
 
   
	
	
	@LocationName nvarchar(max) ,
	@Address nvarchar(max) ,
	@City nvarchar (max),
	@Latitude float  ,
	@Longitude float  ,
	@BusinessUnitName nvarchar (10) ,
	@CurrencyCode nvarchar(10) ,
	
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from [Locations]

DELETE FROM  
[Locations]

WHERE  
ID = @ID END 
GO
/****** Object:  StoredProcedure [dbo].[Delete_PhoneNumber]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_PhoneNumber]
(
 
   
	
	
	@TelephoneNumber nvarchar(50) ,
	@CustomerId int NULL,
	
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from [Locations]

DELETE FROM  
[Locations]

WHERE  
ID = @ID END 
GO
/****** Object:  StoredProcedure [dbo].[Delete_RFIDTag]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_RFIDTag]
(
 
   
	
	
	@Uid  nvarchar(100) ,
	@Hex nvarchar(100) ,
	@TagType nvarchar(50),
	@RFIDTagNumber nvarchar(50) ,
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @Id bigint
select @Id=count(ID)+1 from [RFIDTags]

DELETE FROM  
[RFIDTags]

WHERE  
Id = @Id END 
GO
/****** Object:  StoredProcedure [dbo].[Delete_Role]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_Role]
(
 
   
	
	@RoleName nvarchar(100),
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from [Roles]

DELETE FROM  
[Roles]

WHERE  
ID = @ID END 
 
GO
/****** Object:  StoredProcedure [dbo].[Delete_Vehicle]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_Vehicle]
(
 
   
	
	@CustomerId int NULL,
	@Model nvarchar(max) ,
	@LicenseId nvarchar(max) ,
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @Id bigint
select @Id=count(Id)+1 from [Vehicles]

DELETE FROM  
[Vehicles]

WHERE  
Id = @Id END 
GO
/****** Object:  StoredProcedure [dbo].[Insert_BusinessUnit]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Insert_BusinessUnit]
(
 
   
	@BusinessUnitName nvarchar(100) ,
	@BusinessUnitCode nvarchar(10) ,
	@CurrencyCode nvarchar(10) ,
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from BusinessUnits

insert into BusinessUnits(ID,BusinessUnitName,BusinessUnitCode,CurrencyCode,InsertDate,UpdateDate,DeleteDate,IsDeleted) values( @ID, @BusinessUnitName, @BusinessUnitCode, @CurrencyCode, @InsertDate,@UpdateDate,@DeleteDate,@IsDeleted)  
END 


GO
/****** Object:  StoredProcedure [dbo].[Insert_Charger]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Insert_Charger]
(
 
   
	@LocationID int NULL,
	@Availability nvarchar(300),
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @Id bigint
select @Id=count(Id)+1 from Chargers

INSERT [dbo].[Chargers]([LocationID], [Availability],[InsertDate],[UpdateDate],[DeleteDate])  
                                  VALUES (@LocationID, @Availability,@InsertDate,@UpdateDate,@DeleteDate)  
END 
GO
/****** Object:  StoredProcedure [dbo].[Insert_Connector]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Insert_Connector]
(
 
   
	@ChargerId int NULL,
	@LocationId int NULL,
	@ConnectorTypeId int NULL,
	@ConnectorStatus nvarchar(50) NULL,
	@SMSCode nvarchar(100) NULL,
	@ConnectorUnId nvarchar(100) NULL,
	@Tariff nvarchar(200) NULL,
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @Id bigint
select @Id=count(Id)+1 from [Connectors]

INSERT [dbo].[Connectors]([ChargerId], [LocationId],[ConnectorTypeId],[ConnectorStatus],[SMSCode],[ConnectorUnId],[Tariff],[InsertDate],[UpdateDate],[DeleteDate])  
                                  VALUES (@ChargerId, @LocationId,@ConnectorTypeId,@ConnectorStatus,@SMSCode,@ConnectorUnId,@Tariff,@InsertDate,@UpdateDate,@DeleteDate)
END 
GO
/****** Object:  StoredProcedure [dbo].[Insert_Connector Type]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Insert_Connector Type]
(
 
   
	@ConnectorName  nvarchar(100) ,
	@ConnectorStandard nvarchar(100) ,
	@PowerType nvarchar(256),
	@ConnectorFormate nvarchar(256) ,
	@ConnectorCategory nvarchar(256) ,
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @Id bigint
select @Id=count(Id)+1 from [Connector Types]

INSERT [dbo].[Connector Types]([ConnectorName], [ConnectorStandard], [PowerType],[ConnectorFormate],[ConnectorCategory],[InsertDate],[UpdateDate],[DeleteDate])  
                      VALUES (@ConnectorName, @ConnectorStandard, @PowerType,@ConnectorFormate,@ConnectorCategory,@InsertDate,@UpdateDate,@DeleteDate)
END 
GO
/****** Object:  StoredProcedure [dbo].[Insert_Customer]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Insert_Customer]
(
 
   
	@FirstName nvarchar(100) ,
	@LastName nvarchar(100) ,
	@BusinessUnitID int NULL,
	@EmailAddress nvarchar(100) ,
	@streetAddress nvarchar(250),
	@PostalCode nvarchar(20) ,
	@City nvarchar(80) ,
	@Country nvarchar(80),
	@InvoiceStreetAddress nvarchar(250),
	@InvoicePostalCode nvarchar(20) ,
	@InvoiceCity nvarchar(80),
	@InvoiceCountr nvarchar(80),
	@Site nvarchar (max), 
	@Telephone nvarchar(50) ,
	@RoleId int NULL,
	
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from [Customers]

INSERT [dbo].[Customers]([FirstName], [LastName], [BusinessUnitId],[EmailAddress],[StreetAddress],[PostalCode],[City],[Country],[InvoiceStreetAddress],[InvoicePostalCode],[InvoiceCity],[Site],[Telephone],[RoleId],[InsertDate],[UpdateDate],[DeleteDate])  
                      VALUES (@FirstName, @LastName, @BusinessUnitId,@EmailAddress,@StreetAddress,@PostalCode ,@City,@Country,@InvoiceStreetAddress,@InvoicePostalCode,@InvoiceCity,@Site,@Telephone,@RoleId,@InsertDate,@UpdateDate,@DeleteDate)  
          
END 

GO
/****** Object:  StoredProcedure [dbo].[Insert_Location]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Insert_Location]
(
 
   
	@LocationName nvarchar(max) ,
	@Address nvarchar(max) ,
	@City nvarchar (max),
	@Latitude float  ,
	@Longitude float  ,
	@BusinessUnitName nvarchar (10) ,
	@CurrencyCode nvarchar(10) ,
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from [Locations]

INSERT [dbo].[Locations]([LocationName], [Address], [City],[Latitude],[Longitude],[BusinessUnitName],[InsertDate],[UpdateDate],[DeleteDate])  
                      VALUES (@LocationName, @Address, @City ,@Latitude,@Longitude,@BusinessUnitName,@InsertDate,@UpdateDate,@DeleteDate) 
END 
GO
/****** Object:  StoredProcedure [dbo].[Insert_PhoneNumber]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Insert_PhoneNumber]
(
 
   
	@TelephoneNumber nvarchar(50) ,
	@CustomerId int NULL,
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from [PhoneNumbers]

INSERT [dbo].[PhoneNumbers]([ID],[TelephoneNumber], [CustomerId],[InsertDate],[UpdateDate],[DeleteDate])  
                      VALUES (@ID,@TelephoneNumber, @CustomerId,@InsertDate,@UpdateDate,@DeleteDate)
END 

GO
/****** Object:  StoredProcedure [dbo].[Insert_RFIDTag]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Insert_RFIDTag]
(
 
   
	@Uid  nvarchar(100) ,
	@Hex nvarchar(100) ,
	@TagType nvarchar(50),
	@RFIDTagNumber nvarchar(50) ,
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from [RFIDTags]

INSERT [dbo].[RFIDTags]([Uid], [Hex], [TagType],[RFIDTagNumber],[InsertDate],[UpdateDate],[DeleteDate])  
                      VALUES (@Uid , @Hex, @TagType,@RFIDTagNumber,@InsertDate,@UpdateDate,@DeleteDate)  
                        
END 
GO
/****** Object:  StoredProcedure [dbo].[Insert_Role]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Insert_Role]
(
 
   
	@RoleName nvarchar(100),
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from [Roles]

INSERT [dbo].[Roles]([RoleName],[InsertDate],[UpdateDate],[DeleteDate])  
                      VALUES (@RoleName,@InsertDate,@UpdateDate,@DeleteDate) 
END 
GO
/****** Object:  StoredProcedure [dbo].[Insert_Vehicle]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Insert_Vehicle]
(
 
   
	@CustomerId int NULL,
	@Model nvarchar(max) ,
	@LicenseId nvarchar(max) ,
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @Id bigint
select @Id=count(Id)+1 from [Vehicles]

INSERT [dbo].[Vehicles]([CustomerId], [Model], [LicenseId],[InsertDate],[UpdateDate],[DeleteDate])  
                      VALUES (@CustomerId, @Model,@LicenseId,@InsertDate,@UpdateDate,@DeleteDate)                        
					  
					  
END 
GO
/****** Object:  StoredProcedure [dbo].[Select_BusinessUnits]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_BusinessUnits]
AS
SELECT * FROM BusinessUnits

GO;
GO
/****** Object:  StoredProcedure [dbo].[Select_Chargers]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_Chargers]
AS
SELECT * FROM Chargers

GO;
GO
/****** Object:  StoredProcedure [dbo].[Select_Connector]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_Connector]
AS
SELECT * FROM [Connectors]

GO;
GO
/****** Object:  StoredProcedure [dbo].[Select_ConnectorTypes]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_ConnectorTypes]
AS
SELECT * FROM [Connector Types]

GO;
GO
/****** Object:  StoredProcedure [dbo].[Select_Customer]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_Customer]
AS
SELECT * FROM [Customers]

GO;
GO
/****** Object:  StoredProcedure [dbo].[Select_Location]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_Location]
AS
SELECT * FROM [Locations]

GO;
GO
/****** Object:  StoredProcedure [dbo].[Select_PhoneNumber]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_PhoneNumber]
AS
SELECT * FROM [PhoneNumbers]

GO;
GO
/****** Object:  StoredProcedure [dbo].[Select_RFIDTag]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_RFIDTag]
AS
SELECT * FROM [RFIDTags]

GO;
GO
/****** Object:  StoredProcedure [dbo].[Select_Role]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_Role]
AS
SELECT * FROM [Roles]

GO;
GO
/****** Object:  StoredProcedure [dbo].[Select_Vehicle]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_Vehicle]
AS
SELECT * FROM [Vehicles]

GO;
GO
/****** Object:  StoredProcedure [dbo].[Update_BusinessUnit]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_BusinessUnit]
(
 
   
	@BusinessUnitName nvarchar(100) ,
	@BusinessUnitCode nvarchar(10) ,
	@CurrencyCode nvarchar(10) ,
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from BusinessUnits

UPDATE BusinessUnits SET  
BusinessUnitName = @BusinessUnitName, BusinessUnitCode = @BusinessUnitCode, CurrencyCode = @CurrencyCode,InsertDate=@InsertDate,UpdateDate=@UpdateDate,DeleteDate=@DeleteDate,IsDeleted=@IsDeleted  

WHERE ID = @ID  END 





GO
/****** Object:  StoredProcedure [dbo].[Update_Charger]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_Charger]
(
 
   
	
	@LocationID int NULL,
	@Availability nvarchar(300),
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @Id bigint
select @Id=count(Id)+1 from Chargers

UPDATE [dbo].[Chargers]  
  SET [LocationID]=@LocationID, Availability=@Availability,[InsertDate]=@InsertDate,[UpdateDate]=@UpdateDate,[DeleteDate]=@DeleteDate 
                                            WHERE [Id] = @Id
											END
GO
/****** Object:  StoredProcedure [dbo].[Update_Connector]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_Connector]
(
 
   
	
	@ChargerId int NULL,
	@LocationId int NULL,
	@ConnectorTypeId int NULL,
	@ConnectorStatus nvarchar(50) NULL,
	@SMSCode nvarchar(100) NULL,
	@ConnectorUnId nvarchar(100) NULL,
	@Tariff nvarchar(200) NULL,
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @Id bigint
select @Id=count(Id)+1 from [Connectors]

UPDATE [dbo].[Connectors]  
                                  SET [ChargerId]=@ChargerId,[LocationID]=@LocationID, [ConnectorTypeId]=@ConnectorTypeId,[ConnectorStatus]=@ConnectorStatus,[SMSCode]=@SMSCode,[ConnectorUnId]=@ConnectorUnId,[Tariff]=@Tariff,[InsertDate]=@InsertDate,[UpdateDate]=@UpdateDate,[DeleteDate]=@DeleteDate 
                                            WHERE ([ID] = @ID)
											END
GO
/****** Object:  StoredProcedure [dbo].[Update_Connector Type]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_Connector Type]
(
 
   
	
	@ConnectorName  nvarchar(100) ,
	@ConnectorStandard nvarchar(100) ,
	@PowerType nvarchar(256),
	@ConnectorFormate nvarchar(256) ,
	@ConnectorCategory nvarchar(256) ,
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @Id bigint
select @Id=count(Id)+1 from [Connector Types]

UPDATE [dbo].[Connector Types]  
                      SET [ConnectorName] = @ConnectorName, [ConnectorStandard] = @ConnectorStandard, [PowerType] = @PowerType,[ConnectorFormate]=@ConnectorFormate,[ConnectorCategory]=@ConnectorCategory,[InsertDate]=@InsertDate,[UpdateDate]=@UpdateDate,[DeleteDate]=@DeleteDate 
                                WHERE ([ID] = @ID)
											END
GO
/****** Object:  StoredProcedure [dbo].[Update_Customer]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_Customer]
(
 
   
	

	@FirstName nvarchar(100) ,
	@LastName nvarchar(100) ,
	@BusinessUnitID int NULL,
	@EmailAddress nvarchar(100) ,
	@streetAddress nvarchar(250),
	@PostalCode nvarchar(20) ,
	@City nvarchar(80) ,
	@Country nvarchar(80),
	@InvoiceStreetAddress nvarchar(250),
	@InvoicePostalCode nvarchar(20) ,
	@InvoiceCity nvarchar(80),
	@InvoiceCountr nvarchar(80),
	@Site nvarchar (max), 
	@Telephone nvarchar(50) ,
	@RoleId int NULL,
	
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from [Customers]

UPDATE [dbo].[Customers]  
                      SET [FirstName] = @FirstName, [LastName] = @LastName, [BusinessUnitId] = @BusinessUnitId ,[InsertDate]=@InsertDate,[UpdateDate]=@UpdateDate,[DeleteDate]=@DeleteDate ,[EmailAddress]=@EmailAddress,[StreetAddress]=@StreetAddress,[PostalCode]=@PostalCode,[City]=@City,[Country]=@Country,[InvoiceStreetAddress]=@InvoiceStreetAddress,[InvoicePostalCode]=@InvoicePostalCode,[InvoiceCity]=@InvoiceCity,[Site]=@Site,[Telephone]=@Telephone,[RoleId]=@RoleId
                                WHERE ([ID] = @ID)
											END
GO
/****** Object:  StoredProcedure [dbo].[Update_Location]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_Location]
(
 
   
	

	
	@LocationName nvarchar(max) ,
	@Address nvarchar(max) ,
	@City nvarchar (max),
	@Latitude float  ,
	@Longitude float  ,
	@BusinessUnitName nvarchar (10) ,
	@CurrencyCode nvarchar(10) ,
	
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from [Locations]

UPDATE [dbo].[Locations]  
                      SET[LocationName] = @LocationName,[Address] = @Address, [City] = @City,[Latitude]=@Latitude,[Longitude]=@Longitude,[BusinessUnitName]=@BusinessUnitName,[InsertDate]=@InsertDate,[UpdateDate]=@UpdateDate,[DeleteDate]=@DeleteDate 
                                WHERE ([ID] = @ID)
											END
GO
/****** Object:  StoredProcedure [dbo].[Update_PhoneNumber]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_PhoneNumber]
(
 
   
	

	
	@TelephoneNumber nvarchar(50) ,
	@CustomerId int NULL,
	
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from [PhoneNumbers]

UPDATE [dbo].[PhoneNumbers]  
                      SET [TelephoneNumber] = @TelephoneNumber, [CustomerId] = @CustomerId,[InsertDate]=@InsertDate,[UpdateDate]=@UpdateDate,[DeleteDate]=@DeleteDate 
                                WHERE ([ID] = @ID)
											END
GO
/****** Object:  StoredProcedure [dbo].[Update_RFIDTag]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_RFIDTag]
(
 
   
	

	
	
	@Uid  nvarchar(100) ,
	@Hex nvarchar(100) ,
	@TagType nvarchar(50),
	@RFIDTagNumber nvarchar(50) ,
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @Id bigint
select @Id=count(Id)+1 from [RFIDTags]

UPDATE [dbo].[RFIDTags]  
                      SET [Uid] = @Uid, [Hex] = @Hex , [TagType] = @TagType,[RFIDTagNumber]=@RFIDTagNumber,[InsertDate]=@InsertDate,[UpdateDate]=@UpdateDate,[DeleteDate]=@DeleteDate 
                                WHERE ([ID] = @ID)
											END
GO
/****** Object:  StoredProcedure [dbo].[Update_Role]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_Role]
(
 
   
	
	@RoleName nvarchar(100),
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @ID bigint
select @ID=count(ID)+1 from [Roles]

UPDATE [dbo].[Roles]  
                      SET [RoleName] = @RoleName,[InsertDate]=@InsertDate,[UpdateDate]=@UpdateDate,[DeleteDate]=@DeleteDate 
                                WHERE ([ID] = @ID)
											END
GO
/****** Object:  StoredProcedure [dbo].[Update_Vehicle]    Script Date: 3/16/2021 12:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_Vehicle]
(
 
   
	
	@CustomerId int NULL,
	@Model nvarchar(max) ,
	@LicenseId nvarchar(max) ,
	
	@InsertDate datetime NULL,
	@UpdateDate datetime NULL,
	@DeleteDate datetime NULL,
	@IsDeleted bit NULL
	)
 
AS  
 BEGIN  
  declare @Id bigint
select @Id=count(Id)+1 from [Vehicles]

UPDATE [dbo].[Vehicles]  
                      SET[CustomerId] = @CustomerId,[Model] = @Model, [LicenseId] = @LicenseId,[InsertDate]=@InsertDate,[UpdateDate]=@UpdateDate,[DeleteDate]=@DeleteDate 
                                WHERE ([Id] = @Id)
											END
GO
USE [master]
GO
ALTER DATABASE [EVModel] SET  READ_WRITE 
GO
