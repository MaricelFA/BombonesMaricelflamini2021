USE [master]
GO
/****** Object:  Database [BombonesSqlFlamini]    Script Date: 16/03/2021 21:04:53 ******/
CREATE DATABASE [BombonesSqlFlamini]
go
ALTER DATABASE [BombonesSqlFlamini] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BombonesSqlFlamini].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BombonesSqlFlamini] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET ARITHABORT OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BombonesSqlFlamini] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BombonesSqlFlamini] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BombonesSqlFlamini] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BombonesSqlFlamini] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET RECOVERY FULL 
GO
ALTER DATABASE [BombonesSqlFlamini] SET  MULTI_USER 
GO
ALTER DATABASE [BombonesSqlFlamini] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BombonesSqlFlamini] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BombonesSqlFlamini] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BombonesSqlFlamini] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BombonesSqlFlamini] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BombonesSql', N'ON'
GO
ALTER DATABASE [BombonesSqlFlamini] SET QUERY_STORE = OFF
GO
USE [BombonesSqlFlamini]
GO
/****** Object:  Table [dbo].[Bombones]    Script Date: 16/03/2021 21:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bombones](
	[BombonId] [int] IDENTITY(1,1) NOT NULL,
	[NombreBombon] [nvarchar](255) NOT NULL,
	[TipoChocolateId] [int] NOT NULL,
	[TipoNuezId] [int] NOT NULL,
	[TipoRellenoId] [int] NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Costo] [money] NOT NULL,
	[CantidadEnExistencia] [smallint] NOT NULL,
 CONSTRAINT [PK_Bombones] PRIMARY KEY CLUSTERED 
(
	[BombonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 16/03/2021 21:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [int] NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[DNI] [nvarchar](20) NOT NULL,
	[Calle] [nvarchar](100) NOT NULL,
	[Altura] [nvarchar](10) NULL,
	[Entre1] [nvarchar](100) NULL,
	[Entre2] [nvarchar](100) NULL,
	[ProvinciaId] [int] NOT NULL,
	[LocalidadId] [int] NOT NULL,
	[CodigoPostal] [nchar](10) NULL,
	[TelefonoFijo] [nvarchar](20) NULL,
	[TelefonoMovil] [nvarchar](20) NULL,
	[CorreoElectronico] [nvarchar](120) NULL,
	[SituacionIvaId] [int] NOT NULL,
	[Observaciones] [nvarchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 16/03/2021 21:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[LocalidadId] [int] IDENTITY(1,1) NOT NULL,
	[ProvinciaId] [int] NOT NULL,
	[NombreLocalidad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Localidades] PRIMARY KEY CLUSTERED 
(
	[LocalidadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 16/03/2021 21:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[ProvinciaId] [int] IDENTITY(1,1) NOT NULL,
	[NombreProvincia] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Provincias] PRIMARY KEY CLUSTERED 
(
	[ProvinciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeNuez]    Script Date: 16/03/2021 21:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDeNuez](
	[TipoDeNuezId] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoDeNuez] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_TiposDeNuez] PRIMARY KEY CLUSTERED 
(
	[TipoDeNuezId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeChocolate]    Script Date: 16/03/2021 21:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeChocolate](
	[TipoChocolateId] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoChocolate] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_TiposDeChocolate] PRIMARY KEY CLUSTERED 
(
	[TipoChocolateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeRelleno]    Script Date: 16/03/2021 21:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeRelleno](
	[TipoRellenoId] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoRelleno] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_TiposDeRelleno] PRIMARY KEY CLUSTERED 
(
	[TipoRellenoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bombones] ON 
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (1, N'Almendra Ambrosia', 4, 1, 1, N'Avellana clásica con amaretto.', 44.0000, 30)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (2, N'Manzana Amore', 3, 1, 12, N'Cremoso chocolate con leche diseñado en forma de manzana con hojas de almendro.', 24.0000, 9)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (3, N'Almendra Suprema', 4, 1, 12, N'Almendras enteras inmersas en chocolate oscuro.', 30.0000, 2)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (4, N'Extasis Crepuscular', 1, 2, 6, N'Almendra con crema de moca recubierto de chocolate agridulce', 33.0000, 29)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (5, N'Anacardo Suprema', 4, 2, 12, N'Almendra gigante rodeada de chocolate oscuro.', 33.0000, 3)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (6, N'Avellana Amaretto', 3, 3, 1, N'Avellana clásica y amaretto envueltos en chocolate con leche.', 36.0000, 12)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (7, N'Avellana Virgen', 3, 3, 5, N'Las avellanas más suaves cubiertas por un cremoso chocolate con leche.', 26.0000, 0)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (8, N'Avellana Moca', 3, 3, 6, N'Avellana clásica y crema de moca suavizados con chocolate con leche.', 33.0000, 4)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (9, N'Avellana Amarga', 1, 3, 12, N'Clásica Avellana cubierta de chocolate Agridulce', 24.0000, 8)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (10, N'Corazón Destrozado', 2, 3, 12, N'Dos mitades de bombón bañadas en chocolate blando con avellanas', 30.0000, 19)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (11, N'Avellana Suprema', 4, 3, 12, N'Avellanas enteras inmersas en chocolate oscuro.', 21.0000, 8)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (12, N'Brasileño Supremo', 2, 4, 12, N'Una castaña del Brasil entera bañada en chocolate blanco.', 28.0000, 3)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (13, N'Chocolate Kiwi', 4, 4, 12, N'Castaña del Brasil rodeada de oscuro chocolate, una sección transversal parecida a la del fruto del kiwi.', 29.0000, 30)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (14, N'Macadamia Suprema', 3, 5, 12, N'Macadamia entera rodeada de chocolate con leche.', 40.0000, 6)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (15, N'Baya Agridulce', 1, 6, 2, N'Bayas de las Islas Orcas cubiertas con chocolate amargodulce', 25.0000, 14)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (16, N'Baya Dulce', 3, 6, 2, N'Bayas de las islas Orcas endulzadas con cremoso chocolate con leche.', 26.0000, 20)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (17, N'Cereza Agridulce', 1, 6, 3, N'Cereza Ana Real cubierto con chocolate Agridulce para conseguir ese toque de realeza.', 26.0000, 18)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (18, N'Cereza Dulce', 3, 6, 3, N'Cerezas Royal Anne endulzadas con cremoso chocolate con leche.', 27.0000, 17)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (19, N'Cereza Clásica', 4, 6, 3, N'Cereza entera en chocolate oscuro clásico', 28.0000, 30)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (20, N'Palma Tropical', 3, 6, 4, N'Chocolate con leche en forma de palma tropical rellena con coco.', 23.0000, 24)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (21, N'Corazón Amante', 3, 6, 5, N'Chocolate con leche en forma de corazón con dulce crema de cerezas a modo de relleno..', 25.0000, 21)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (22, N'Corazón Envuelto', 4, 6, 5, N'Chocolate oscuro con un coración de crema de cereza.', 32.0000, 24)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (23, N'Frambuesa Agridulce', 1, 6, 7, N'Fabulosas fresas salvajes cubiertas con chocolate agridulce para darles ese toque alpino.', 23.0000, 13)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (24, N'Frambuesa dulce', 5, 6, 7, N'Fabulosas fresas salvajes endulzadas con un cremoso chocolate con leche', 20.0000, 30)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (25, N'Delicia Mantequilla Cacahuate', 3, 6, 8, N'Duave y cremosa mantequilla de cacahuete de los más finos cacahuetes del Senegal, envuelta en chocolate con leche.', 21.0000, 2)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (26, N'Mazapán Hoja de roble', 1, 6, 9, N'Mazapán con la legendaria forma de hoja de roble con una cubierta de suave chocolate', 40.0000, 28)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (27, N'Golondrina de Mazapán', 2, 6, 9, N'Mazapán con forma de golondrina con alas de chocolate blanco.', 34.0000, 19)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (28, N'Arce de Mazapán', 3, 6, 9, N'Mazapán con forma de hoja de arce con un envoltorio de chocolate con leche.', 37.0000, 26)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (29, N'Maravilla Mazapán', 3, 6, 9, N'Mazapán en forma de almendra con una capa de chocolate con leche ', 33.0000, 25)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (30, N'Mazapán Pinzón', 3, 6, 9, N'Mazapán con pistachos, bañados en chocolate con leche', 32.0000, 15)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (31, N'Mazapán Delicia', 4, 6, 9, N'Delicioso mazapán con chocolate oscuro.', 38.0000, 23)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (32, N'Mermelada Agridulce', 1, 6, 10, N'Mermelada recubierta con chocolate Agridulce para conseguir ese toque británico.', 17.0000, 18)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (33, N'Mermelada Dulce', 3, 6, 10, N'Mermelada hecha con naranjas valencianas endulzada con cremoso chocolate con leche.', 18.0000, 30)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (34, N'Mora Agridulce', 1, 6, 11, N'Moras de las montañas Cascadas cubiertas con chocolate agridulce para darle ese toque alpino.', 25.0000, 5)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (35, N'No me olvides', 3, 6, 11, N'Bayas rellenas de chocolate con leche inolvidables, envueltas en delicados no me olvides.', 19.0000, 26)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (36, N'Calla Lily', 2, 6, 12, N'Elegante chocolate blando esculpido con forma de lirio.', 27.0000, 16)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (37, N'Belleza Americana', 4, 6, 12, N'Riquísimo chocolate oscuro esculpido con la forma de un capullo de rosa Belleza Americana.', 24.0000, 16)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (38, N'Nuez  Moca', 5, 7, 6, N'Dulce y cremosa moca con nueces', 19.0000, 3)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (39, N'Pistacho Moca', 5, 8, 6, N'Dulce y cremosa moca con pistachos', 21.0000, 28)
GO
INSERT [dbo].[Bombones] ([BombonId], [NombreBombon], [TipoChocolateId], [TipoNuezId], [TipoRellenoId], [Descripcion], [Costo], [CantidadEnExistencia]) VALUES (40, N'Pistacho Supremo', 3, 8, 12, N'Conjunto de frutos de pistacho rodeados de chocolate con leche.', 30.0000, 5)
GO
SET IDENTITY_INSERT [dbo].[Bombones] OFF
GO
INSERT [dbo].[Clientes] ([ClienteId], [Apellido], [Nombres], [DNI], [Calle], [Altura], [Entre1], [Entre2], [ProvinciaId], [LocalidadId], [CodigoPostal], [TelefonoFijo], [TelefonoMovil], [CorreoElectronico], [SituacionIvaId], [Observaciones]) VALUES (2, N'Perez', N'Juan', N'14444444', N'Calle 1', N'1250', N'', N'', 1, 1, N'          ', N'', N'15151515', N'', 1, N'')
GO
SET IDENTITY_INSERT [dbo].[Localidades] ON 
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (18, 1, N'Azul')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (5, 1, N'Cañuelas')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (12, 1, N'General Las Heras')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (16, 1, N'Lobería')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (1, 1, N'Lobos')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (24, 1, N'Monte')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (26, 1, N'Olavarria')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (2, 1, N'Roque Perez')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (25, 1, N'Saladillo')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (20, 2, N'Colon')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (19, 2, N'Curuzu Cuatia')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (3, 3, N'Cosquín')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (9, 3, N'Rio Cuarto')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (23, 3, N'Rio Primero')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (4, 3, N'Río Tercero')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (10, 6, N'Resistencia')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (13, 13, N'Santa Rosa')
GO
INSERT [dbo].[Localidades] ([LocalidadId], [ProvinciaId], [NombreLocalidad]) VALUES (15, 31, N'Gualeguay')
GO
SET IDENTITY_INSERT [dbo].[Localidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincias] ON 
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (1, N'Buenos Aires')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (4, N'Catamarca')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (6, N'Chaco')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (15, N'Chubut')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (3, N'Córdoba')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (2, N'Corrientes')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (31, N'Entre Rios')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (33, N'Formosa')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (13, N'La Pampa')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (25, N'Mendoza')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (30, N'Misiones')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (10, N'Neuquen')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (5, N'Rio Negro')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (14, N'Salta')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (38, N'San Luis')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (22, N'Santa Fe')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (39, N'Santiago del Estero')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (44, N'Tierra del Fuego')
GO
INSERT [dbo].[Provincias] ([ProvinciaId], [NombreProvincia]) VALUES (43, N'Tucumán')
GO
SET IDENTITY_INSERT [dbo].[Provincias] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDeNuez] ON 
GO
INSERT [dbo].[TipoDeNuez] ([TipoDeNuezId], [NombreTipoDeNuez]) VALUES (1, N'Almendra')
GO
INSERT [dbo].[TipoDeNuez] ([TipoDeNuezId], [NombreTipoDeNuez]) VALUES (2, N'Anacardo')
GO
INSERT [dbo].[TipoDeNuez] ([TipoDeNuezId], [NombreTipoDeNuez]) VALUES (3, N'Avellana')
GO
INSERT [dbo].[TipoDeNuez] ([TipoDeNuezId], [NombreTipoDeNuez]) VALUES (4, N'Castaña del Brasil')
GO
INSERT [dbo].[TipoDeNuez] ([TipoDeNuezId], [NombreTipoDeNuez]) VALUES (5, N'Macadamia')
GO
INSERT [dbo].[TipoDeNuez] ([TipoDeNuezId], [NombreTipoDeNuez]) VALUES (6, N'Ninguna')
GO
INSERT [dbo].[TipoDeNuez] ([TipoDeNuezId], [NombreTipoDeNuez]) VALUES (7, N'Nuez')
GO
INSERT [dbo].[TipoDeNuez] ([TipoDeNuezId], [NombreTipoDeNuez]) VALUES (8, N'Pistacho')
GO
SET IDENTITY_INSERT [dbo].[TipoDeNuez] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDeChocolate] ON 
GO
INSERT [dbo].[TiposDeChocolate] ([TipoChocolateId], [NombreTipoChocolate]) VALUES (1, N'Agridulce')
GO
INSERT [dbo].[TiposDeChocolate] ([TipoChocolateId], [NombreTipoChocolate]) VALUES (2, N'Blanco')
GO
INSERT [dbo].[TiposDeChocolate] ([TipoChocolateId], [NombreTipoChocolate]) VALUES (3, N'Leche')
GO
INSERT [dbo].[TiposDeChocolate] ([TipoChocolateId], [NombreTipoChocolate]) VALUES (4, N'Oscuro')
GO
INSERT [dbo].[TiposDeChocolate] ([TipoChocolateId], [NombreTipoChocolate]) VALUES (5, N'Puro')
GO
SET IDENTITY_INSERT [dbo].[TiposDeChocolate] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDeRelleno] ON 
GO
INSERT [dbo].[TiposDeRelleno] ([TipoRellenoId], [NombreTipoRelleno]) VALUES (1, N'Amaretto')
GO
INSERT [dbo].[TiposDeRelleno] ([TipoRellenoId], [NombreTipoRelleno]) VALUES (2, N'Baya')
GO
INSERT [dbo].[TiposDeRelleno] ([TipoRellenoId], [NombreTipoRelleno]) VALUES (3, N'Cereza entera')
GO
INSERT [dbo].[TiposDeRelleno] ([TipoRellenoId], [NombreTipoRelleno]) VALUES (4, N'Coco')
GO
INSERT [dbo].[TiposDeRelleno] ([TipoRellenoId], [NombreTipoRelleno]) VALUES (5, N'Crema de cereza')
GO
INSERT [dbo].[TiposDeRelleno] ([TipoRellenoId], [NombreTipoRelleno]) VALUES (6, N'Crema de Moca')
GO
INSERT [dbo].[TiposDeRelleno] ([TipoRellenoId], [NombreTipoRelleno]) VALUES (7, N'Fresa')
GO
INSERT [dbo].[TiposDeRelleno] ([TipoRellenoId], [NombreTipoRelleno]) VALUES (8, N'Mantequilla cacahuate')
GO
INSERT [dbo].[TiposDeRelleno] ([TipoRellenoId], [NombreTipoRelleno]) VALUES (9, N'Mazapán')
GO
INSERT [dbo].[TiposDeRelleno] ([TipoRellenoId], [NombreTipoRelleno]) VALUES (10, N'Mermelada')
GO
INSERT [dbo].[TiposDeRelleno] ([TipoRellenoId], [NombreTipoRelleno]) VALUES (11, N'Mora')
GO
INSERT [dbo].[TiposDeRelleno] ([TipoRellenoId], [NombreTipoRelleno]) VALUES (12, N'Ninguno')
GO
SET IDENTITY_INSERT [dbo].[TiposDeRelleno] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX__Localidades_ProvinciaId_Localidades]    Script Date: 16/03/2021 21:04:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX__Localidades_ProvinciaId_Localidades] ON [dbo].[Localidades]
(
	[ProvinciaId] ASC,
	[NombreLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Provincias_NombreProvincia]    Script Date: 16/03/2021 21:04:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Provincias_NombreProvincia] ON [dbo].[Provincias]
(
	[NombreProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TiposDeNuez_NombreTipoDeNuez]    Script Date: 16/03/2021 21:04:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TiposDeNuez_NombreTipoDeNuez] ON [dbo].[TipoDeNuez]
(
	[NombreTipoDeNuez] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TiposDeChocolate_NombreTipoChocolate]    Script Date: 16/03/2021 21:04:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TiposDeChocolate_NombreTipoChocolate] ON [dbo].[TiposDeChocolate]
(
	[NombreTipoChocolate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TiposDeRelleno_TipoRelleno]    Script Date: 16/03/2021 21:04:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TiposDeRelleno_TipoRelleno] ON [dbo].[TiposDeRelleno]
(
	[NombreTipoRelleno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bombones]  WITH CHECK ADD  CONSTRAINT [FK_Bombones_TipoDeNuez] FOREIGN KEY([TipoNuezId])
REFERENCES [dbo].[TipoDeNuez] ([TipoDeNuezId])
GO
ALTER TABLE [dbo].[Bombones] CHECK CONSTRAINT [FK_Bombones_TipoDeNuez]
GO
ALTER TABLE [dbo].[Bombones]  WITH CHECK ADD  CONSTRAINT [FK_Bombones_TiposDeChocolate] FOREIGN KEY([TipoChocolateId])
REFERENCES [dbo].[TiposDeChocolate] ([TipoChocolateId])
GO
ALTER TABLE [dbo].[Bombones] CHECK CONSTRAINT [FK_Bombones_TiposDeChocolate]
GO
ALTER TABLE [dbo].[Bombones]  WITH CHECK ADD  CONSTRAINT [FK_Bombones_TiposDeRelleno] FOREIGN KEY([TipoRellenoId])
REFERENCES [dbo].[TiposDeRelleno] ([TipoRellenoId])
GO
ALTER TABLE [dbo].[Bombones] CHECK CONSTRAINT [FK_Bombones_TiposDeRelleno]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Localidades] FOREIGN KEY([LocalidadId])
REFERENCES [dbo].[Localidades] ([LocalidadId])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Localidades]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Provincias] FOREIGN KEY([ProvinciaId])
REFERENCES [dbo].[Provincias] ([ProvinciaId])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Provincias]
GO
ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD  CONSTRAINT [FK_Localidades_Provincias] FOREIGN KEY([ProvinciaId])
REFERENCES [dbo].[Provincias] ([ProvinciaId])
GO
ALTER TABLE [dbo].[Localidades] CHECK CONSTRAINT [FK_Localidades_Provincias]
GO
USE [master]
GO
ALTER DATABASE [BombonesSqlFlamini] SET  READ_WRITE 
GO
