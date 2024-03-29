USE [Harita]
GO
/****** Object:  Table [dbo].[city]    Script Date: 6.08.2019 14:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[CityID] [int] IDENTITY(82,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[CityName] [nvarchar](100) NOT NULL,
	[PlateNo] [nvarchar](2) NOT NULL,
	[PhoneCode] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_city_CityID] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 6.08.2019 14:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[CountryID] [int] IDENTITY(233,1) NOT NULL,
	[BinaryCode] [nvarchar](2) NOT NULL,
	[TripleCode] [nvarchar](3) NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
	[PhoneCode] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_country_CountryID] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[district]    Script Date: 6.08.2019 14:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[DistrictID] [int] IDENTITY(2443,1) NOT NULL,
	[TownID] [int] NOT NULL,
	[DistrictName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_district_DistrictID] PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[neighborhood]    Script Date: 6.08.2019 14:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[neighborhood](
	[NeighborhoodID] [int] IDENTITY(73638,1) NOT NULL,
	[DistrictID] [int] NOT NULL,
	[NeighborhoodName] [nvarchar](100) NOT NULL,
	[ZipCode] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_neighborhood_NeighborhoodID] PRIMARY KEY CLUSTERED 
(
	[NeighborhoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[town]    Script Date: 6.08.2019 14:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[town](
	[TownID] [int] IDENTITY(973,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[TownName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_town_TownID] PRIMARY KEY CLUSTERED 
(
	[TownID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[city]  WITH NOCHECK ADD  CONSTRAINT [city$FK_City_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[country] ([CountryID])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [city$FK_City_CountryID]
GO
ALTER TABLE [dbo].[district]  WITH NOCHECK ADD  CONSTRAINT [district$FK_District_TownID] FOREIGN KEY([TownID])
REFERENCES [dbo].[town] ([TownID])
GO
ALTER TABLE [dbo].[district] CHECK CONSTRAINT [district$FK_District_TownID]
GO
ALTER TABLE [dbo].[neighborhood]  WITH NOCHECK ADD  CONSTRAINT [neighborhood$FK_Neighborhood_DistrictID] FOREIGN KEY([DistrictID])
REFERENCES [dbo].[district] ([DistrictID])
GO
ALTER TABLE [dbo].[neighborhood] CHECK CONSTRAINT [neighborhood$FK_Neighborhood_DistrictID]
GO
ALTER TABLE [dbo].[town]  WITH NOCHECK ADD  CONSTRAINT [town$FK_Town_CityID] FOREIGN KEY([CityID])
REFERENCES [dbo].[city] ([CityID])
GO
ALTER TABLE [dbo].[town] CHECK CONSTRAINT [town$FK_Town_CityID]
GO
