USE [master]
GO
/****** Object:  Database [Municipalidad]    Script Date: 17/10/2022 09:16:27 p. m. ******/
CREATE DATABASE [Municipalidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Municipalidad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Municipalidad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Municipalidad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Municipalidad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Municipalidad] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Municipalidad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Municipalidad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Municipalidad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Municipalidad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Municipalidad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Municipalidad] SET ARITHABORT OFF 
GO
ALTER DATABASE [Municipalidad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Municipalidad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Municipalidad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Municipalidad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Municipalidad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Municipalidad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Municipalidad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Municipalidad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Municipalidad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Municipalidad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Municipalidad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Municipalidad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Municipalidad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Municipalidad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Municipalidad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Municipalidad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Municipalidad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Municipalidad] SET RECOVERY FULL 
GO
ALTER DATABASE [Municipalidad] SET  MULTI_USER 
GO
ALTER DATABASE [Municipalidad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Municipalidad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Municipalidad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Municipalidad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Municipalidad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Municipalidad] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Municipalidad', N'ON'
GO
ALTER DATABASE [Municipalidad] SET QUERY_STORE = OFF
GO
USE [Municipalidad]
GO
/****** Object:  Table [dbo].[ConceptoCobro]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConceptoCobro](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[TipoMontoCC] [varchar](128) NULL,
	[PeriodoMontoCC] [varchar](128) NULL,
	[ValorMinimo] [varchar](128) NULL,
	[ValorMinimoM3] [varchar](128) NULL,
	[Valorm3] [varchar](128) NULL,
	[ValorPorcentual] [varchar](128) NULL,
	[ValorFijo] [varchar](128) NULL,
	[ValorM2Minimo] [varchar](128) NULL,
	[ValorTractosM2] [varchar](128) NULL,
	[ValorFijoM3Adicional] [varchar](128) NULL,
 CONSTRAINT [PK_ConceptoCobro] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBErrors]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBErrors](
	[errorID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorProcedure] [varchar](max) NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ErrorDateTime] [datetime] NULL,
 CONSTRAINT [PK_dbo.DBErrors] PRIMARY KEY CLUSTERED 
(
	[errorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCC]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [money] NOT NULL,
	[IdConceptoCobro] [int] NOT NULL,
	[IdFactura] [int] NOT NULL,
 CONSTRAINT [PK_DetalleCC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCCAgua]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCCAgua](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [money] NOT NULL,
	[IdMovimientoConsumo] [int] NOT NULL,
	[IdDetalleCC] [int] NOT NULL,
 CONSTRAINT [PK_DetalleCCAgua] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[FechaVencimiento] [date] NOT NULL,
	[TotalOriginal] [float] NOT NULL,
	[TotalPagar] [float] NOT NULL,
	[Estado] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoConsumo]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoConsumo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Monto] [money] NOT NULL,
	[IdTipoMovimiento] [int] NULL,
	[IdPropiedadCCAgua] [int] NULL,
 CONSTRAINT [PK_MovimientoConsumo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[ValorDocId] [bigint] NOT NULL,
	[IdTipoDoc] [int] NOT NULL,
	[email] [varchar](128) NOT NULL,
	[telefono1] [bigint] NOT NULL,
	[telefono2] [bigint] NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propiedad]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propiedad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Area] [float] NOT NULL,
	[ValorFiscal] [varchar](128) NOT NULL,
	[FechaRegistro] [date] NOT NULL,
	[IdTipoTerreno] [int] NOT NULL,
	[IdTipoZona] [int] NOT NULL,
	[NumeroFinca] [int] NULL,
 CONSTRAINT [PK_Propiedad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropiedadCCAgua]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropiedadCCAgua](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreMedidor] [varchar](128) NOT NULL,
	[SaldoAcumulado] [money] NOT NULL,
 CONSTRAINT [PK_PropiedadCCAgua] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropiedadXCC]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropiedadXCC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdConceptoCobro] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
 CONSTRAINT [PK_PropiedadXCC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PXP]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PXP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PXU]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PXU](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocIdent]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocIdent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[Mascara] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoDocIdent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoConsumo]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientoConsumo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoMovimientoConsumo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTerreno]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTerreno](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoTerreno] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoZona]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoZona](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoZona] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/10/2022 09:16:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](128) NOT NULL,
	[Password] [varchar](128) NOT NULL,
	[TipoUsuario] [varchar](128) NOT NULL,
	[IdPersona] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ConceptoCobro] ON 

INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [TipoMontoCC], [PeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (8, N'ConsumoAgua', N'2', N'1', N'300', N'30', N'', N'', N'', N'', N'', N'ConsumoAgua')
INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [TipoMontoCC], [PeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (9, N'Impuesto a propiedad', N'3', N'4', N'', N'', N'', N'0.01', N'', N'', N'', N'Impuesto a propiedad')
INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [TipoMontoCC], [PeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (10, N'Recoleccion Basura', N'2', N'1', N'150', N'', N'', N'', N'300', N'400', N'200', N'Recoleccion Basura')
INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [TipoMontoCC], [PeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (11, N'Patente Comercial', N'1', N'3', N'', N'', N'', N'', N'150000', N'', N'', N'Patente Comercial')
INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [TipoMontoCC], [PeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (12, N'Reconexion', N'1', N'1', N'', N'', N'', N'', N'30000', N'', N'', N'Reconexion')
INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [TipoMontoCC], [PeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (13, N'Intereses Moratorios', N'3', N'1', N'', N'', N'', N'0.02', N'30000', N'', N'', N'Intereses Moratorios')
INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [TipoMontoCC], [PeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (14, N'MantenimientoParques', N'1', N'4', N'', N'', N'', N'0.02', N'2000', N'', N'', N'MantenimientoParques')
SET IDENTITY_INSERT [dbo].[ConceptoCobro] OFF
GO
SET IDENTITY_INSERT [dbo].[DBErrors] ON 

INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (1, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:53:05.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:53:37.190' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (3, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:53:38.310' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (4, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:56:46.367' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (5, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:57:21.463' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (6, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:57:22.043' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (7, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:57:24.560' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (8, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:57:25.277' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (9, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:58:58.753' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (10, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:32.870' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (11, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:35.903' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (12, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:53.957' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (13, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:55.020' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (14, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:59.430' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (15, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:21.777' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (16, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:22.627' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (17, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.070' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (18, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.303' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (19, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.530' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (20, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.700' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (21, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.927' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (22, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:24.123' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (23, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:24.340' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (24, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:49.890' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (25, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:45:06.617' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (26, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:45:49.720' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (27, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:53:37.820' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (28, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:53:38.590' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (29, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:57:01.673' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (30, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T22:01:14.010' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (31, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T22:02:10.787' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (32, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T22:02:42.367' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (33, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T22:02:43.110' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (34, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:06:57.600' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (35, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:13:44.573' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (36, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:20:08.120' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (37, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:21:55.143' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (38, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:22:13.863' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (39, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:07.393' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (40, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.927' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (41, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (42, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (43, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (44, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (45, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (46, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (47, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (48, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (49, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (50, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (51, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (52, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (53, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (54, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (55, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (56, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (57, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (58, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (59, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (60, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (61, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (62, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (63, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.943' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (64, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.943' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (65, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.943' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (66, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (67, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (68, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (69, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (70, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (71, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (72, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.480' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (73, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.483' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (74, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (75, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (76, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (77, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (78, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (79, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (80, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (81, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (82, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (83, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (84, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (85, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (86, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (87, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (88, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (89, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (90, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (91, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (92, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (93, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (94, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (95, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (96, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (97, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (98, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (99, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
GO
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (100, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (101, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (102, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (103, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (104, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.670' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (105, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.677' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (106, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.677' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (107, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.677' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (108, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.677' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (109, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (110, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (111, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (112, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (113, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (114, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (115, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (116, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (117, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (118, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (119, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (120, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (121, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (122, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (123, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (124, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (125, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (126, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (127, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (128, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (129, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (130, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (131, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (132, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (133, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (134, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (135, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (136, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.203' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (137, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (138, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (139, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (140, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (141, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (142, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (143, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (144, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (145, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (146, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (147, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (148, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (149, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (150, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (151, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (152, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (153, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (154, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (155, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (156, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (157, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (158, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (159, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (160, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (161, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (162, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (163, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (164, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (165, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (166, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (167, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.223' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (168, N'LAPTOP-9BCLTGCP\javie', 515, 2, 16, 18, N'dbo.insertUser', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.Usuario''; column does not allow nulls. INSERT fails.', CAST(N'2022-10-16T23:47:29.157' AS DateTime))
SET IDENTITY_INSERT [dbo].[DBErrors] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (1, N'Thomas Weuve', 63170026, 2, N'6a9dc48aed440a9d@gmail.com', 73627928, 62165293)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (2, N'Lola Thompson', 77334570, 2, N'a3b7890761342bb8@gmail.com', 74941028, 80306404)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (3, N'Yolanda Motta', 77064288, 1, N'53779b3dfc8c6baf@gmail.com', 80557422, 20028033)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (4, N'Nicole Raxter', 92123496, 2, N'cb674bc95136fcbe@gmail.com', 18992708, 24096884)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (5, N'Marcus Vega', 50331168, 3, N'515c2476b9138ed3@gmail.com', 36240993, 24062083)
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Propiedad] ON 

INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (1, 5600, N'5729863769', CAST(N'2022-03-02' AS Date), 1, 2, 3288)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (2, 1827, N'8216686100', CAST(N'2022-03-02' AS Date), 2, 3, 2184)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (3, 5600, N'5086118225', CAST(N'2022-03-02' AS Date), 4, 5, 9050)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (4, 1827, N'4385729851', CAST(N'2022-03-02' AS Date), 1, 2, 1789)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (5, 5600, N'6691113882', CAST(N'2022-03-02' AS Date), 3, 4, 1011)
SET IDENTITY_INSERT [dbo].[Propiedad] OFF
GO
SET IDENTITY_INSERT [dbo].[PXP] ON 

INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (1, 1, 1, CAST(N'2022-03-02' AS Date), CAST(N'2022-06-02' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (2, 1, 2, CAST(N'2022-03-02' AS Date), CAST(N'2022-06-02' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (3, 1, 3, CAST(N'2022-03-02' AS Date), CAST(N'2022-06-02' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (4, 2, 3, CAST(N'2022-03-02' AS Date), CAST(N'2022-06-02' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (5, 2, 5, CAST(N'2022-03-02' AS Date), CAST(N'2022-06-02' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (6, 4, 4, CAST(N'2022-03-02' AS Date), CAST(N'2022-06-02' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (7, 5, 5, CAST(N'2022-03-02' AS Date), CAST(N'2022-06-02' AS Date))
SET IDENTITY_INSERT [dbo].[PXP] OFF
GO
SET IDENTITY_INSERT [dbo].[PXU] ON 

INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (1, 1, 1, CAST(N'2022-03-02' AS Date), CAST(N'2022-06-02' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (2, 1, 2, CAST(N'2022-03-02' AS Date), CAST(N'2022-06-02' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (3, 2, 3, CAST(N'2022-03-02' AS Date), CAST(N'2022-06-02' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (4, 3, 4, CAST(N'2022-03-02' AS Date), CAST(N'2022-06-02' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (5, 4, 5, CAST(N'2022-03-02' AS Date), CAST(N'2022-06-02' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (6, 1, 3, CAST(N'2022-03-02' AS Date), CAST(N'2022-06-02' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (7, 2, 5, CAST(N'2022-03-02' AS Date), CAST(N'2022-06-02' AS Date))
SET IDENTITY_INSERT [dbo].[PXU] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDocIdent] ON 

INSERT [dbo].[TipoDocIdent] ([ID], [Nombre], [Mascara]) VALUES (1, N'Cedula CR', N'X-XXXX-XXXX')
INSERT [dbo].[TipoDocIdent] ([ID], [Nombre], [Mascara]) VALUES (2, N'Persona Jurídica CR', N'X-XXX-XXXXXX')
INSERT [dbo].[TipoDocIdent] ([ID], [Nombre], [Mascara]) VALUES (3, N' Pasaporte CR', N'X-XXXX-XXXX')
SET IDENTITY_INSERT [dbo].[TipoDocIdent] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMovimientoConsumo] ON 

INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (1, N'Residencial')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (2, N'Agricola')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (3, N'Bosque')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (4, N'Zona industrial')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (5, N'Zona comercial')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (6, N'Residencial')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (7, N'Agricola')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (8, N'Bosque')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (9, N'Zona industrial')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (10, N'Zona comercial')
SET IDENTITY_INSERT [dbo].[TipoMovimientoConsumo] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoTerreno] ON 

INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (1, N'Residencial')
INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (2, N'Agricola')
INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (3, N'Bosque')
INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (4, N'Zona industrial')
INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (5, N'Zona comercial')
SET IDENTITY_INSERT [dbo].[TipoTerreno] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoZona] ON 

INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (1, N'Residencial')
INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (2, N'Agricola')
INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (3, N'Bosque')
INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (4, N'Zona industrial')
INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (5, N'Zona comercial')
SET IDENTITY_INSERT [dbo].[TipoZona] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (1, N'similarSnipe4', N'KJbmbI', N'Propietario', 1)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (2, N'finickySmelt5', N'a0S4fq', N'Propietario', 2)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (3, N'goofyEggs0', N'xzKqYM', N'Propietario', 3)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (4, N'finickyDunbird5', N'sPfyzg', N'Propietario', 4)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (5, N'lyingSausage7', N'qg7jb7', N'Administrador', 5)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[DetalleCC]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCC_ConceptoCobro] FOREIGN KEY([IdConceptoCobro])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[DetalleCC] CHECK CONSTRAINT [FK_DetalleCC_ConceptoCobro]
GO
ALTER TABLE [dbo].[DetalleCC]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCC_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([ID])
GO
ALTER TABLE [dbo].[DetalleCC] CHECK CONSTRAINT [FK_DetalleCC_Factura]
GO
ALTER TABLE [dbo].[DetalleCCAgua]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCCAgua_DetalleCC] FOREIGN KEY([IdDetalleCC])
REFERENCES [dbo].[DetalleCC] ([ID])
GO
ALTER TABLE [dbo].[DetalleCCAgua] CHECK CONSTRAINT [FK_DetalleCCAgua_DetalleCC]
GO
ALTER TABLE [dbo].[DetalleCCAgua]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCCAgua_MovimientoConsumo] FOREIGN KEY([IdMovimientoConsumo])
REFERENCES [dbo].[MovimientoConsumo] ([ID])
GO
ALTER TABLE [dbo].[DetalleCCAgua] CHECK CONSTRAINT [FK_DetalleCCAgua_MovimientoConsumo]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Propiedad]
GO
ALTER TABLE [dbo].[MovimientoConsumo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoConsumo_PropiedadCCAgua] FOREIGN KEY([IdPropiedadCCAgua])
REFERENCES [dbo].[PropiedadCCAgua] ([ID])
GO
ALTER TABLE [dbo].[MovimientoConsumo] CHECK CONSTRAINT [FK_MovimientoConsumo_PropiedadCCAgua]
GO
ALTER TABLE [dbo].[MovimientoConsumo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoConsumo_TipoMovimientoConsumo] FOREIGN KEY([IdTipoMovimiento])
REFERENCES [dbo].[TipoMovimientoConsumo] ([ID])
GO
ALTER TABLE [dbo].[MovimientoConsumo] CHECK CONSTRAINT [FK_MovimientoConsumo_TipoMovimientoConsumo]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_TipoDocIdent] FOREIGN KEY([IdTipoDoc])
REFERENCES [dbo].[TipoDocIdent] ([ID])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_TipoDocIdent]
GO
ALTER TABLE [dbo].[Propiedad]  WITH CHECK ADD  CONSTRAINT [FK_Propiedad_TipoTerreno] FOREIGN KEY([IdTipoTerreno])
REFERENCES [dbo].[TipoTerreno] ([ID])
GO
ALTER TABLE [dbo].[Propiedad] CHECK CONSTRAINT [FK_Propiedad_TipoTerreno]
GO
ALTER TABLE [dbo].[Propiedad]  WITH CHECK ADD  CONSTRAINT [FK_Propiedad_TipoZona] FOREIGN KEY([IdTipoZona])
REFERENCES [dbo].[TipoZona] ([ID])
GO
ALTER TABLE [dbo].[Propiedad] CHECK CONSTRAINT [FK_Propiedad_TipoZona]
GO
ALTER TABLE [dbo].[PropiedadCCAgua]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadCCAgua_PropiedadXCC] FOREIGN KEY([ID])
REFERENCES [dbo].[PropiedadXCC] ([ID])
GO
ALTER TABLE [dbo].[PropiedadCCAgua] CHECK CONSTRAINT [FK_PropiedadCCAgua_PropiedadXCC]
GO
ALTER TABLE [dbo].[PropiedadXCC]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadXCC_ConceptoCobro] FOREIGN KEY([IdConceptoCobro])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[PropiedadXCC] CHECK CONSTRAINT [FK_PropiedadXCC_ConceptoCobro]
GO
ALTER TABLE [dbo].[PropiedadXCC]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadXCC_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[PropiedadXCC] CHECK CONSTRAINT [FK_PropiedadXCC_Propiedad]
GO
ALTER TABLE [dbo].[PXP]  WITH CHECK ADD  CONSTRAINT [FK_PXP_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[PXP] CHECK CONSTRAINT [FK_PXP_Persona]
GO
ALTER TABLE [dbo].[PXP]  WITH CHECK ADD  CONSTRAINT [FK_PXP_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[PXP] CHECK CONSTRAINT [FK_PXP_Propiedad]
GO
ALTER TABLE [dbo].[PXU]  WITH CHECK ADD  CONSTRAINT [FK_PXU_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[PXU] CHECK CONSTRAINT [FK_PXU_Propiedad]
GO
ALTER TABLE [dbo].[PXU]  WITH CHECK ADD  CONSTRAINT [FK_PXU_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[PXU] CHECK CONSTRAINT [FK_PXU_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Persona]
GO
/****** Object:  StoredProcedure [dbo].[asociarPXP]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[asociarPXP]
	@inNumDocId BIGINT,
	@inNumeroFinca INT, 
	@inFechaInicio DATE,
	@inFechaFin DATE,
	@outResultCode INT OUTPUT
	--Los anteriores son los parámetros de entrada de la función.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
		BEGIN TRY
		--Las dos siguientes variables se utilizan para validación y también para la agregación de datos.
		DECLARE @inIdPersona INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inNumDocId);
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		IF NOT EXISTS(SELECT P.IdPersona, P.IdPropiedad, P.FechaInicio, P.FechaFin FROM dbo.PXP P WHERE 
					P.IdPersona = @inIdPersona and P.IdPropiedad = @inIdPropiedad and P.FechaInicio = @inFechaInicio
					and P.FechaFin = @inFechaFin) --Verifica que no exista la relación.
			BEGIN
			BEGIN TRANSACTION tAsociarPXP
			INSERT INTO dbo.PXP --Insertar en la relación de Persona con propiedad. 
				(
				IdPersona,
				IdPropiedad,
				FechaInicio,
				FechaFin
				)
			VALUES
				(
				@inIdPersona,
				@inIdPropiedad,
				@inFechaInicio,
				@inFechaFin
				)

				COMMIT TRANSACTION tAsociarPXP
			END

		END TRY
		BEGIN CATCH --Recoge los errores
			IF @@TRANCOUNT > 1
			BEGIN
			ROLLBACK TRANSACTION tAsociarPXP;
			END
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			Set @outResultCode=50010; --Establece el código de error 

		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[asociarPXU]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[asociarPXU]
	@inUsername VARCHAR(128),
	@inNumeroFinca INT,
	@inFechaInicio DATE,
	@inFechaFin DATE, 
	@outResultCode INT OUTPUT
	--Los anteriores son los parámetros de entrada de la función.
AS
BEGIN
	SET	@outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
	--Las siguientes variables sirven para la validaciones de las relaciones y para agregar en la tabla.
			DECLARE @inIdUsuario INT = (SELECT U.ID FROM dbo.Usuario U WHERE U.UserName = @inUsername);
			DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);

			IF NOT EXISTS(SELECT P.IdUsuario, P.IdPropiedad, P.FechaInicio, P.FechaFin FROM dbo.PXU P WHERE 
				P.IdUsuario = @inIdUsuario and P.IdPropiedad = @inIdPropiedad and P.FechaInicio = @inFechaInicio
				and P.FechaFin = @inFechaFin) --Verifica que no exista la relación.
						INSERT INTO dbo.PXU -- Se agrega en la tabla la relación. 
						(
						IdUsuario,
						IdPropiedad,
						FechaInicio,
						FechaFin
						)
						VALUES
						(
						@inIdUsuario,
						@inIdPropiedad,
						@inFechaInicio,
						@inFechaFin
						)
	END TRY
	BEGIN CATCH --Recoge los errores de la transacción
		IF @@TRANCOUNT > 1
			BEGIN
			ROLLBACK TRANSACTION tAsociarPXU;
			END
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		SET @outResultCode = 50017;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[deletePerson]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deletePerson]
	@inValorDocId BIGINT,
	@outResultCode INT OUTPUT
	--Las personas se borran con su valor de documento de identidad.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
		BEGIN TRY
			IF EXISTS(SELECT P.ValorDocId FROM dbo.Persona P WHERE P.ValorDocId = @inValorDocId) --Si existe la persona, la borra.
				BEGIN	
					DELETE FROM dbo.Persona WHERE ValorDocId = @inValorDocId; --Borra a la persona con su valor de Documento Identidad.
				END
		END TRY
	BEGIN CATCH --Recoge errores durante el SP
	IF @@TRANCOUNT > 0  
		INSERT INTO dbo.DBErrors( 
		--[errorID]
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			--ERROR_STATE(),
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode = 50004;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteProperty]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteProperty]
	@inNumeroFinca INT,
	@outResultCode INT
	--Las propiedades se borrarán con su número de finca, por lo tanto se pide como parámetro.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON; 
	BEGIN TRY
		DELETE FROM dbo.Propiedad WHERE NumeroFinca = @inNumeroFinca; --Si la propiedad existe, la borra. 
	END TRY
	BEGIN CATCH --Recoge errores durante el SP.
			INSERT INTO dbo.DBErrors(
			--[errorID]
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				--ERROR_STATE(),
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		Set @outResultCode=50008;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteUser]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteUser]
	@inUsername VARCHAR(128),
	@inPassword VARCHAR(128),
	@inTipoUsuario VARCHAR(128),
	@outResultCode INT OUTPUT
	--Los parámetros anteriores permiten buscar al usuario para eliminarlo.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		IF EXISTS(SELECT U.UserName, U.Password, U.TipoUsuario, U.IdPersona FROM Municipalidad.dbo.Usuario U WHERE
					U.UserName = @inUsername and U.Password = @inPassword and U.TipoUsuario = @inTipoUsuario)
			BEGIN --Se verifica que el usuario exista y seguidamente lo elimina utilizando los parámetros del SP.
				DELETE FROM dbo.Usuario WHERE Username = @inUsername and Password = @inPassword and TipoUsuario = @inTipoUsuario;
			END
	END TRY
	BEGIN CATCH --Toma errores en el SP
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			Set @outResultCode=50014; --Establece el código de error 

	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[desasociarPXP]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[desasociarPXP]
	@inNumDocId BIGINT,
	@inNumeroFinca INT, 
	@outResultCode INT
	--Los parámetros que permiten borrar la relación son el documento identidad y el número de finca.  

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON; 
	BEGIN TRY
	--Los parámetros que siguen permiten encontrar la relación a borrar, para luego borrarla en caso de existir.
		DECLARE @inIdPersona INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inNumDocId);
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		DELETE FROM dbo.PXP WHERE IdPersona = @inIdPersona and IdPropiedad = @inIdPropiedad; --Elimina la relación en caso de existir. 
	END TRY
	BEGIN CATCH --Atrapa errores en el SP
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			Set @outResultCode=50011;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[desasociarPXU]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[desasociarPXU]
	@inUserName VARCHAR(128),
	@inNumeroFinca INT,
	@outResultCode INT OUTPUT
	--La relación entre propiedad y usuario se borra con el nombre de usuario y el número de finca

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
	--Las siguientes variables permiten encontrar la relación a borrar mediante los ID, siempre y cuando esta exista. 
		DECLARE @inIdUsuario INT = (SELECT U.ID FROM dbo.Usuario U WHERE U.UserName = @inUsername);
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		DELETE FROM dbo.PXU WHERE IdUsuario = @inIdUsuario and IdPropiedad = @inIdPropiedad;
	END TRY 
	BEGIN CATCH --Atrapa errores durante la ejecución del SP.
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		SET @outResultCode = 50018;
		
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[insertPerson]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertPerson]
	@inNombre VARCHAR(128),
	@inValorDocId BIGINT,
	@inIdTipoDoc INT,
	@inEmail VARCHAR(128),
	@inTelefono1 BIGINT,
	@inTelefono2 BIGINT,
	@outResultCode INT OUTPUT
	--Los anteriores son los parámetros para agregar a una persona. 
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
	SET @outResultCode = 0;
	--Se verifica que la persona no exista y se agrega a la tabla Persona. 
	IF NOT EXISTS(SELECT P.Nombre, P.ValorDocId, P.IdTipoDoc, P.email, P.telefono1, P.telefono2 FROM Municipalidad.dbo.Persona P 
				WHERE P.Nombre = @inNombre and P.ValorDocId = @inValorDocId and P.IdTipoDoc = @inIdTipoDoc and P.email = @inEmail and 
						P.telefono1 = @inTelefono1 and P.telefono2 = @inTelefono2) --Si la persona no existe, la agrega 
		INSERT INTO dbo.Persona (
			Nombre
			, ValorDocId
			, IdTipoDoc
			, email
			, telefono1
			, telefono2
			)
			VALUES (
			@inNombre
			, @inValorDocId
			, @inIdTipoDoc
			, @inEmail
			, @inTelefono1
			, @inTelefono2
			)
	END TRY

	BEGIN CATCH		--Atrapa errores en la ejecución del SP
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50003;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[insertProperty]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertProperty]
	@inNumeroFinca INT,
	@inArea FLOAT,
	@inValorFiscal VARCHAR(128),
	@inFechaRegistro DATE,
	@inIdTipoTerreno INT,
	@inIdTipoZona INT,
	@outResultCode INT OUTPUT
--Los anteriores son los parámetros que permiten la creación de una propiedad.

AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SET @outResultCode = 0;
		--Si la propiedad no existe, procede a crearla en la tabla Propiedad.
		IF NOT EXISTS(SELECT P.NumeroFinca, P.Area, P.ValorFiscal, P.FechaRegistro, P.IdTipoTerreno, P.IdTipoZona
			FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca) --Si no existe la propiedad, la crea
			BEGIN
			INSERT INTO dbo.Propiedad(
				NumeroFinca,
				Area,
				ValorFiscal,
				FechaRegistro,
				IdTipoTerreno,
				IdTipoZona
			)
			VALUES(
				@inNumeroFinca,
				@inArea,
				@inValorFiscal,
				@inFechaRegistro,
				@inIdTipoTerreno,
				@inIdTipoZona
			)
			END
	END TRY
	BEGIN CATCH --Si se encuentran errores, se agregan en la tabla DBErrors 

		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50005;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[insertUser]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertUser]
	@inDocID BIGINT,
	@inUsername VARCHAR(128),
	@inPassword VARCHAR(128),
	@inTipoUsuario VARCHAR(128),
	@outResultCode INT OUTPUT
	--Los parámetros anteriores permiten la creación de un usuario.

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		--Si el usuario no existe, se procede a crearlo e insertarlo en la tabla Usuario. 
		IF NOT EXISTS(SELECT U.UserName, U.Password, U.TipoUsuario FROM Municipalidad.dbo.Usuario U WHERE
					U.UserName = @inUsername and U.Password = @inPassword and U.TipoUsuario = @inTipoUsuario) --Si no existe, se inserta el nuevo usuario.
				BEGIN
				-- La siguiente variable se utiliza para la agregación, buscando el ID mediante el documento de Identidad.
					DECLARE @inIdPersona INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inDocID); 
					INSERT INTO Municipalidad.dbo.Usuario
					(
						UserName,
						Password,
						TipoUsuario,
						IdPersona
					)
					VALUES
					(
						@inUsername,
						@inPassword,
						@inTipoUsuario,
						@inIdPersona
					)
				END
	END TRY
	BEGIN CATCH --Inserta el error en la tabla DBErrors, en caso de que exista alguno. 
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);

		SET @outResultCode = 50012;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertXML]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertXML]
AS 
BEGIN
delete from [dbo].[Usuario]
delete from [dbo].[Persona]
delete from [dbo].[TipoDocIdent] --Remueve los datos de la tabla
delete from [dbo].[TipoTerreno]
delete from [dbo].[TipoZona]
delete from [dbo].[ConceptoCobro]
DBCC CHECKIDENT ('TipoDocIdent', RESEED, 0) -- Se reinicia el id de la tabla(para que comience en 0)
DBCC CHECKIDENT ('TipoTerreno', RESEED, 0)
DBCC CHECKIDENT ('TipoZona', RESEED, 0) 
DECLARE @xmlData XML -- Se declara la variable XML

 SET @xmlData = ( -- Se define la variable XML, se utiliza la dirección del archivo
		SELECT *
		FROM OPENROWSET(BULK 'C:\Users\javie\Desktop\XML\Catalogo.xml', SINGLE_BLOB) 
		AS xmlData
		);

INSERT INTO [dbo].[TipoDocIdent] -- Se insertan los datos en la tabla X
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre, -- Se asigna el valor del atributo de la instanciaXML al atributo de la tabla 
	T.Item.value('@Mascara', 'VARCHAR(128)') AS Mascara
FROM @xmlData.nodes('Catalogo/TipoDocumentoIdentidades/TipoDocumentoIdentidad') -- Se selecciona la raiz/subraiz del arbol XML de interes
AS T(Item)

INSERT INTO [dbo].[TipoTerreno] -- Se insertan los datos en la tabla X
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre 
FROM @xmlData.nodes('Catalogo/TipoZonaPropiedades/TipoZonaPropiedad') -- Se selecciona la raiz/subraiz del arbol XML de interes
AS T(Item)

INSERT INTO [dbo].[TipoZona] 
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre 
FROM @xmlData.nodes('Catalogo/TipoZonaPropiedades/TipoZonaPropiedad') 
AS T(Item)

INSERT INTO [dbo].[TipoMovimientoConsumo]
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre 
FROM @xmlData.nodes('Catalogo/TipoZonaPropiedades/TipoZonaPropiedad') 
AS T(Item)

INSERT INTO [dbo].[ConceptoCobro]
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre,
	T.Item.value('@TipoMontoCC', 'VARCHAR(128)') AS TipoMontoCC ,
	T.Item.value('@PeriodoMontoCC', 'VARCHAR(128)') AS PeriodoMonto, 
	T.Item.value('@ValorMinimo', 'VARCHAR(128)') AS ValorMinimo ,
	T.Item.value('@ValorMinimoM3', 'VARCHAR(128)') AS ValorMinimoM3, 
	T.Item.value('@Valorm3', 'VARCHAR(128)') AS Valorm3 ,
	T.Item.value('@ValorPorcentual', 'VARCHAR(128)') AS ValorPorcentual ,
	T.Item.value('@ValorFijo', 'VARCHAR(128)') AS ValorFijo ,
	T.Item.value('@ValorM2Minimo', 'VARCHAR(128)') AS ValorM2Minimo,
	T.Item.value('@ValorTractosM2', 'VARCHAR(128)') AS ValorTractosM2,
	T.Item.value('@Nombre', 'VARCHAR(128)') AS ValorFijoM3Adicional
	
FROM @xmlData.nodes('Catalogo/CCs/CC') 
AS T(Item)

END
exec [dbo].[InsertXML]
GO
/****** Object:  StoredProcedure [dbo].[propiedadesPropietario]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[propiedadesPropietario]
	@inIdentificacion BIGINT,
	@outResultCode INT OUTPUT
	--Para mostrar las propiedades de un propietario, se utiliza su documento identidad.
AS
BEGIN

	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @inIdPersona INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inIdentificacion);
		SELECT PR.NumeroFinca, PR.Area, TZ.Nombre AS 'Tipo Zona', TT.Nombre AS 'Tipo Terreno' FROM dbo.PXP P
		INNER JOIN dbo.Propiedad PR
		ON P.IdPropiedad = PR.ID
		INNER JOIN dbo.TipoZona TZ
		ON PR.IdTipoZona = TZ.ID
		INNER JOIN dbo.TipoTerreno TT
		ON PR.IdTipoTerreno = TT.ID
		WHERE P.IdPersona = @inIdPersona;
		/*Lo anterior hecho combina tablas para mostrar los datos, donde al encontrar el ID de la persona se le agregan las tablas de la propiedad,
		el tipo de zona y el tipo terreno para mostrar los datos de la relación correctamente. 
		*/
	END TRY
	BEGIN CATCH --Atrapa errores en la ejecución del SP y los inserta en la tabla de errores.
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode = 50020;
	END CATCH 
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[propiedadesUsuario]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[propiedadesUsuario]
	@inUsername VARCHAR(128),
	@outResultCode INT OUTPUT
	--Para mostrar las propiedades visibles para un usuario, jse utiliza su username.
AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0;
BEGIN TRY
	DECLARE @inIdUsuario INT = (SELECT U.ID FROM dbo.Usuario U WHERE U.UserName = @inUsername);
	SELECT dbo.Propiedad.Area, dbo.Propiedad.FechaRegistro, dbo.Propiedad.NumeroFinca, dbo.TipoZona.Nombre AS 'Tipo Zona', dbo.TipoTerreno.Nombre AS 'Tipo Terreno'
	FROM dbo.PXU 
	INNER JOIN dbo.Propiedad ON Municipalidad.dbo.PXU.IdPropiedad = dbo.Propiedad.ID
	INNER JOIN dbo.TipoZona ON dbo.Propiedad.IdTipoZona = dbo.TipoZona.ID
	INNER JOIN dbo.TipoTerreno ON dbo.Propiedad.IdTipoTerreno = dbo.TipoTerreno.ID WHERE PXU.IdUsuario = @inIdUsuario;
	/*Lo anterior hecho se refiere a encontrar el Id del usuario usando su username, para luego unir varias tablas y encontrar la relación
	del usuario con las propiedades, para entonces usar inner join para mostrar los datos de las propiedades que corresponden a este usuario.
	*/
END TRY
BEGIN CATCH --Inserta errores en la tabla de errores, en caso de que existan.
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			SET @outResultCode = 50023;
END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[propietarioPropiedad]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[propietarioPropiedad]
	@inNumeroFinca INT,
	@outResultCode INT OUTPUT
	--Para mostrar el propietario de una propiedad, se utiliza el número de finca. 
AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0;
	BEGIN TRY
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		SELECT dbo.Persona.Nombre, dbo.Persona.email, dbo.Persona.ValorDocId, dbo.Persona.telefono1, dbo.Persona.telefono2 FROM dbo.PXP P 
		INNER JOIN Persona ON P.IdPersona = dbo.Persona.ID
		WHERE P.IdPropiedad = @inIdPropiedad;
		/*Lo hecho anteriormente básicamente busca el id de la propiedad usando el número de finca y luego selecciona los datos de la persona
		o las personas que son dueñas de esa propiedad, todo esto guiándose por el id de la propiedad.
		*/
	END TRY 
	BEGIN CATCH --Inserta errores en la tabla de errores, en caso de que existan. 
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode = 50022;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[readPerson]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[readPerson]
	@inValorDocId BIGINT,
	@outResultCode INT
	--Las personas se consultan por su número de documento de identidad.
AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0;
	BEGIN TRY
		SELECT P.[Nombre], P.[ValorDocId], P.[IdTipoDoc], P.[email], P.[telefono1], P.[telefono2] FROM dbo.Persona P WHERE P.ValorDocId = @inValorDocId;
		--Se consultó a la persona utilizando su documento identidad y se mostraron sus datos.
	END TRY
	BEGIN CATCH --Se insertan errores en la tabla de errores, en caso de que estos existan. 
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50006;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[readProperty]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[readProperty]
	@inNumeroFinca FLOAT, 
	@outResultCode INT OUTPUT
	--Las propiedades se consultarán con su área

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON
	BEGIN TRY
		SELECT P.[Area], P.[ValorFiscal], P.[FechaRegistro], P.[NumeroFinca] FROM dbo.Propiedad P
			WHERE P.NumeroFinca = @inNumeroFinca; --Se selecciona la propiedad correspondiente respecto a su número de finca. 
	END TRY
	BEGIN CATCH --Inserta errores en la tabla de errores en caso de que estos existan. 
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		SET @outResultCode = 50007;
	END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[readUser]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[readUser]
	@inUsername VARCHAR(128),
	@outResultCode INT OUTPUT
	--Para consultar un usuario, se utiliza su username.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT U.UserName, U.Password, U.TipoUsuario FROM dbo.Usuario U WHERE U.UserName = @inUsername;
		--Se seleccionó el usuario usando su username, se muestra su información.
	END TRY
	BEGIN CATCH --Inserta errores en la tabla de errores en caso de que estos existan.
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode = 50021;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[updatePerson]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updatePerson]
	@inNombre VARCHAR(128),
	@inValorDocId BIGINT,
	@inEmail VARCHAR(128),
	@inTelefono1 BIGINT,
	@inTelefono2 BIGINT,
	@outResultCode INT OUTPUT
	--Los parámetros anteriores permiten actualizar a la persona en cuestión.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		UPDATE Persona 
		SET Nombre = @inNombre, email = @inEmail, telefono1 = @inTelefono1, telefono2 = @inTelefono2
		WHERE ValorDocId = @inValorDocId; --Actualiza la persona en caso de existir.
	END TRY
	BEGIN CATCH --Inserta en la tabla de errores en caso de que algún error exista. 
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			Set @outResultCode=50003;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[updateProperty]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateProperty]
	@inNumeroFinca INT,
	@inArea FLOAT,
	@inValorFiscal VARCHAR(128),
	@outResultCode INT OUTPUT
	--Para actualizar una propiedad se necesita su finca y los datos que se actualizarán.
	
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
		BEGIN TRY
			UPDATE dbo.Propiedad -- Se actualiza la propiedad con respecto al ID, actualizando valores como el área y el valor fiscal
				SET Area = @inArea, ValorFiscal = @inValorFiscal
				WHERE NumeroFinca = @inNumeroFinca; --Siempre y cuando esta propiedad se haya encontrado. 
		END TRY
		BEGIN CATCH --Inserta en la tabla de errores en caso de que algún error exista.
			INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50009;
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[updateUser]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateUser]
	@inUsername VARCHAR(128),
	@inPassword VARCHAR(128),
	@inNewUsername VARCHAR(128),
	@inNewPassword VARCHAR(128),
	@inNewTipoUsuario VARCHAR(128),
	@outResultCode INT OUTPUT
	--Los parámetros anteriores son propios de los usuarios y permiten localizarlos y modificarlos. 
