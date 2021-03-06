USE [master]
GO
/****** Object:  Database [ProyectoNT1]    Script Date: 6/12/2018 18:38:25 ******/
CREATE DATABASE [ProyectoNT1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoNT1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProyectoNT1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoNT1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProyectoNT1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProyectoNT1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoNT1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoNT1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoNT1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoNT1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoNT1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoNT1] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoNT1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoNT1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoNT1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoNT1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoNT1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoNT1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoNT1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoNT1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoNT1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoNT1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoNT1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoNT1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoNT1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoNT1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoNT1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoNT1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoNT1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoNT1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProyectoNT1] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoNT1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoNT1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoNT1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoNT1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoNT1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoNT1] SET QUERY_STORE = OFF
GO
USE [ProyectoNT1]
GO
/****** Object:  Table [dbo].[obraSocial]    Script Date: 6/12/2018 18:38:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[obraSocial](
	[idObraSocial] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_obraSocial] PRIMARY KEY CLUSTERED 
(
	[idObraSocial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paciente]    Script Date: 6/12/2018 18:38:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente](
	[idPaciente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apellido] [varchar](30) NOT NULL,
	[dni] [numeric](8, 0) NOT NULL,
	[telefono] [numeric](18, 0) NULL,
	[mail] [varchar](30) NOT NULL,
	[idObraSocial] [int] NOT NULL,
	[sexo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_paciente] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profesional]    Script Date: 6/12/2018 18:38:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profesional](
	[idProfesional] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[dni] [numeric](8, 0) NOT NULL,
	[telefono] [numeric](18, 0) NULL,
	[mail] [varchar](30) NOT NULL,
	[matricula] [varchar](15) NOT NULL,
 CONSTRAINT [PK_profesionales] PRIMARY KEY CLUSTERED 
(
	[idProfesional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[turno]    Script Date: 6/12/2018 18:38:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turno](
	[idPaciente] [int] NOT NULL,
	[idProfesional] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[idTurno] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_turno] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[obraSocial] ON 

INSERT [dbo].[obraSocial] ([idObraSocial], [nombre]) VALUES (3, N'--Seleccione su Obra Social--')
INSERT [dbo].[obraSocial] ([idObraSocial], [nombre]) VALUES (4, N'OSDE')
INSERT [dbo].[obraSocial] ([idObraSocial], [nombre]) VALUES (5, N'Swiss Medical')
SET IDENTITY_INSERT [dbo].[obraSocial] OFF
SET IDENTITY_INSERT [dbo].[paciente] ON 

INSERT [dbo].[paciente] ([idPaciente], [nombre], [apellido], [dni], [telefono], [mail], [idObraSocial], [sexo]) VALUES (8, N'Marina', N'Burkhardt', CAST(1234567 AS Numeric(8, 0)), CAST(1501010101 AS Numeric(18, 0)), N'marina@gmail.com', 4, N'Mujer')
INSERT [dbo].[paciente] ([idPaciente], [nombre], [apellido], [dni], [telefono], [mail], [idObraSocial], [sexo]) VALUES (9, N'Federico', N'Godoy Leiva', CAST(2345678 AS Numeric(8, 0)), NULL, N'pox@gmail.com', 5, N'Hombre')
INSERT [dbo].[paciente] ([idPaciente], [nombre], [apellido], [dni], [telefono], [mail], [idObraSocial], [sexo]) VALUES (10, N'Sergio', N'Cima', CAST(1342567 AS Numeric(8, 0)), CAST(1543536373 AS Numeric(18, 0)), N'sergio@gmail.com', 4, N'Hombre')
INSERT [dbo].[paciente] ([idPaciente], [nombre], [apellido], [dni], [telefono], [mail], [idObraSocial], [sexo]) VALUES (11, N'Melina', N'Valdez', CAST(7654321 AS Numeric(8, 0)), NULL, N'melina@gmail.com', 4, N'Mujer')
SET IDENTITY_INSERT [dbo].[paciente] OFF
SET IDENTITY_INSERT [dbo].[profesional] ON 

INSERT [dbo].[profesional] ([idProfesional], [nombre], [apellido], [dni], [telefono], [mail], [matricula]) VALUES (7, N'Sir William', N'Osler', CAST(3232323 AS Numeric(8, 0)), NULL, N'sir@hotmail.com', N'55t4')
INSERT [dbo].[profesional] ([idProfesional], [nombre], [apellido], [dni], [telefono], [mail], [matricula]) VALUES (8, N'Sigmund', N'Freud', CAST(1112213 AS Numeric(8, 0)), CAST(1546578432 AS Numeric(18, 0)), N'sigmund@hotmail.com', N'jj43')
SET IDENTITY_INSERT [dbo].[profesional] OFF
SET IDENTITY_INSERT [dbo].[turno] ON 

INSERT [dbo].[turno] ([idPaciente], [idProfesional], [fecha], [idTurno]) VALUES (7, 8, CAST(N'2018-12-10' AS Date), 1)
SET IDENTITY_INSERT [dbo].[turno] OFF
ALTER TABLE [dbo].[paciente]  WITH NOCHECK ADD  CONSTRAINT [FK_paciente_obraSocial1] FOREIGN KEY([idObraSocial])
REFERENCES [dbo].[obraSocial] ([idObraSocial])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[paciente] CHECK CONSTRAINT [FK_paciente_obraSocial1]
GO
ALTER TABLE [dbo].[turno]  WITH NOCHECK ADD  CONSTRAINT [FK_turno_paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[paciente] ([idPaciente])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[turno] NOCHECK CONSTRAINT [FK_turno_paciente]
GO
ALTER TABLE [dbo].[turno]  WITH NOCHECK ADD  CONSTRAINT [FK_turno_profesional1] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[profesional] ([idProfesional])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[turno] NOCHECK CONSTRAINT [FK_turno_profesional1]
GO
USE [master]
GO
ALTER DATABASE [ProyectoNT1] SET  READ_WRITE 
GO
