USE [Vanraha]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Items_Topics]') AND parent_object_id = OBJECT_ID(N'[dbo].[Items]'))
ALTER TABLE [dbo].[Items] DROP CONSTRAINT [FK_Items_Topics]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemLinks_Items]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemLinks]'))
ALTER TABLE [dbo].[ItemLinks] DROP CONSTRAINT [FK_ItemLinks_Items]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Topics_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Topics] DROP CONSTRAINT [DF_Topics_CreatedDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Items_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Items] DROP CONSTRAINT [DF_Items_CreatedDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ItemLinks_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ItemLinks] DROP CONSTRAINT [DF_ItemLinks_CreatedDate]
END

GO
/****** Object:  Table [dbo].[Topics]    Script Date: 9/19/2015 5:15:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Topics]') AND type in (N'U'))
DROP TABLE [dbo].[Topics]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 9/19/2015 5:15:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Items]') AND type in (N'U'))
DROP TABLE [dbo].[Items]
GO
/****** Object:  Table [dbo].[ItemLinks]    Script Date: 9/19/2015 5:15:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemLinks]') AND type in (N'U'))
DROP TABLE [dbo].[ItemLinks]
GO
/****** Object:  Table [dbo].[ItemLinks]    Script Date: 9/19/2015 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemLinks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemLinks](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[LinkUrl] [nvarchar](500) NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ItemLinkName] [nvarchar](max) NULL,
 CONSTRAINT [PK_ItemLinks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Items]    Script Date: 9/19/2015 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Items]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TopicId] [int] NOT NULL,
	[MainUrl] [nvarchar](100) NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 9/19/2015 5:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Topics]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ItemLinks] ON 

GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (1, 1, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A51200E5B7FA AS DateTime), NULL, N'desing 1.1')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (2, 1, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A51200E5B7FA AS DateTime), NULL, N'desing 1.2')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (3, 1, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015D7565 AS DateTime), NULL, N'desing 1.3')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (4, 1, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015D7565 AS DateTime), NULL, N'desing 1.4')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (5, 1, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015D7565 AS DateTime), NULL, N'desing 1.5')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (6, 2, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC104 AS DateTime), NULL, N'desing 2.1')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (7, 2, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC104 AS DateTime), NULL, N'desing 2.2')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (8, 2, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC104 AS DateTime), NULL, N'desing 2.3')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (9, 2, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC104 AS DateTime), NULL, N'desing 2.4')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (10, 2, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC104 AS DateTime), NULL, N'desing 2.5')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (11, 3, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC104 AS DateTime), NULL, N'desing 3.1')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (12, 3, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC104 AS DateTime), NULL, N'desing 3.2')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (13, 3, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC105 AS DateTime), NULL, N'desing 3.3')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (14, 3, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC105 AS DateTime), NULL, N'desing 3.4')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (15, 3, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC105 AS DateTime), NULL, N'desing 3.5')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (16, 4, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC105 AS DateTime), NULL, N'desing 4.1')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (17, 4, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC105 AS DateTime), NULL, N'desing 4.2')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (18, 4, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC105 AS DateTime), NULL, N'desing 4.3')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (19, 4, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC105 AS DateTime), NULL, N'desing 4.4')
GO
INSERT [dbo].[ItemLinks] ([Id], [ItemId], [LinkUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy], [ItemLinkName]) VALUES (20, 4, N'http://www.w3schools.com/', NULL, NULL, CAST(0x0000A504015DC105 AS DateTime), NULL, N'desing 4.5')
GO
SET IDENTITY_INSERT [dbo].[ItemLinks] OFF
GO
SET IDENTITY_INSERT [dbo].[Items] ON 

GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (1, N'NDTV', 1, N'http://www.ndtv.com', NULL, NULL, CAST(0x0000A504015CEFAD AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (2, N'The Indian Express', 1, N'http://indianexpress.com/', NULL, NULL, CAST(0x0000A504015D1621 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (3, N'The Times of India', 1, N'http://timesofindia.indiatimes.com/', NULL, NULL, CAST(0x0000A504015D1622 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (4, N'The Hindu', 1, N'http://www.thehindu.com/', NULL, NULL, CAST(0x0000A504015D1622 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (5, N'Rediff News', 1, N'http://www.rediff.com/news', NULL, NULL, CAST(0x0000A513016A532D AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (6, N'India Tv', 1, N'http://www.indiatvnews.com/', NULL, NULL, CAST(0x0000A513016A532D AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (7, N' Hot Hardware', 2, N'http://hothardware.com/', NULL, NULL, CAST(0x0000A513016D5736 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (8, N'PCMag', 2, N'http://www.pcmag.com/', NULL, NULL, CAST(0x0000A513016D5736 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (9, N'PCWorld', 2, N'http://www.pcworld.com/', NULL, NULL, CAST(0x0000A513016D5737 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (10, N'Android Headlines', 2, N'http://www.androidheadlines.com/', NULL, NULL, CAST(0x0000A513016D5737 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (11, N'Apple Insider', 2, N'http://appleinsider.com/', NULL, NULL, CAST(0x0000A513016D5737 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (12, N'CheatSheet', 2, N'http://www.cheatsheet.com/', NULL, NULL, CAST(0x0000A513016D5738 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (13, N'Bollywood', 3, N'http://www.bollywood.com/', NULL, NULL, CAST(0x0000A513016E5994 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (14, N'Bollywood Hungama', 3, N'http://www.bollywoodhungama.com/', NULL, NULL, CAST(0x0000A513016E5994 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (15, N'Indiaglitz', 3, N'http://www.indiaglitz.com/', NULL, NULL, CAST(0x0000A513016E5994 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (16, N'Tamil Start', 3, N'http://www.tamilstar.com/', NULL, NULL, CAST(0x0000A513016E5994 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (17, N'Great Andhra', 3, N'http://www.greatandhra.com/', NULL, NULL, CAST(0x0000A513016E5994 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (18, N'Flipkart', 4, N'http://www.flipkart.com/', NULL, NULL, CAST(0x0000A5140074CC7D AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (19, N'Snapdeal', 4, N'http://www.snapdeal.com/', NULL, NULL, CAST(0x0000A5140074CC7F AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (20, N'Amazon.in', 4, N'http://www.amazon.in/', NULL, NULL, CAST(0x0000A5140074CC7F AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (21, N'Jabong', 4, N'http://www.jabong.com/', NULL, NULL, CAST(0x0000A5140074CC7F AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (22, N'Ebay', 4, N'http://www.ebay.in/', NULL, NULL, CAST(0x0000A5140074CC7F AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (23, N'Quikr', 4, N'http://www.quikr.com/', NULL, NULL, CAST(0x0000A5140074CC7F AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (24, N'Espn CricInfo', 5, N'http://www.espncricinfo.com/', NULL, NULL, CAST(0x0000A5140075778A AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (25, N'Star Sports', 5, N'http://www.starsports.com/cricket/index.html', NULL, NULL, CAST(0x0000A5140075778B AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (26, N'Sports keeda', 5, N'http://www.sportskeeda.com/', NULL, NULL, CAST(0x0000A5140075778B AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (27, N'Goal', 5, N'http://www.goal.com/en-us/', NULL, NULL, CAST(0x0000A5140075778B AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (28, N'MedicalNewsToday', 6, N'http://www.medicalnewstoday.com/', NULL, NULL, CAST(0x0000A51400764364 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (29, N'Sciencedaily', 6, N'http://www.sciencedaily.com/news/health_medicine/', NULL, NULL, CAST(0x0000A51400764364 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (30, N'Health', 6, N'http://www.health.com/health/', NULL, NULL, CAST(0x0000A51400764364 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (31, N'WebMD', 6, N'http://www.webmd.com/', NULL, NULL, CAST(0x0000A51400764365 AS DateTime), NULL)
GO
INSERT [dbo].[Items] ([Id], [Name], [TopicId], [MainUrl], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (32, N'Healthy Women', 6, N'http://www.healthywomen.org/', NULL, NULL, CAST(0x0000A51400764365 AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
SET IDENTITY_INSERT [dbo].[Topics] ON 

GO
INSERT [dbo].[Topics] ([Id], [Name], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (1, N'News', NULL, NULL, CAST(0x0000A4F600C0C53C AS DateTime), NULL)
GO
INSERT [dbo].[Topics] ([Id], [Name], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (2, N'Technology', NULL, NULL, CAST(0x0000A4F600C0C547 AS DateTime), NULL)
GO
INSERT [dbo].[Topics] ([Id], [Name], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (3, N'Movies', NULL, NULL, CAST(0x0000A4F600C0C54C AS DateTime), NULL)
GO
INSERT [dbo].[Topics] ([Id], [Name], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (4, N'Deals', NULL, NULL, CAST(0x0000A4F600C0C54D AS DateTime), NULL)
GO
INSERT [dbo].[Topics] ([Id], [Name], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (5, N'Sports', NULL, NULL, CAST(0x0000A4F600C0C54E AS DateTime), NULL)
GO
INSERT [dbo].[Topics] ([Id], [Name], [UpdatedDate], [UpdatedBy], [CreatedDate], [CreatedBy]) VALUES (6, N'Health', NULL, NULL, CAST(0x0000A5130168CCC5 AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Topics] OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ItemLinks_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ItemLinks] ADD  CONSTRAINT [DF_ItemLinks_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Items_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [DF_Items_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Topics_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Topics] ADD  CONSTRAINT [DF_Topics_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemLinks_Items]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemLinks]'))
ALTER TABLE [dbo].[ItemLinks]  WITH CHECK ADD  CONSTRAINT [FK_ItemLinks_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemLinks_Items]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemLinks]'))
ALTER TABLE [dbo].[ItemLinks] CHECK CONSTRAINT [FK_ItemLinks_Items]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Items_Topics]') AND parent_object_id = OBJECT_ID(N'[dbo].[Items]'))
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Topics] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Items_Topics]') AND parent_object_id = OBJECT_ID(N'[dbo].[Items]'))
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Topics]
GO
