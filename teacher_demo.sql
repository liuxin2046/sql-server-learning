USE [master]
GO
/****** Object:  Database [teaching]    Script Date: 2018/3/16 11:14:28 ******/
CREATE DATABASE [teaching]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'teaching', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\teaching.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'teaching_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\teaching_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[class]    Script Date: 2018/3/16 11:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[classno] [nchar](7) NOT NULL,
	[classname] [nchar](12) NULL,
	[department] [nchar](12) NULL,
	[monitor] [nchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[classno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[course]    Script Date: 2018/3/16 11:14:28 ******/
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
/****** Object:  Table [dbo].[score]    Script Date: 2018/3/16 11:14:28 ******/
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
/****** Object:  Table [dbo].[student]    Script Date: 2018/3/16 11:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[studentno] [nchar](11) NOT NULL,
	[sname] [nchar](10) NULL,
	[sex] [nchar](2) NULL,
	[birthday] [datetime] NULL,
	[age] [int] NOT NULL,
	[classno] [nchar](7) NULL,
	[phone] [nchar](12) NULL,
	[Email] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[studentno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[teach_class]    Script Date: 2018/3/16 11:14:28 ******/
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
/****** Object:  Table [dbo].[teacher]    Script Date: 2018/3/16 11:14:28 ******/
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
INSERT [dbo].[class] ([classno], [classname], [department], [monitor]) VALUES (N'160501 ', N'计算机0901     ', N'计算机学院       ', N'马文斐     ')
INSERT [dbo].[class] ([classno], [classname], [department], [monitor]) VALUES (N'160502 ', N'计算机0801     ', N'计算机学院       ', N'章成楠     ')
INSERT [dbo].[class] ([classno], [classname], [department], [monitor]) VALUES (N'160802 ', N'计算机0603     ', N'计算机学院       ', N'李红      ')
INSERT [dbo].[class] ([classno], [classname], [department], [monitor]) VALUES (N'170601 ', N'计算机0703     ', N'计算机学院       ', N'柳溪      ')
INSERT [dbo].[course] ([courseno], [cname], [type], [period], [credit]) VALUES (N'c05103', N'高等数学                ', N'必修      ', 64, CAST(4.0 AS Numeric(4, 1)))
INSERT [dbo].[course] ([courseno], [cname], [type], [period], [credit]) VALUES (N'c05109', N'C语言                 ', N'必修      ', 48, CAST(3.0 AS Numeric(4, 1)))
INSERT [dbo].[course] ([courseno], [cname], [type], [period], [credit]) VALUES (N'c05127', N'数据结构                ', N'必修      ', 64, CAST(4.0 AS Numeric(4, 1)))
INSERT [dbo].[course] ([courseno], [cname], [type], [period], [credit]) VALUES (N'c05129', N'数据库应用               ', N'必修      ', 48, CAST(4.0 AS Numeric(4, 1)))
INSERT [dbo].[course] ([courseno], [cname], [type], [period], [credit]) VALUES (N'c05142', N'web程序设计             ', N'选修      ', 64, CAST(4.0 AS Numeric(4, 1)))
INSERT [dbo].[score] ([studentno], [courseno], [usually], [final]) VALUES (N'16122210009', N'c05103', CAST(87.00 AS Numeric(6, 2)), CAST(82.00 AS Numeric(6, 2)))
INSERT [dbo].[score] ([studentno], [courseno], [usually], [final]) VALUES (N'16122210009', N'c05109', CAST(77.00 AS Numeric(6, 2)), CAST(91.00 AS Numeric(6, 2)))
INSERT [dbo].[score] ([studentno], [courseno], [usually], [final]) VALUES (N'16122221324', N'c05103', CAST(88.00 AS Numeric(6, 2)), CAST(62.00 AS Numeric(6, 2)))
INSERT [dbo].[score] ([studentno], [courseno], [usually], [final]) VALUES (N'16125111109', N'c05127', CAST(77.00 AS Numeric(6, 2)), CAST(87.00 AS Numeric(6, 2)))
INSERT [dbo].[score] ([studentno], [courseno], [usually], [final]) VALUES (N'16135222201', N'c05129', CAST(67.00 AS Numeric(6, 2)), CAST(77.00 AS Numeric(6, 2)))
INSERT [dbo].[score] ([studentno], [courseno], [usually], [final]) VALUES (N'17112100072', N'c05142', CAST(89.00 AS Numeric(6, 2)), CAST(88.00 AS Numeric(6, 2)))
INSERT [dbo].[student] ([studentno], [sname], [sex], [birthday], [age], [classno], [phone], [Email]) VALUES (N'16122210009', N'liuxin    ', N'男 ', CAST(N'1995-11-04 00:00:00.000' AS DateTime), 22, N'160501 ', N'123421431   ', N'liuxin@sina.com')
INSERT [dbo].[student] ([studentno], [sname], [sex], [birthday], [age], [classno], [phone], [Email]) VALUES (N'16122221324', N'何影        ', N'女 ', CAST(N'1997-12-04 00:00:00.000' AS DateTime), 20, N'160501 ', N'131737483   ', N'aaa@sina.com')
INSERT [dbo].[student] ([studentno], [sname], [sex], [birthday], [age], [classno], [phone], [Email]) VALUES (N'16125111109', N'梁新        ', N'男 ', CAST(N'1996-09-03 00:00:00.000' AS DateTime), 21, N'160502 ', N'154155454   ', N'bbb@sina.com')
INSERT [dbo].[student] ([studentno], [sname], [sex], [birthday], [age], [classno], [phone], [Email]) VALUES (N'16135222201', N'夏文        ', N'女 ', CAST(N'1997-10-03 00:00:00.000' AS DateTime), 20, N'170601 ', N'124232143   ', N'ccc@sina.com')
INSERT [dbo].[student] ([studentno], [sname], [sex], [birthday], [age], [classno], [phone], [Email]) VALUES (N'17112100072', N'崔子元       ', N'男 ', CAST(N'1999-10-03 00:00:00.000' AS DateTime), 18, N'160802 ', N'122321234   ', N'ddd@sina.com')
INSERT [dbo].[teach_class] ([teacherno], [classno], [courseno]) VALUES (N't05001', N'160501 ', N'c05103')
INSERT [dbo].[teach_class] ([teacherno], [classno], [courseno]) VALUES (N't05002', N'160501 ', N'c05109')
INSERT [dbo].[teach_class] ([teacherno], [classno], [courseno]) VALUES (N't05011', N'160802 ', N'c05142')
INSERT [dbo].[teach_class] ([teacherno], [classno], [courseno]) VALUES (N't05022', N'160502 ', N'c05127')
INSERT [dbo].[teach_class] ([teacherno], [classno], [courseno]) VALUES (N't05033', N'170601 ', N'c05129')
INSERT [dbo].[teacher] ([teacherno], [tname], [major], [prof], [department]) VALUES (N't05001', N'韩       ', N'高等数学      ', N'教授        ', N'计算机学院       ')
INSERT [dbo].[teacher] ([teacherno], [tname], [major], [prof], [department]) VALUES (N't05002', N'张       ', N'C语言       ', N'助教        ', N'计算机学院       ')
INSERT [dbo].[teacher] ([teacherno], [tname], [major], [prof], [department]) VALUES (N't05011', N'刘       ', N'web程序设计   ', N'教授        ', N'计算机学院       ')
INSERT [dbo].[teacher] ([teacherno], [tname], [major], [prof], [department]) VALUES (N't05022', N'陆       ', N'数据结构      ', N'教师        ', N'计算机学院       ')
INSERT [dbo].[teacher] ([teacherno], [tname], [major], [prof], [department]) VALUES (N't05033', N'洪       ', N'数据库应用     ', N'助教        ', N'计算机学院       ')
ALTER TABLE [dbo].[score]  WITH CHECK ADD  CONSTRAINT [fk_score_course] FOREIGN KEY([courseno])
REFERENCES [dbo].[course] ([courseno])
GO
ALTER TABLE [dbo].[score] CHECK CONSTRAINT [fk_score_course]
GO
ALTER TABLE [dbo].[score]  WITH CHECK ADD  CONSTRAINT [fk_score_stu] FOREIGN KEY([studentno])
REFERENCES [dbo].[student] ([studentno])
GO
ALTER TABLE [dbo].[score] CHECK CONSTRAINT [fk_score_stu]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [fk_class_stu] FOREIGN KEY([classno])
REFERENCES [dbo].[class] ([classno])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [fk_class_stu]
GO
ALTER TABLE [dbo].[teach_class]  WITH CHECK ADD  CONSTRAINT [fk_tech_class] FOREIGN KEY([teacherno])
REFERENCES [dbo].[teacher] ([teacherno])
GO
ALTER TABLE [dbo].[teach_class] CHECK CONSTRAINT [fk_tech_class]
GO
ALTER TABLE [dbo].[teach_class]  WITH CHECK ADD  CONSTRAINT [teach_class_class] FOREIGN KEY([classno])
REFERENCES [dbo].[class] ([classno])
GO
ALTER TABLE [dbo].[teach_class] CHECK CONSTRAINT [teach_class_class]
GO
ALTER TABLE [dbo].[teach_class]  WITH CHECK ADD  CONSTRAINT [teach_class_course] FOREIGN KEY([courseno])
REFERENCES [dbo].[course] ([courseno])
GO
ALTER TABLE [dbo].[teach_class] CHECK CONSTRAINT [teach_class_course]
GO
ALTER TABLE [dbo].[teach_class]  WITH CHECK ADD  CONSTRAINT [teacher_class] FOREIGN KEY([teacherno])
REFERENCES [dbo].[teacher] ([teacherno])
GO
ALTER TABLE [dbo].[teach_class] CHECK CONSTRAINT [teacher_class]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD CHECK  (([age]>(17) AND [age]<(25)))
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD CHECK  (([sex]='男' OR [sex]='女'))
GO
USE [master]
GO
ALTER DATABASE [teaching] SET  READ_WRITE 
GO
