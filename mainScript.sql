USE [master]
GO
/****** Object:  Database [Municipalidad]    Script Date: 1/10/2022 16:32:24 ******/
CREATE DATABASE [Municipalidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Municipalidad', FILENAME = N'D:\MSSQLMS\MSSQL15.MSSQLSERVER\MSSQL\DATA\Municipalidad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Municipalidad_log', FILENAME = N'D:\MSSQLMS\MSSQL15.MSSQLSERVER\MSSQL\DATA\Municipalidad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[ConceptoCobro]    Script Date: 1/10/2022 16:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConceptoCobro](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_ConceptoCobro] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBErrors]    Script Date: 1/10/2022 16:32:24 ******/
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
/****** Object:  Table [dbo].[DetalleCC]    Script Date: 1/10/2022 16:32:24 ******/
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
/****** Object:  Table [dbo].[DetalleCCAgua]    Script Date: 1/10/2022 16:32:24 ******/
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
/****** Object:  Table [dbo].[employee]    Script Date: 1/10/2022 16:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](10) NULL,
	[last_name] [varchar](10) NULL,
	[salary] [decimal](10, 2) NULL,
	[city] [varchar](20) NULL,
 CONSTRAINT [PK__employee__3213E83F1B9AD7FF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 1/10/2022 16:32:24 ******/
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
/****** Object:  Table [dbo].[MovimientoConsumo]    Script Date: 1/10/2022 16:32:24 ******/
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
/****** Object:  Table [dbo].[Persona]    Script Date: 1/10/2022 16:32:24 ******/
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
/****** Object:  Table [dbo].[Propiedad]    Script Date: 1/10/2022 16:32:24 ******/
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
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Propiedad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropiedadCCAgua]    Script Date: 1/10/2022 16:32:24 ******/
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
/****** Object:  Table [dbo].[PropiedadXCC]    Script Date: 1/10/2022 16:32:24 ******/
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
/****** Object:  Table [dbo].[PXP]    Script Date: 1/10/2022 16:32:24 ******/
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
/****** Object:  Table [dbo].[TipoDocIdent]    Script Date: 1/10/2022 16:32:24 ******/
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
/****** Object:  Table [dbo].[TipoMovimientoConsumo]    Script Date: 1/10/2022 16:32:24 ******/
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
/****** Object:  Table [dbo].[TipoTerreno]    Script Date: 1/10/2022 16:32:24 ******/
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
/****** Object:  Table [dbo].[TipoZona]    Script Date: 1/10/2022 16:32:24 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 1/10/2022 16:32:24 ******/
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
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (1, N'Axel', 118920438, 1, N'axelchaves.r@hotmail.com', 83607311, 27676605)
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDocIdent] ON 

INSERT [dbo].[TipoDocIdent] ([ID], [Nombre], [Mascara]) VALUES (1, N'Cedula', N'x-xxxx-xxxx')
SET IDENTITY_INSERT [dbo].[TipoDocIdent] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (7, N'axcha', N'aaa', N'Usuario', 1)
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
ALTER TABLE [dbo].[Propiedad]  WITH CHECK ADD  CONSTRAINT [FK_Propiedad_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[Propiedad] CHECK CONSTRAINT [FK_Propiedad_Usuario]
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
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Persona]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarPersona]    Script Date: 1/10/2022 16:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ActualizarPersona]
	-- AQUI SE PUEDEN AGREGAR MAS VARIABLES DE ENTRADA
	@inNombre VARCHAR(128),	 
	@inValorDocId BIGINT,
	@TipoDoc VARCHAR(128),
	@email	VARCHAR(128),
	@tele1	BIGINT,
	@tele2	BIGINT,
	@outResultCode INT OUTPUT		-- Codigo de resultado del SP
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- Se validan los datos de entrada, pues no estamos seguros que se validaron en capa logica.
	-- Validar que articulo exista.	
	BEGIN TRY
		SET @outResultCode=0;  -- Por default codigo error 0 es que no hubo error
		-- Inicia codigo en el cual se captura errores
		DECLARE @inIdTipoDoc INT;
		SELECT @inIdTipoDoc = T.ID
		FROM dbo.TipoDocIdent T
		WHERE T.Nombre = @TipoDoc;
		
		BEGIN TRANSACTION tActualizarPersona		-- NOMBRE DE LA TRANSACCION SIMILAR AL PROCEDURE PERO CON UNA "T" AL INICIO			
			-- actualizamos 
			UPDATE [dbo].[Persona] 
			SET Nombre = @inNombre,
			ValorDocId =  @inValorDocId,
			 IdTipoDoc = @inIdTipoDoc,
			 email  = @email,
			telefono1 = @tele1,
			 telefono2 = @tele2
			
			-- salvamos en evento log el evento de actualizar el articulo
			-- INSERT INTO DBO.EventLog VALUES()
		COMMIT TRANSACTION tActualizarPersona
	END TRY

	BEGIN CATCH		
		IF @@TRANCOUNT> 0  -- error sucedio dentro de la transaccion
		BEGIN
			ROLLBACK TRANSACTION tActualizarPersona; -- se deshacen los cambios realizados
		END;
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
		Set @outResultCode=50007;
	END CATCH
	SET NOCOUNT OFF;
