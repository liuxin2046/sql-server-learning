USE [jxgl]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2018/3/6 9:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[cno] [char](2) NOT NULL,
	[cname] [varchar](20) NULL,
	[cpno] [char](2) NULL,
	[ccredit] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[cno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sc]    Script Date: 2018/3/6 9:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sc](
	[sno] [char](5) NOT NULL,
	[cno] [char](2) NOT NULL,
	[grade] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[sno] ASC,
	[cno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2018/3/6 9:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[sno] [char](5) NOT NULL,
	[sname] [varchar](20) NULL,
	[sage] [smallint] NULL,
	[ssex] [char](2) NULL DEFAULT ('男'),
	[sdept] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[sno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Course] ([cno], [cname], [cpno], [ccredit]) VALUES (N'1 ', N'数据库系统', N'5 ', 4)
INSERT [dbo].[Course] ([cno], [cname], [cpno], [ccredit]) VALUES (N'2 ', N'数学分析', NULL, 2)
INSERT [dbo].[Course] ([cno], [cname], [cpno], [ccredit]) VALUES (N'3 ', N'信息系统导论', N'1 ', 3)
INSERT [dbo].[Course] ([cno], [cname], [cpno], [ccredit]) VALUES (N'4 ', N'操作系统_原理', N'6 ', 3)
INSERT [dbo].[Course] ([cno], [cname], [cpno], [ccredit]) VALUES (N'5 ', N'数据结构', N'7 ', 4)
INSERT [dbo].[Course] ([cno], [cname], [cpno], [ccredit]) VALUES (N'6 ', N'数据处理基础', NULL, 4)
INSERT [dbo].[Course] ([cno], [cname], [cpno], [ccredit]) VALUES (N'7 ', N'C语言', N'6 ', 3)
INSERT [dbo].[sc] ([sno], [cno], [grade]) VALUES (N'98001', N'1 ', 87)
INSERT [dbo].[sc] ([sno], [cno], [grade]) VALUES (N'98001', N'2 ', 67)
INSERT [dbo].[sc] ([sno], [cno], [grade]) VALUES (N'98001', N'3 ', 90)
INSERT [dbo].[sc] ([sno], [cno], [grade]) VALUES (N'98002', N'2 ', 95)
INSERT [dbo].[sc] ([sno], [cno], [grade]) VALUES (N'98002', N'3 ', 88)
INSERT [dbo].[Student] ([sno], [sname], [sage], [ssex], [sdept]) VALUES (N'98001', N'钱横', 18, N'男', N'CS')
INSERT [dbo].[Student] ([sno], [sname], [sage], [ssex], [sdept]) VALUES (N'98002', N'王林', 19, N'女', N'CS')
INSERT [dbo].[Student] ([sno], [sname], [sage], [ssex], [sdept]) VALUES (N'98003', N'李民', 20, N'男', N'IS')
INSERT [dbo].[Student] ([sno], [sname], [sage], [ssex], [sdept]) VALUES (N'98004', N'赵三', 16, N'女', N'MA')
ALTER TABLE [dbo].[sc]  WITH CHECK ADD FOREIGN KEY([cno])
REFERENCES [dbo].[Course] ([cno])
GO
ALTER TABLE [dbo].[sc]  WITH CHECK ADD  CONSTRAINT [s_f] FOREIGN KEY([sno])
REFERENCES [dbo].[Student] ([sno])
GO
ALTER TABLE [dbo].[sc] CHECK CONSTRAINT [s_f]
GO
ALTER TABLE [dbo].[sc]  WITH CHECK ADD CHECK  (([grade] IS NULL OR [grade]>=(0) AND [grade]<=(100)))
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD CHECK  (([sage]>=(15) AND [sage]<=(45)))
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD CHECK  (([ssex]='男' OR [ssex]='女'))
GO
