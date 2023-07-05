USE [master]
GO
/****** Object:  Database [Session2_22]    Script Date: 05.07.2023 12:33:46 ******/
CREATE DATABASE [Session2_22]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Session2_22', FILENAME = N'E:\Программы\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Session2_22.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Session2_22_log', FILENAME = N'E:\Программы\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Session2_22_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Session2_22] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Session2_22].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Session2_22] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Session2_22] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Session2_22] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Session2_22] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Session2_22] SET ARITHABORT OFF 
GO
ALTER DATABASE [Session2_22] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Session2_22] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Session2_22] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Session2_22] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Session2_22] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Session2_22] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Session2_22] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Session2_22] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Session2_22] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Session2_22] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Session2_22] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Session2_22] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Session2_22] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Session2_22] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Session2_22] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Session2_22] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Session2_22] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Session2_22] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Session2_22] SET  MULTI_USER 
GO
ALTER DATABASE [Session2_22] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Session2_22] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Session2_22] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Session2_22] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Session2_22] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Session2_22] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Session2_22] SET QUERY_STORE = OFF
GO
USE [Session2_22]
GO
/****** Object:  Table [dbo].[Aircrafts]    Script Date: 05.07.2023 12:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aircrafts](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MakeModel] [nvarchar](10) NULL,
	[TotalSeats] [int] NOT NULL,
	[EconomySeats] [int] NOT NULL,
	[BusinessSeats] [int] NOT NULL,
 CONSTRAINT [PK_AirPlan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airports]    Script Date: 05.07.2023 12:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[IATACode] [varchar](3) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_AirPort] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 05.07.2023 12:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offices]    Script Date: 05.07.2023 12:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 05.07.2023 12:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 05.07.2023 12:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartureAirportID] [int] NOT NULL,
	[ArrivalAirportID] [int] NOT NULL,
	[Distance] [int] NOT NULL,
	[FlightTime] [int] NOT NULL,
 CONSTRAINT [PK_Routes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 05.07.2023 12:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](5) NOT NULL,
	[AircraftID] [int] NOT NULL,
	[RouteID] [int] NOT NULL,
	[EconomyPrice] [money] NOT NULL,
	[Confirmed] [bit] NOT NULL,
	[FlightNumber] [nvarchar](10) NULL,
 CONSTRAINT [PK_Serivec] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05.07.2023 12:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[OfficeID] [int] NULL,
	[Birthdate] [date] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Aircrafts] ([ID], [Name], [MakeModel], [TotalSeats], [EconomySeats], [BusinessSeats]) VALUES (1, N'Boeing 738', N'B738-1950', 176, 162, 12)
INSERT [dbo].[Aircrafts] ([ID], [Name], [MakeModel], [TotalSeats], [EconomySeats], [BusinessSeats]) VALUES (2, N'Boeing 739', N'B739-1954', 169, 96, 51)
GO
SET IDENTITY_INSERT [dbo].[Airports] ON 

INSERT [dbo].[Airports] ([ID], [CountryID], [IATACode], [Name]) VALUES (2, 185, N'AUH', N'Abu Dhabi')
INSERT [dbo].[Airports] ([ID], [CountryID], [IATACode], [Name]) VALUES (3, 52, N'CAI', N'Cairo')
INSERT [dbo].[Airports] ([ID], [CountryID], [IATACode], [Name]) VALUES (4, 13, N'BAH', N'Bahrain')
INSERT [dbo].[Airports] ([ID], [CountryID], [IATACode], [Name]) VALUES (5, 194, N'ADE', N'Aden')
INSERT [dbo].[Airports] ([ID], [CountryID], [IATACode], [Name]) VALUES (6, 142, N'DOH', N'Doha')
INSERT [dbo].[Airports] ([ID], [CountryID], [IATACode], [Name]) VALUES (7, 152, N'RUH', N'Riyadh')
SET IDENTITY_INSERT [dbo].[Airports] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([ID], [Name]) VALUES (1, N'Afghanistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (2, N'Albania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (3, N'Algeria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (4, N'Andorra')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (5, N'Angola')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (6, N'Antigua & Deps')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (7, N'Argentina')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (8, N'Armenia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (9, N'Australia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (10, N'Austria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (11, N'Azerbaijan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (12, N'Bahamas')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (13, N'Bahrain')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (14, N'Bangladesh')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (15, N'Barbados')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (16, N'Belarus')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (17, N'Belgium')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (18, N'Belize')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (19, N'Benin')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (20, N'Bhutan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (21, N'Bolivia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (22, N'Bosnia Herzegovina')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (23, N'Botswana')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (24, N'Brazil')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (25, N'Brunei')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (26, N'Bulgaria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (27, N'Burkina')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (28, N'Burundi')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (29, N'Cambodia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (30, N'Cameroon')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (31, N'Canada')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (32, N'Cape Verde')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (33, N'Central African Rep')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (34, N'Chad')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (35, N'Chile')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (36, N'China')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (37, N'Colombia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (38, N'Comoros')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (39, N'Congo')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (40, N'Congo {Democratic Rep}')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (41, N'Costa Rica')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (42, N'Croatia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (43, N'Cuba')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (44, N'Cyprus')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (45, N'Czech Republic')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (46, N'Denmark')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (47, N'Djibouti')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (48, N'Dominica')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (49, N'Dominican Republic')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (50, N'East Timor')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (51, N'Ecuador')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (52, N'Egypt')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (53, N'El Salvador')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (54, N'Equatorial Guinea')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (55, N'Eritrea')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (56, N'Estonia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (57, N'Ethiopia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (58, N'Fiji')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (59, N'Finland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (60, N'France')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (61, N'Gabon')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (62, N'Gambia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (63, N'Georgia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (64, N'Germany')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (65, N'Ghana')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (66, N'Greece')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (67, N'Grenada')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (68, N'Guatemala')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (69, N'Guinea')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (70, N'Guinea-Bissau')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (71, N'Guyana')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (72, N'Haiti')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (73, N'Honduras')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (74, N'Hungary')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (75, N'Iceland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (76, N'India')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (77, N'Indonesia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (78, N'Iran')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (79, N'Iraq')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (80, N'Ireland {Republic}')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (81, N'Israel')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (82, N'Italy')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (83, N'Ivory Coast')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (84, N'Jamaica')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (85, N'Japan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (86, N'Jordan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (87, N'Kazakhstan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (88, N'Kenya')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (89, N'Kiribati')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (90, N'Korea North')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (91, N'Korea South')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (92, N'Kosovo')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (93, N'Kuwait')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (94, N'Kyrgyzstan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (95, N'Laos')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (96, N'Latvia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (97, N'Lebanon')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (98, N'Lesotho')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (99, N'Liberia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (100, N'Libya')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (101, N'Liechtenstein')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (102, N'Lithuania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (103, N'Luxembourg')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (104, N'Macedonia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (105, N'Madagascar')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (106, N'Malawi')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (107, N'Malaysia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (108, N'Maldives')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (109, N'Mali')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (110, N'Malta')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (111, N'Marshall Islands')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (112, N'Mauritania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (113, N'Mauritius')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (114, N'Mexico')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (115, N'Micronesia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (116, N'Moldova')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (117, N'Monaco')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (118, N'Mongolia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (119, N'Montenegro')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (120, N'Morocco')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (121, N'Mozambique')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (122, N'Myanmar, {Burma}')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (123, N'Namibia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (124, N'Nauru')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (125, N'Nepal')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (126, N'Netherlands')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (127, N'New Zealand')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (128, N'Nicaragua')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (129, N'Niger')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (130, N'Nigeria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (131, N'Norway')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (132, N'Oman')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (133, N'Pakistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (134, N'Palau')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (135, N'Panama')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (136, N'Papua New Guinea')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (137, N'Paraguay')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (138, N'Peru')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (139, N'Philippines')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (140, N'Poland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (141, N'Portugal')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (142, N'Qatar')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (143, N'Romania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (144, N'Russian Federation')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (145, N'Rwanda')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (146, N'St Kitts & Nevis')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (147, N'St Lucia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (148, N'Saint Vincent & the Grenadines')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (149, N'Samoa')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (150, N'San Marino')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (151, N'Sao Tome & Principe')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (152, N'Saudi Arabia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (153, N'Senegal')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (154, N'Serbia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (155, N'Seychelles')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (156, N'Sierra Leone')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (157, N'Singapore')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (158, N'Slovakia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (159, N'Slovenia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (160, N'Solomon Islands')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (161, N'Somalia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (162, N'South Africa')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (163, N'South Sudan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (164, N'Spain')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (165, N'Sri Lanka')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (166, N'Sudan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (167, N'Suriname')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (168, N'Swaziland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (169, N'Sweden')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (170, N'Switzerland')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (171, N'Syria')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (172, N'Taiwan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (173, N'Tajikistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (174, N'Tanzania')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (175, N'Thailand')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (176, N'Togo')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (177, N'Tonga')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (178, N'Trinidad & Tobago')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (179, N'Tunisia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (180, N'Turkey')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (181, N'Turkmenistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (182, N'Tuvalu')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (183, N'Uganda')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (184, N'Ukraine')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (185, N'United Arab Emirates')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (186, N'United Kingdom')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (187, N'United States')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (188, N'Uruguay')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (189, N'Uzbekistan')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (190, N'Vanuatu')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (191, N'Vatican City')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (192, N'Venezuela')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (193, N'Vietnam')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (194, N'Yemen')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (195, N'Zambia')
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (196, N'Zimbabwe')
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Offices] ON 

INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (1, 185, N'Abu dhabi', N'638-757-8582
', N'MIchael Malki')
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (3, 52, N'Cairo', N'252-224-8525', N'David Johns')
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (4, 13, N'Bahrain', N'542-227-5825', N'Katie Ballmer')
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (5, 142, N'Doha', N'758-278-9597', N'Ariel Levy')
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (6, 152, N'Riyadh', N'285-285-1474', N'Andrew Hobart')
SET IDENTITY_INSERT [dbo].[Offices] OFF
GO
INSERT [dbo].[Roles] ([ID], [Title]) VALUES (1, N'Administrator')
INSERT [dbo].[Roles] ([ID], [Title]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Routes] ON 

INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (1, 2, 4, 453, 64)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (2, 4, 2, 455, 69)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (3, 2, 5, 1636, 152)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (5, 5, 2, 1632, 150)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (6, 2, 7, 807, 90)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (7, 7, 2, 810, 89)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (8, 2, 6, 325, 54)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (9, 6, 2, 325, 54)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (10, 6, 3, 2057, 183)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (11, 3, 6, 2050, 177)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (12, 2, 3, 2381, 264)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (13, 3, 2, 2385, 274)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (14, 2, 3, 2381, 208)
INSERT [dbo].[Routes] ([ID], [DepartureAirportID], [ArrivalAirportID], [Distance], [FlightTime]) VALUES (15, 3, 2, 2381, 211)
SET IDENTITY_INSERT [dbo].[Routes] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1227, CAST(N'2017-10-04' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 983.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1228, CAST(N'2017-10-04' AS Date), CAST(N'09:20:00' AS Time), 1, 7, 998.0000, 1, N'76')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1229, CAST(N'2017-10-06' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 850.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1230, CAST(N'2017-10-06' AS Date), CAST(N'09:20:00' AS Time), 1, 7, 902.0000, 1, N'76')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1231, CAST(N'2017-10-08' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 939.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1232, CAST(N'2017-10-10' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 837.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1233, CAST(N'2017-10-10' AS Date), CAST(N'09:20:00' AS Time), 1, 7, 948.0000, 1, N'76')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1234, CAST(N'2017-10-12' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 926.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1235, CAST(N'2017-10-12' AS Date), CAST(N'09:20:00' AS Time), 1, 7, 973.0000, 1, N'76')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1236, CAST(N'2017-10-14' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 838.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1237, CAST(N'2017-10-14' AS Date), CAST(N'09:20:00' AS Time), 1, 7, 880.0000, 1, N'76')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1238, CAST(N'2017-10-16' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 762.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1239, CAST(N'2017-10-16' AS Date), CAST(N'09:20:00' AS Time), 1, 7, 892.0000, 1, N'76')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1240, CAST(N'2017-10-18' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 781.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1241, CAST(N'2017-10-18' AS Date), CAST(N'09:20:00' AS Time), 1, 7, 1028.0000, 1, N'76')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1242, CAST(N'2017-10-20' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 865.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1243, CAST(N'2017-10-20' AS Date), CAST(N'09:20:00' AS Time), 1, 7, 1009.0000, 1, N'76')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1244, CAST(N'2017-10-22' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 1052.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1245, CAST(N'2017-10-18' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 781.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1246, CAST(N'2017-10-22' AS Date), CAST(N'09:20:00' AS Time), 1, 7, 830.0000, 1, N'76')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1247, CAST(N'2017-10-24' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 785.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1248, CAST(N'2017-10-24' AS Date), CAST(N'09:20:00' AS Time), 1, 7, 1006.0000, 1, N'76')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1249, CAST(N'2017-10-26' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 816.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1250, CAST(N'2017-10-26' AS Date), CAST(N'09:20:00' AS Time), 1, 7, 773.0000, 1, N'76')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1251, CAST(N'2017-10-28' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 811.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1252, CAST(N'2017-10-28' AS Date), CAST(N'09:20:00' AS Time), 1, 7, 779.0000, 1, N'76')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1253, CAST(N'2017-10-04' AS Date), CAST(N'04:55:00' AS Time), 2, 8, 313.0000, 1, N'89')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1254, CAST(N'2017-10-04' AS Date), CAST(N'06:15:00' AS Time), 2, 10, 2283.0000, 1, N'90')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1255, CAST(N'2017-10-04' AS Date), CAST(N'11:50:00' AS Time), 2, 11, 2037.0000, 1, N'91')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1256, CAST(N'2017-10-04' AS Date), CAST(N'15:40:00' AS Time), 2, 9, 329.0000, 1, N'92')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1257, CAST(N'2017-10-11' AS Date), CAST(N'04:55:00' AS Time), 2, 8, 334.0000, 1, N'89')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1258, CAST(N'2017-10-11' AS Date), CAST(N'06:15:00' AS Time), 2, 10, 2268.0000, 1, N'90')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1259, CAST(N'2017-10-11' AS Date), CAST(N'11:50:00' AS Time), 2, 11, 2090.0000, 1, N'91')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1260, CAST(N'2017-10-11' AS Date), CAST(N'15:40:00' AS Time), 2, 9, 508.0000, 1, N'92')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1261, CAST(N'2017-10-18' AS Date), CAST(N'04:55:00' AS Time), 2, 8, 347.0000, 1, N'89')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1262, CAST(N'2017-10-18' AS Date), CAST(N'06:25:00' AS Time), 1, 6, 781.0000, 1, N'75')
INSERT [dbo].[Schedules] ([ID], [Date], [Time], [AircraftID], [RouteID], [EconomyPrice], [Confirmed], [FlightNumber]) VALUES (1263, CAST(N'2017-10-04' AS Date), CAST(N'09:20:00' AS Time), 1, 7, 998.0000, 1, N'76')
SET IDENTITY_INSERT [dbo].[Schedules] OFF
GO
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (1, 1, N'j.doe@amonic.com', N'123', N'John', N'Doe', 1, CAST(N'1983-01-13' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (2, 2, N'k.omar@amonic.com', N'4258', N'Karim', N'Omar', 1, CAST(N'1980-03-19' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (3, 2, N'h.saeed@amonic.com', N'2020', N'Hannan', N'Saeed', 3, CAST(N'1989-12-20' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (4, 2, N'a.hobart@amonic.com', N'6996', N'Andrew', N'Hobart', 6, CAST(N'1990-01-30' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (5, 2, N'k.anderson@amonic.com', N'4570', N'Katrin', N'Anderson', 5, CAST(N'1992-11-10' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (6, 2, N'h.wyrick@amonic.com', N'1199', N'Hava', N'Wyrick', 1, CAST(N'1988-08-08' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (7, 2, N'marie.horn@amonic.com', N'55555', N'Marie', N'Horn', 4, CAST(N'1981-04-06' AS Date), 1)
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (8, 2, N'm.osteen@amonic.com', N'9800', N'Milagros', N'Osteen', 1, CAST(N'1991-02-03' AS Date), 1)
GO
ALTER TABLE [dbo].[Airports]  WITH CHECK ADD  CONSTRAINT [FK_AirPort_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([ID])
GO
ALTER TABLE [dbo].[Airports] CHECK CONSTRAINT [FK_AirPort_Country]
GO
ALTER TABLE [dbo].[Offices]  WITH CHECK ADD  CONSTRAINT [FK_Office_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([ID])
GO
ALTER TABLE [dbo].[Offices] CHECK CONSTRAINT [FK_Office_Country]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Airports2] FOREIGN KEY([DepartureAirportID])
REFERENCES [dbo].[Airports] ([ID])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Airports2]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Airports3] FOREIGN KEY([ArrivalAirportID])
REFERENCES [dbo].[Airports] ([ID])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Airports3]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_AirCraft] FOREIGN KEY([AircraftID])
REFERENCES [dbo].[Aircrafts] ([ID])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedule_AirCraft]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([ID])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedule_Routes]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Offices] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[Offices] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Offices]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [Session2_22] SET  READ_WRITE 
GO