AS
BEGIN
	SET NOCOUNT ON; 
	SET @outResultCode = 0;
	BEGIN TRY
		IF EXISTS(SELECT U.UserName, U.Password, U.TipoUsuario FROM dbo.Usuario U WHERE
					UserName = @inUsername and Password = @inPassword)
				BEGIN
					UPDATE dbo.Usuario
					SET UserName = @inNewUsername, Password = @inNewPassword, TipoUsuario = @inNewTipoUsuario
					WHERE UserName = @inUsername and Password = @inPassword
				END
		--Las instrucciones anteriores encuentran al usuario en caso de que exista y actualizan sus datos.
	END TRY
	BEGIN CATCH --Se insertan errores en la tabla de errores en caso de que estos existan.
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			SET @outResultCode=50015;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[usuariosPropiedad]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuariosPropiedad]
	@inNumeroFinca INT, 
	@outResultCode INT OUTPUT
	--Para consultar los usuarios de una propiedad, se utiliza el número de finca para encontrar la propiedad.

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY 
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		SELECT dbo.Usuario.UserName, dbo.Usuario.Password FROM dbo.Usuario  
		INNER JOIN dbo.PXU ON dbo.Usuario.ID = dbo.PXU.IdUsuario WHERE dbo.PXU.IdPropiedad = @inIdPropiedad;
		/*Lo hecho en las líneas anteriores encuentra el ID de la propiedad usando su número de finca, para luego
		unir la tabla de usuario con la de la relación con tal de mostrar los datos correspondientes, todo esto siempre y cuando
		exista el ID de la finca y se asocie con alguna relación.
		*/

	END TRY
	BEGIN CATCH --Se insertan errores en la tabla de errores en caso de que exista alguno. 
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			SET @outResultCode = 50024;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[validateLogin]    Script Date: 17/10/2022 09:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[validateLogin]
	@inUsername VARCHAR(128),
	@inPassword VARCHAR(128),
	@outResultCode INT OUTPUT
	--Los parámetros anteriores se ingresan en el login y así se valida el usuario.
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
	DECLARE @inValidate INT; --Variable para la validación de los parámetros.
		SET @outResultCode = 0; --Quiere decir que no hubo errores
		IF EXISTS(SELECT U.UserName, U.Password FROM dbo.Usuario U WHERE U.UserName = @inUsername and U.Password = @inPassword) --Verifica que el usuario exista
			BEGIN
				IF EXISTS(SELECT U.UserName, U.Password FROM dbo.Usuario U WHERE U.UserName = @inUsername and U.Password = @inPassword and U.TipoUsuario = 'Propietario') --Verifica si es un usuario
					BEGIN
						SET @inValidate = 2; --Si es propietario, se retorna 2
						RETURN @inValidate;
					END
				ELSE
					BEGIN
						SET @inValidate = 1; --Si es administrador, se retorna 1
						RETURN @inValidate;				
					END
			END
		ELSE
			BEGIN
				SET @inValidate = 0; --Si no se encontró el usuario, se retorna cero
				RETURN @inValidate;
			END
	END TRY
	BEGIN CATCH --Toma errores en caso de que ocurran
		BEGIN
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			Set @outResultCode=50001; --Establece el código de error 
		END
	END CATCH
	SET NOCOUNT OFF;
END
declare @a INT;
EXEC @a =  [dbo].[validateLogin] finickySmelt5,a0S4fq,0
PRINT @a
GO
USE [master]
GO
ALTER DATABASE [Municipalidad] SET  READ_WRITE 
GO
