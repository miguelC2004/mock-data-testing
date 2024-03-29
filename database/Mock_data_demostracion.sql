USE [master]
GO
/****** Object:  Database [INFORME]    Script Date: 13/02/2024 6:10:14 a. m. ******/
CREATE DATABASE [INFORME]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'INFORME', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\INFORME.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'INFORME_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\INFORME_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [INFORME] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [INFORME].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [INFORME] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [INFORME] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [INFORME] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [INFORME] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [INFORME] SET ARITHABORT OFF 
GO
ALTER DATABASE [INFORME] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [INFORME] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [INFORME] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [INFORME] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [INFORME] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [INFORME] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [INFORME] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [INFORME] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [INFORME] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [INFORME] SET  ENABLE_BROKER 
GO
ALTER DATABASE [INFORME] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [INFORME] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [INFORME] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [INFORME] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [INFORME] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [INFORME] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [INFORME] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [INFORME] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [INFORME] SET  MULTI_USER 
GO
ALTER DATABASE [INFORME] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [INFORME] SET DB_CHAINING OFF 
GO
ALTER DATABASE [INFORME] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [INFORME] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [INFORME] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [INFORME] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [INFORME] SET QUERY_STORE = ON
GO
ALTER DATABASE [INFORME] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [INFORME]
GO
/****** Object:  Table [dbo].[Desembolsos]    Script Date: 13/02/2024 6:10:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Desembolsos](
	[id_caso] [int] NOT NULL,
	[id_cliente] [int] NULL,
	[agencia] [varchar](50) NULL,
	[monto_desembolsado] [decimal](10, 2) NULL,
	[fecha_desembolso] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_caso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoSolicitud]    Script Date: 13/02/2024 6:10:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoSolicitud](
	[id_caso] [int] NOT NULL,
	[info_cliente] [varchar](100) NULL,
	[estado_solicitud] [varchar](50) NULL,
	[tipo_producto] [varchar](50) NULL,
	[tipo_solicitud] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_caso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interacciones]    Script Date: 13/02/2024 6:10:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interacciones](
	[id_caso] [int] NOT NULL,
	[interacciones_recibidas] [int] NULL,
	[interacciones_atendidas] [int] NULL,
	[tiempo_gestion] [int] NULL,
	[fecha_hora] [datetime] NULL,
	[id_agente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_caso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Desembolsos] ([id_caso], [id_cliente], [agencia], [monto_desembolsado], [fecha_desembolso]) VALUES (1, 1001, N'Agencia A', CAST(5000.00 AS Decimal(10, 2)), CAST(N'2024-02-13T10:00:00.000' AS DateTime))
INSERT [dbo].[Desembolsos] ([id_caso], [id_cliente], [agencia], [monto_desembolsado], [fecha_desembolso]) VALUES (2, 1002, N'Agencia B', CAST(8000.00 AS Decimal(10, 2)), CAST(N'2024-02-13T11:30:00.000' AS DateTime))
INSERT [dbo].[Desembolsos] ([id_caso], [id_cliente], [agencia], [monto_desembolsado], [fecha_desembolso]) VALUES (3, 1003, N'Agencia A', CAST(7000.00 AS Decimal(10, 2)), CAST(N'2024-02-13T10:45:00.000' AS DateTime))
INSERT [dbo].[Desembolsos] ([id_caso], [id_cliente], [agencia], [monto_desembolsado], [fecha_desembolso]) VALUES (4, 1004, N'Agencia C', CAST(6000.00 AS Decimal(10, 2)), CAST(N'2024-02-13T11:45:00.000' AS DateTime))
INSERT [dbo].[Desembolsos] ([id_caso], [id_cliente], [agencia], [monto_desembolsado], [fecha_desembolso]) VALUES (5, 1005, N'Agencia B', CAST(9000.00 AS Decimal(10, 2)), CAST(N'2024-02-13T12:30:00.000' AS DateTime))
INSERT [dbo].[Desembolsos] ([id_caso], [id_cliente], [agencia], [monto_desembolsado], [fecha_desembolso]) VALUES (6, 1006, N'Agencia B', CAST(8000.00 AS Decimal(10, 2)), CAST(N'2024-02-13T14:45:00.000' AS DateTime))
INSERT [dbo].[Desembolsos] ([id_caso], [id_cliente], [agencia], [monto_desembolsado], [fecha_desembolso]) VALUES (7, 1007, N'Agencia C', CAST(9500.00 AS Decimal(10, 2)), CAST(N'2024-02-13T16:00:00.000' AS DateTime))
INSERT [dbo].[Desembolsos] ([id_caso], [id_cliente], [agencia], [monto_desembolsado], [fecha_desembolso]) VALUES (8, 1008, N'Agencia A', CAST(7200.00 AS Decimal(10, 2)), CAST(N'2024-02-13T17:00:00.000' AS DateTime))
GO
INSERT [dbo].[EstadoSolicitud] ([id_caso], [info_cliente], [estado_solicitud], [tipo_producto], [tipo_solicitud]) VALUES (1, N'Cliente 1', N'Aprobada', N'Crédito Personal', N'Nuevo')
INSERT [dbo].[EstadoSolicitud] ([id_caso], [info_cliente], [estado_solicitud], [tipo_producto], [tipo_solicitud]) VALUES (2, N'Cliente 2', N'Rechazada', N'Crédito Hipotecario', N'Nuevo')
INSERT [dbo].[EstadoSolicitud] ([id_caso], [info_cliente], [estado_solicitud], [tipo_producto], [tipo_solicitud]) VALUES (3, N'Cliente 3', N'Aprobada', N'Crédito Automotriz', N'Nuevo')
INSERT [dbo].[EstadoSolicitud] ([id_caso], [info_cliente], [estado_solicitud], [tipo_producto], [tipo_solicitud]) VALUES (4, N'Cliente 4', N'Aprobada', N'Crédito Personal', N'Retanqueo')
INSERT [dbo].[EstadoSolicitud] ([id_caso], [info_cliente], [estado_solicitud], [tipo_producto], [tipo_solicitud]) VALUES (5, N'Cliente 5', N'Rechazada', N'Crédito Hipotecario', N'Nuevo')
INSERT [dbo].[EstadoSolicitud] ([id_caso], [info_cliente], [estado_solicitud], [tipo_producto], [tipo_solicitud]) VALUES (6, N'Cliente 6', N'Aprobada', N'Crédito Personal', N'Nuevo')
INSERT [dbo].[EstadoSolicitud] ([id_caso], [info_cliente], [estado_solicitud], [tipo_producto], [tipo_solicitud]) VALUES (7, N'Cliente 7', N'Rechazada', N'Crédito Automotriz', N'Retanqueo')
INSERT [dbo].[EstadoSolicitud] ([id_caso], [info_cliente], [estado_solicitud], [tipo_producto], [tipo_solicitud]) VALUES (8, N'Cliente 8', N'Aprobada', N'Crédito Hipotecario', N'Nuevo')
GO
INSERT [dbo].[Interacciones] ([id_caso], [interacciones_recibidas], [interacciones_atendidas], [tiempo_gestion], [fecha_hora], [id_agente]) VALUES (1, 10, 8, 15, CAST(N'2024-02-13T08:30:00.000' AS DateTime), 101)
INSERT [dbo].[Interacciones] ([id_caso], [interacciones_recibidas], [interacciones_atendidas], [tiempo_gestion], [fecha_hora], [id_agente]) VALUES (3, 12, 10, 18, CAST(N'2024-02-13T10:30:00.000' AS DateTime), 103)
INSERT [dbo].[Interacciones] ([id_caso], [interacciones_recibidas], [interacciones_atendidas], [tiempo_gestion], [fecha_hora], [id_agente]) VALUES (4, 8, 6, 22, CAST(N'2024-02-13T11:15:00.000' AS DateTime), 101)
INSERT [dbo].[Interacciones] ([id_caso], [interacciones_recibidas], [interacciones_atendidas], [tiempo_gestion], [fecha_hora], [id_agente]) VALUES (5, 14, 12, 16, CAST(N'2024-02-13T12:00:00.000' AS DateTime), 102)
INSERT [dbo].[Interacciones] ([id_caso], [interacciones_recibidas], [interacciones_atendidas], [tiempo_gestion], [fecha_hora], [id_agente]) VALUES (6, 18, 15, 14, CAST(N'2024-02-13T14:30:00.000' AS DateTime), 103)
INSERT [dbo].[Interacciones] ([id_caso], [interacciones_recibidas], [interacciones_atendidas], [tiempo_gestion], [fecha_hora], [id_agente]) VALUES (7, 22, 20, 12, CAST(N'2024-02-13T15:45:00.000' AS DateTime), 102)
INSERT [dbo].[Interacciones] ([id_caso], [interacciones_recibidas], [interacciones_atendidas], [tiempo_gestion], [fecha_hora], [id_agente]) VALUES (8, 16, 14, 18, CAST(N'2024-02-13T16:30:00.000' AS DateTime), 101)
GO
USE [master]
GO
ALTER DATABASE [INFORME] SET  READ_WRITE 
GO
