USE [master]
GO
/****** Object:  Database [Loja]    Script Date: 22/08/2023 19:42:15 ******/
CREATE DATABASE [Loja]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Loja', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Loja.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Loja_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Loja_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Loja] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Loja].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Loja] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Loja] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Loja] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Loja] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Loja] SET ARITHABORT OFF 
GO
ALTER DATABASE [Loja] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Loja] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Loja] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Loja] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Loja] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Loja] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Loja] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Loja] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Loja] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Loja] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Loja] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Loja] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Loja] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Loja] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Loja] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Loja] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Loja] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Loja] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Loja] SET  MULTI_USER 
GO
ALTER DATABASE [Loja] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Loja] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Loja] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Loja] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Loja] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Loja] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Loja] SET QUERY_STORE = ON
GO
ALTER DATABASE [Loja] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Loja]
GO
USE [Loja]
GO
/****** Object:  Sequence [dbo].[PessoaSequence]    Script Date: 22/08/2023 19:42:15 ******/
CREATE SEQUENCE [dbo].[PessoaSequence] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[Movimento]    Script Date: 22/08/2023 19:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimento](
	[idMovimento] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idPessoa] [int] NOT NULL,
	[idProduto] [int] NOT NULL,
	[quantidade] [int] NOT NULL,
	[tipo] [char](1) NOT NULL,
	[valorUnitario] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMovimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoa]    Script Date: 22/08/2023 19:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoa](
	[idPessoa] [int] NOT NULL,
	[nome] [varchar](255) NOT NULL,
	[logradouro] [varchar](255) NOT NULL,
	[cidade] [varchar](255) NOT NULL,
	[estado] [char](2) NOT NULL,
	[telefone] [varchar](12) NULL,
	[email] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PessoaFisica]    Script Date: 22/08/2023 19:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PessoaFisica](
	[idPessoa] [int] NULL,
	[cpf] [varchar](14) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PessoaJuridica]    Script Date: 22/08/2023 19:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PessoaJuridica](
	[idPessoa] [int] NOT NULL,
	[cnpj] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 22/08/2023 19:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produto](
	[idProduto] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NOT NULL,
	[quantidade] [int] NOT NULL,
	[precoVenda] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 22/08/2023 19:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](20) NOT NULL,
	[senha] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pessoa] ADD  CONSTRAINT [SQPessoa]  DEFAULT (NEXT VALUE FOR [PessoaSEquence]) FOR [idPessoa]
GO
ALTER TABLE [dbo].[Movimento]  WITH CHECK ADD  CONSTRAINT [Pessoa_FK] FOREIGN KEY([idPessoa])
REFERENCES [dbo].[Pessoa] ([idPessoa])
GO
ALTER TABLE [dbo].[Movimento] CHECK CONSTRAINT [Pessoa_FK]
GO
ALTER TABLE [dbo].[Movimento]  WITH NOCHECK ADD  CONSTRAINT [Produto_FK] FOREIGN KEY([idProduto])
REFERENCES [dbo].[Produto] ([idProduto])
GO
ALTER TABLE [dbo].[Movimento] NOCHECK CONSTRAINT [Produto_FK]
GO
ALTER TABLE [dbo].[Movimento]  WITH CHECK ADD  CONSTRAINT [Usuario_FK] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Movimento] CHECK CONSTRAINT [Usuario_FK]
GO
ALTER TABLE [dbo].[PessoaFisica]  WITH CHECK ADD  CONSTRAINT [PessoaFisica_FK] FOREIGN KEY([idPessoa])
REFERENCES [dbo].[Pessoa] ([idPessoa])
GO
ALTER TABLE [dbo].[PessoaFisica] CHECK CONSTRAINT [PessoaFisica_FK]
GO
ALTER TABLE [dbo].[PessoaJuridica]  WITH CHECK ADD  CONSTRAINT [PessoaJuridica_FK] FOREIGN KEY([idPessoa])
REFERENCES [dbo].[Pessoa] ([idPessoa])
GO
ALTER TABLE [dbo].[PessoaJuridica] CHECK CONSTRAINT [PessoaJuridica_FK]
GO
ALTER TABLE [dbo].[Movimento]  WITH CHECK ADD CHECK  (([tipo]='E' OR [tipo]='S'))
GO
USE [master]
GO
ALTER DATABASE [Loja] SET  READ_WRITE 
GO
