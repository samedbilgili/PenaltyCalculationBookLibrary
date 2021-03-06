USE [BookStoreExample]
GO
/****** Object:  Table [dbo].[BookCategories]    Script Date: 03-Jan-22 9:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_BookCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookHistories]    Script Date: 03-Jan-22 9:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookHistories](
	[Id] [int] NOT NULL,
	[BookId] [int] NULL,
	[Description] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_BookHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 03-Jan-22 9:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 03-Jan-22 9:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[PenaltyAmount] [decimal](12, 2) NULL,
	[CurrencyUnit] [nvarchar](50) NULL,
	[CurrencyUnitIcon] [nvarchar](50) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryCustomHolidayDays]    Script Date: 03-Jan-22 9:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryCustomHolidayDays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[HolidayDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CountryHolidayDays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryHolidayDayOfWeek]    Script Date: 03-Jan-22 9:52:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryHolidayDayOfWeek](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NULL,
	[Monday] [bit] NULL,
	[Tuesday] [bit] NULL,
	[Wednesday] [bit] NULL,
	[Thursday] [bit] NULL,
	[Friday] [bit] NULL,
	[Saturday] [bit] NULL,
	[Sunday] [bit] NULL,
 CONSTRAINT [PK_CountryHolidayDayOfWeek] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name], [Status], [PenaltyAmount], [CurrencyUnit], [CurrencyUnitIcon]) VALUES (1, N'Turkey', 1, CAST(10.00 AS Decimal(12, 2)), N'TR', N'₺')
INSERT [dbo].[Countries] ([Id], [Name], [Status], [PenaltyAmount], [CurrencyUnit], [CurrencyUnitIcon]) VALUES (2, N'Portugal', 1, CAST(5.00 AS Decimal(12, 2)), N'Euro', N'€')
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[CountryCustomHolidayDays] ON 

INSERT [dbo].[CountryCustomHolidayDays] ([Id], [CountryId], [HolidayDate]) VALUES (1, 1, CAST(N'2022-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[CountryCustomHolidayDays] ([Id], [CountryId], [HolidayDate]) VALUES (2, 1, CAST(N'2022-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[CountryCustomHolidayDays] ([Id], [CountryId], [HolidayDate]) VALUES (6, 2, CAST(N'2022-01-14T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[CountryCustomHolidayDays] OFF
GO
SET IDENTITY_INSERT [dbo].[CountryHolidayDayOfWeek] ON 

INSERT [dbo].[CountryHolidayDayOfWeek] ([Id], [CountryId], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday], [Sunday]) VALUES (1, 1, 0, 0, 0, 0, 0, 1, 1)
INSERT [dbo].[CountryHolidayDayOfWeek] ([Id], [CountryId], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday], [Sunday]) VALUES (2, 2, 0, 0, 0, 0, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[CountryHolidayDayOfWeek] OFF
GO
ALTER TABLE [dbo].[BookHistories]  WITH CHECK ADD  CONSTRAINT [FK_BookHistories_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[BookHistories] CHECK CONSTRAINT [FK_BookHistories_Books]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_BookCategories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[BookCategories] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_BookCategories]
GO
ALTER TABLE [dbo].[CountryCustomHolidayDays]  WITH CHECK ADD  CONSTRAINT [FK_CountryCustomHolidayDays_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[CountryCustomHolidayDays] CHECK CONSTRAINT [FK_CountryCustomHolidayDays_Countries]
GO
ALTER TABLE [dbo].[CountryHolidayDayOfWeek]  WITH CHECK ADD  CONSTRAINT [FK_CountryHolidayDayOfWeek_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[CountryHolidayDayOfWeek] CHECK CONSTRAINT [FK_CountryHolidayDayOfWeek_Countries]
GO
