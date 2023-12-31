USE [master]
GO
/****** Object:  Database [YourSafePlace]    Script Date: 08/11/2023 19:44:03 ******/
CREATE DATABASE [YourSafePlace]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YourSafePlace', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\YourSafePlace.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YourSafePlace_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\YourSafePlace_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [YourSafePlace] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YourSafePlace].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YourSafePlace] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YourSafePlace] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YourSafePlace] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YourSafePlace] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YourSafePlace] SET ARITHABORT OFF 
GO
ALTER DATABASE [YourSafePlace] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [YourSafePlace] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YourSafePlace] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YourSafePlace] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YourSafePlace] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YourSafePlace] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YourSafePlace] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YourSafePlace] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YourSafePlace] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YourSafePlace] SET  ENABLE_BROKER 
GO
ALTER DATABASE [YourSafePlace] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YourSafePlace] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YourSafePlace] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YourSafePlace] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YourSafePlace] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YourSafePlace] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [YourSafePlace] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YourSafePlace] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [YourSafePlace] SET  MULTI_USER 
GO
ALTER DATABASE [YourSafePlace] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YourSafePlace] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YourSafePlace] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YourSafePlace] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YourSafePlace] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YourSafePlace] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [YourSafePlace] SET QUERY_STORE = ON
GO
ALTER DATABASE [YourSafePlace] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [YourSafePlace]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 08/11/2023 19:44:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrecoVigente]    Script Date: 08/11/2023 19:44:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrecoVigente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataInicial] [datetime2](7) NOT NULL,
	[DataFinal] [datetime2](7) NOT NULL,
	[ValorPrimeiraHora] [decimal](18, 2) NOT NULL,
	[ValorHoraAdicional] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_PrecoVigente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Veiculos]    Script Date: 08/11/2023 19:44:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Veiculos](
	[Placa] [nvarchar](450) NOT NULL,
	[DataEntrada] [datetime2](7) NOT NULL,
	[DataSaida] [datetime2](7) NULL,
 CONSTRAINT [PK_Veiculos] PRIMARY KEY CLUSTERED 
(
	[Placa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231107010246_inicial', N'7.0.13')
GO
SET IDENTITY_INSERT [dbo].[PrecoVigente] ON 

INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (20, CAST(N'2015-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2015-07-01T00:00:00.0000000' AS DateTime2), CAST(9.17 AS Decimal(18, 2)), CAST(6.42 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (21, CAST(N'2015-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2016-01-01T00:00:00.0000000' AS DateTime2), CAST(8.22 AS Decimal(18, 2)), CAST(5.75 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (22, CAST(N'2016-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2016-07-01T00:00:00.0000000' AS DateTime2), CAST(9.29 AS Decimal(18, 2)), CAST(6.50 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (23, CAST(N'2016-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2017-01-01T00:00:00.0000000' AS DateTime2), CAST(4.28 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (24, CAST(N'2017-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2017-07-01T00:00:00.0000000' AS DateTime2), CAST(1.94 AS Decimal(18, 2)), CAST(1.36 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (25, CAST(N'2017-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2018-01-01T00:00:00.0000000' AS DateTime2), CAST(3.47 AS Decimal(18, 2)), CAST(2.43 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (26, CAST(N'2018-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2018-07-01T00:00:00.0000000' AS DateTime2), CAST(3.10 AS Decimal(18, 2)), CAST(2.17 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (27, CAST(N'2018-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2), CAST(4.32 AS Decimal(18, 2)), CAST(3.02 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (28, CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-07-01T00:00:00.0000000' AS DateTime2), CAST(2.75 AS Decimal(18, 2)), CAST(1.93 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (29, CAST(N'2019-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), CAST(1.85 AS Decimal(18, 2)), CAST(1.30 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (30, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), CAST(3.36 AS Decimal(18, 2)), CAST(2.35 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (31, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(9.27 AS Decimal(18, 2)), CAST(6.49 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (32, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-07-01T00:00:00.0000000' AS DateTime2), CAST(4.30 AS Decimal(18, 2)), CAST(3.01 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (33, CAST(N'2021-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2), CAST(0.82 AS Decimal(18, 2)), CAST(0.57 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (34, CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), CAST(2.19 AS Decimal(18, 2)), CAST(1.53 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (35, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), CAST(8.93 AS Decimal(18, 2)), CAST(6.25 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (36, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-07-01T00:00:00.0000000' AS DateTime2), CAST(8.06 AS Decimal(18, 2)), CAST(5.64 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (37, CAST(N'2023-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), CAST(6.46 AS Decimal(18, 2)), CAST(4.52 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (38, CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), CAST(9.80 AS Decimal(18, 2)), CAST(6.86 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (39, CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-01T00:00:00.0000000' AS DateTime2), CAST(7.98 AS Decimal(18, 2)), CAST(5.59 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (40, CAST(N'2015-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2015-07-01T00:00:00.0000000' AS DateTime2), CAST(4.52 AS Decimal(18, 2)), CAST(3.16 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (41, CAST(N'2015-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2016-01-01T00:00:00.0000000' AS DateTime2), CAST(3.89 AS Decimal(18, 2)), CAST(2.72 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (42, CAST(N'2016-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2016-07-01T00:00:00.0000000' AS DateTime2), CAST(3.15 AS Decimal(18, 2)), CAST(2.21 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (43, CAST(N'2016-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2017-01-01T00:00:00.0000000' AS DateTime2), CAST(2.15 AS Decimal(18, 2)), CAST(1.51 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (44, CAST(N'2017-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2017-07-01T00:00:00.0000000' AS DateTime2), CAST(1.63 AS Decimal(18, 2)), CAST(1.14 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (45, CAST(N'2017-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2018-01-01T00:00:00.0000000' AS DateTime2), CAST(2.33 AS Decimal(18, 2)), CAST(1.63 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (46, CAST(N'2018-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2018-07-01T00:00:00.0000000' AS DateTime2), CAST(3.38 AS Decimal(18, 2)), CAST(2.37 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (47, CAST(N'2018-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2), CAST(5.79 AS Decimal(18, 2)), CAST(4.05 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (48, CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-07-01T00:00:00.0000000' AS DateTime2), CAST(9.40 AS Decimal(18, 2)), CAST(6.58 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (49, CAST(N'2019-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), CAST(8.70 AS Decimal(18, 2)), CAST(6.09 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (50, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), CAST(0.41 AS Decimal(18, 2)), CAST(0.29 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (51, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(8.49 AS Decimal(18, 2)), CAST(5.94 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (52, CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-07-01T00:00:00.0000000' AS DateTime2), CAST(7.36 AS Decimal(18, 2)), CAST(5.15 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (53, CAST(N'2021-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2), CAST(1.56 AS Decimal(18, 2)), CAST(1.09 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (54, CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), CAST(1.75 AS Decimal(18, 2)), CAST(1.23 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (55, CAST(N'2022-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), CAST(3.93 AS Decimal(18, 2)), CAST(2.75 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (56, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-07-01T00:00:00.0000000' AS DateTime2), CAST(9.78 AS Decimal(18, 2)), CAST(6.85 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (57, CAST(N'2023-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), CAST(3.88 AS Decimal(18, 2)), CAST(2.72 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (58, CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), CAST(5.70 AS Decimal(18, 2)), CAST(3.99 AS Decimal(18, 2)))
INSERT [dbo].[PrecoVigente] ([Id], [DataInicial], [DataFinal], [ValorPrimeiraHora], [ValorHoraAdicional]) VALUES (59, CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-01T00:00:00.0000000' AS DateTime2), CAST(1.10 AS Decimal(18, 2)), CAST(0.77 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[PrecoVigente] OFF
GO
INSERT [dbo].[Veiculos] ([Placa], [DataEntrada], [DataSaida]) VALUES (N'ABC123', CAST(N'2023-11-08T02:51:02.7166667' AS DateTime2), CAST(N'2023-11-08T02:58:52.4910465' AS DateTime2))
INSERT [dbo].[Veiculos] ([Placa], [DataEntrada], [DataSaida]) VALUES (N'DEF456', CAST(N'2023-11-08T02:53:40.9633333' AS DateTime2), CAST(N'2023-11-23T02:53:40.9633333' AS DateTime2))
INSERT [dbo].[Veiculos] ([Placa], [DataEntrada], [DataSaida]) VALUES (N'GHI789', CAST(N'2023-11-08T02:53:40.9633333' AS DateTime2), CAST(N'2023-11-28T02:53:40.9633333' AS DateTime2))
INSERT [dbo].[Veiculos] ([Placa], [DataEntrada], [DataSaida]) VALUES (N'JKL321', CAST(N'2023-11-08T02:51:02.7166667' AS DateTime2), CAST(N'2023-11-08T04:06:02.7166667' AS DateTime2))
INSERT [dbo].[Veiculos] ([Placa], [DataEntrada], [DataSaida]) VALUES (N'MNO987', CAST(N'2023-11-08T02:51:02.7166667' AS DateTime2), CAST(N'2023-11-08T05:01:02.7166667' AS DateTime2))
INSERT [dbo].[Veiculos] ([Placa], [DataEntrada], [DataSaida]) VALUES (N'PQR654', CAST(N'2023-11-08T02:51:02.7166667' AS DateTime2), CAST(N'2023-11-08T05:21:02.7166667' AS DateTime2))
INSERT [dbo].[Veiculos] ([Placa], [DataEntrada], [DataSaida]) VALUES (N'QWE456', CAST(N'2023-11-08T02:51:02.7166667' AS DateTime2), CAST(N'2023-11-08T04:00:02.7166667' AS DateTime2))
INSERT [dbo].[Veiculos] ([Placa], [DataEntrada], [DataSaida]) VALUES (N'STU789', CAST(N'2023-11-08T02:51:02.7166667' AS DateTime2), CAST(N'2023-11-08T06:01:02.7166667' AS DateTime2))
INSERT [dbo].[Veiculos] ([Placa], [DataEntrada], [DataSaida]) VALUES (N'VWX123', CAST(N'2023-11-08T02:51:02.7166667' AS DateTime2), CAST(N'2023-11-08T06:51:02.7166667' AS DateTime2))
INSERT [dbo].[Veiculos] ([Placa], [DataEntrada], [DataSaida]) VALUES (N'XYZ789', CAST(N'2023-11-08T02:51:02.7166667' AS DateTime2), CAST(N'2023-11-08T03:22:02.7166667' AS DateTime2))
GO
USE [master]
GO
ALTER DATABASE [YourSafePlace] SET  READ_WRITE 
GO
