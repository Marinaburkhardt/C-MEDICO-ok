/*CREAR PRIMERO UNA BASE LLAMADA "ProyectoNT1"*/

USE [ProyectoNT1]
GO
/****** Object:  Table [dbo].[obraSocial]    Script Date: 28/11/2018 23:02:59 ******/
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
/****** Object:  Table [dbo].[paciente]    Script Date: 28/11/2018 23:03:00 ******/
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
/****** Object:  Table [dbo].[profesional]    Script Date: 28/11/2018 23:03:00 ******/
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
/****** Object:  Table [dbo].[turno]    Script Date: 28/11/2018 23:03:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turno](
	[idPaciente] [int] NOT NULL,
	[idProfesional] [int] NOT NULL,
	[fecha] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_turno] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC,
	[idProfesional] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[obraSocial] ON 

INSERT [dbo].[obraSocial] ([idObraSocial], [nombre]) VALUES (3, N'--Seleccione su Obra Social--')
INSERT [dbo].[obraSocial] ([idObraSocial], [nombre]) VALUES (4, N'OSDE')
INSERT [dbo].[obraSocial] ([idObraSocial], [nombre]) VALUES (5, N'Swiss Medical')
SET IDENTITY_INSERT [dbo].[obraSocial] OFF
SET IDENTITY_INSERT [dbo].[paciente] ON 

INSERT [dbo].[paciente] ([idPaciente], [nombre], [apellido], [dni], [telefono], [mail], [idObraSocial], [sexo]) VALUES (8, N'Marina', N'Burkhardt', CAST(1234567 AS Numeric(8, 0)), NULL, N'marina@gmail.com', 4, N'Mujer')
INSERT [dbo].[paciente] ([idPaciente], [nombre], [apellido], [dni], [telefono], [mail], [idObraSocial], [sexo]) VALUES (9, N'Federico', N'Godoy Leiva', CAST(2345678 AS Numeric(8, 0)), NULL, N'pox@gmail.com', 5, N'Hombre')
INSERT [dbo].[paciente] ([idPaciente], [nombre], [apellido], [dni], [telefono], [mail], [idObraSocial], [sexo]) VALUES (10, N'Sergio', N'Cima', CAST(1342567 AS Numeric(8, 0)), NULL, N'sergio@gmail.com', 4, N'Hombre')
INSERT [dbo].[paciente] ([idPaciente], [nombre], [apellido], [dni], [telefono], [mail], [idObraSocial], [sexo]) VALUES (11, N'Melina', N'Valdez', CAST(7654321 AS Numeric(8, 0)), NULL, N'melina@gmail.com', 4, N'Mujer')
SET IDENTITY_INSERT [dbo].[paciente] OFF
SET IDENTITY_INSERT [dbo].[profesional] ON 

INSERT [dbo].[profesional] ([idProfesional], [nombre], [apellido], [dni], [telefono], [mail], [matricula]) VALUES (7, N'Sir William', N'Osler', CAST(3232323 AS Numeric(8, 0)), NULL, N'sir@hotmail.com', N'55t4')
INSERT [dbo].[profesional] ([idProfesional], [nombre], [apellido], [dni], [telefono], [mail], [matricula]) VALUES (8, N'Sigmund', N'Freud', CAST(1112213 AS Numeric(8, 0)), CAST(1546578432 AS Numeric(18, 0)), N'sigmund@hotmail.com', N'jj43')
SET IDENTITY_INSERT [dbo].[profesional] OFF
ALTER TABLE [dbo].[paciente]  WITH NOCHECK ADD  CONSTRAINT [FK_paciente_obraSocial1] FOREIGN KEY([idObraSocial])
REFERENCES [dbo].[obraSocial] ([idObraSocial])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[paciente] CHECK CONSTRAINT [FK_paciente_obraSocial1]
GO
ALTER TABLE [dbo].[turno]  WITH CHECK ADD  CONSTRAINT [FK_turno_paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[turno] CHECK CONSTRAINT [FK_turno_paciente]
GO
ALTER TABLE [dbo].[turno]  WITH NOCHECK ADD  CONSTRAINT [FK_turno_profesional1] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[profesional] ([idProfesional])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[turno] CHECK CONSTRAINT [FK_turno_profesional1]
GO
USE [master]
GO
ALTER DATABASE [ProyectoNT1] SET  READ_WRITE 
GO
