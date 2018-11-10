USE [ProyectoNT1]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[obraSocial](
	[idObraSocial] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_obraSocial] PRIMARY KEY CLUSTERED 
(
	[idObraSocial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[profesional]    Script Date: 10/10/2018 18:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[paciente]    Script Date: 10/10/2018 18:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paciente](
	[idPaciente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apellido] [varchar](30) NOT NULL,
	[dni] [numeric](8, 0) NOT NULL,
	[telefono] [numeric](18, 0) NULL,
	[mail] [varchar](30) NOT NULL,
	[idObraSocial] [int] NOT NULL,
	[sexo] [varchar](50) NOT NULL
 CONSTRAINT [PK_paciente] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[turno]    Script Date: 10/10/2018 18:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turno](
	[idPaciente] [int] NOT NULL,
	[idProfesional] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_turno] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC,
	[idProfesional] ASC,
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_paciente_obraSocial1]    Script Date: 10/10/2018 18:47:11 ******/
ALTER TABLE [dbo].[paciente]  WITH NOCHECK ADD  CONSTRAINT [FK_paciente_obraSocial1] FOREIGN KEY([idObraSocial])
REFERENCES [dbo].[obraSocial] ([idObraSocial])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[paciente] CHECK CONSTRAINT [FK_paciente_obraSocial1]
GO
/****** Object:  ForeignKey [FK_turno_paciente]    Script Date: 10/10/2018 18:47:11 ******/
ALTER TABLE [dbo].[turno]  WITH CHECK ADD  CONSTRAINT [FK_turno_paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[turno] CHECK CONSTRAINT [FK_turno_paciente]
GO
/****** Object:  ForeignKey [FK_turno_profesional1]    Script Date: 10/10/2018 18:47:11 ******/
ALTER TABLE [dbo].[turno]  WITH NOCHECK ADD  CONSTRAINT [FK_turno_profesional1] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[profesional] ([idProfesional])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[turno] CHECK CONSTRAINT [FK_turno_profesional1]
GO