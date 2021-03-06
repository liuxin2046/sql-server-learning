USE [master]
GO
/****** Object:  Database [teaching]    Script Date: 2018/3/7 9:40:21 ******/
CREATE DATABASE [teaching]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'teaching', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\teaching.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'teaching_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\teaching_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [teaching] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [teaching].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [teaching] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [teaching] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [teaching] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [teaching] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [teaching] SET ARITHABORT OFF 
GO
ALTER DATABASE [teaching] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [teaching] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [teaching] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [teaching] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [teaching] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [teaching] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [teaching] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [teaching] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [teaching] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [teaching] SET  ENABLE_BROKER 
GO
ALTER DATABASE [teaching] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [teaching] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [teaching] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [teaching] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [teaching] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [teaching] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [teaching] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [teaching] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [teaching] SET  MULTI_USER 
GO
ALTER DATABASE [teaching] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [teaching] SET DB_CHAINING OFF 
GO
ALTER DATABASE [teaching] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [teaching] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [teaching] SET DELAYED_DURABILITY = DISABLED 
GO
USE [teaching]
GO
/****** Object:  Table [dbo].[class]    Script Date: 2018/3/7 9:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[classnno] [nchar](7) NOT NULL,
	[classname] [nchar](12) NULL,
	[department] [nchar](12) NULL,
	[monitor] [nchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[classnno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[course]    Script Date: 2018/3/7 9:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[courseno] [nchar](6) NOT NULL,
	[cname] [nchar](20) NULL,
	[type] [nchar](8) NULL,
	[period] [tinyint] NULL,
	[credit] [numeric](4, 1) NULL,
 CONSTRAINT [pk_courseno] PRIMARY KEY CLUSTERED 
(
	[courseno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[score]    Script Date: 2018/3/7 9:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[score](
	[studentno] [nchar](11) NOT NULL,
	[courseno] [nchar](6) NOT NULL,
	[usually] [numeric](6, 2) NULL,
	[final] [numeric](6, 2) NULL,
 CONSTRAINT [pk_score] PRIMARY KEY CLUSTERED 
(
	[studentno] ASC,
	[courseno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[teach_class]    Script Date: 2018/3/7 9:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teach_class](
	[teacherno] [nchar](6) NOT NULL,
	[classno] [nchar](7) NOT NULL,
	[courseno] [nchar](6) NOT NULL,
 CONSTRAINT [pk_teach_class] PRIMARY KEY CLUSTERED 
(
	[teacherno] ASC,
	[classno] ASC,
	[courseno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[teacher]    Script Date: 2018/3/7 9:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher](
	[teacherno] [nchar](6) NOT NULL,
	[tname] [nchar](8) NULL,
	[major] [nchar](10) NULL,
	[prof] [nchar](10) NULL,
	[department] [nchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[teacherno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [teaching] SET  READ_WRITE 
GO