END;

GO
/****** Object:  StoredProcedure [dbo].[InsertarPersona]    Script Date: 1/10/2022 16:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InsertarPersona]
	-- AQUI SE PUEDEN AGREGAR MAS VARIABLES DE ENTRADA
	@inNombre VARCHAR(128),	 
	@inValorDocId BIGINT,
	@TipoDoc VARCHAR(128),
	@email	VARCHAR(128),
	@tele1	BIGINT,
	@tele2	BIGINT,
	@outResultCode INT OUTPUT		-- Codigo de resultado del SP
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- Se validan los datos de entrada, pues no estamos seguros que se validaron en capa logica.
	-- Validar que articulo exista.	
	BEGIN TRY
		SET @outResultCode=0;  -- Por default codigo error 0 es que no hubo error
		-- Inicia codigo en el cual se captura errores
		DECLARE @inIdTipoDoc INT;
		SELECT @inIdTipoDoc = T.ID
		FROM dbo.TipoDocIdent T
		WHERE T.Nombre = @TipoDoc;
		
		BEGIN TRANSACTION tInsertarPersona		-- NOMBRE DE LA TRANSACCION SIMILAR AL PROCEDURE PERO CON UNA "T" AL INICIO			
			-- actualizamos 
			INSERT INTO [dbo].[Persona] (
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
			, @email
			, @tele1
			, @tele2
			)
			-- salvamos en evento log el evento de actualizar el articulo
			-- INSERT INTO DBO.EventLog VALUES()
		COMMIT TRANSACTION tInsertarPersona	
	END TRY

	BEGIN CATCH		
		IF @@TRANCOUNT> 0  -- error sucedio dentro de la transaccion
		BEGIN
			ROLLBACK TRANSACTION tInsertarPersona; -- se deshacen los cambios realizados
		END;
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
		Set @outResultCode=50007;
	END CATCH
	SET NOCOUNT OFF;
END;

GO
/****** Object:  StoredProcedure [dbo].[SP_MACHOTE]    Script Date: 1/10/2022 16:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_MACHOTE]
    -- PARAMETROS SEPARADOS POR COMAS Y LA PALABRA in
    -- EJEMPLO: @inNombre, @inClase
    @outResultCode INT OUTPUT   --ESTA VARIABLE DEBE SER INCLUIDA EN TODOS LOS SP
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- Se validan los datos de entrada, pues no estamos seguros que se validaron en capa logica.
	-- Validar que articulo exista.	
	BEGIN TRY
		-- Inicia codigo en el cual se captura errores		
		SET @outResultCode=0;  -- Por default codigo error 0 es que no hubo error		
		
        BEGIN
            SELECT [U.Username], [U.Password]
            FROM [dbo.Usuario U]            
            ORDER BY U.UserName;
        END;

	/*BEGIN TRANSACTION tSP_MACHOTE		-- NOMBRE DE LA TRANSACCION SIMILAR AL PROCEDURE PERO CON UNA "T" AL INICIO
			-- Obtenemos el idClaseArticulo con base al nombre de la clase de articulo
			-- A traves de un mapeo
			
			INSERT INTO dbo.Articulo(Nombre, IdClaseArticulo, Precio)       -- EJEMPLO DE TRANSACTION
			VALUES (@nombre, @idClase, @precio)

			-- salvamos en evento log el evento de actualizar el articulo
			-- INSERT INTO DBO.EventLog VALUES()
            
		COMMIT TRANSACTION tSP_MACHOTE	*/
	END TRY

	BEGIN CATCH		
		/*IF @@TRANCOUNT> 0  -- error sucedio dentro de la transaccion
		BEGIN
			ROLLBACK TRANSACTION tSP_MACHOTE; -- se deshacen los cambios realizados
		END;*/
		INSERT INTO dbo.BDErrors VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50001;
	END CATCH
	SET NOCOUNT OFF;
END;

GO
/****** Object:  StoredProcedure [dbo].[validateLogin]    Script Date: 1/10/2022 16:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[validateLogin]
	@inUsername VARCHAR(128),
	@inPassword VARCHAR(128),
	@outResultCode INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
	DECLARE @inValidate INT; --Variable para la validación de los parámetros.
		SET @outResultCode = 0; --Quiere decir que no hubo errores
		IF EXISTS(SELECT U.UserName, U.Password FROM dbo.Usuario U WHERE U.UserName = @inUsername and U.Password = @inPassword) --Verifica que el usuario exista
			BEGIN
				IF EXISTS(SELECT U.UserName, U.Password FROM dbo.Usuario U WHERE U.UserName = @inUsername and U.Password = @inPassword and U.TipoUsuario = 'Usuario') --Verifica si es un usuario
					BEGIN
						SET @inValidate = 2; --Si es usuario, se retorna 2
						RETURN @inValidate;
					END
				ELSE
					BEGIN
						SET @inValidate = 1; --Si es propietario, se retorna 1
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
		IF @@TRANCOUNT > 0
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
GO
USE [master]
GO
ALTER DATABASE [Municipalidad] SET  READ_WRITE 
GO
