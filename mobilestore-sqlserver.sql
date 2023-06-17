USE [master]
GO
/****** Object:  Database [MobileStore]    Script Date: 21/02/2023 12:24:41 PM ******/
CREATE DATABASE [MobileStore]

GO
ALTER DATABASE [MobileStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MobileStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MobileStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MobileStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MobileStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MobileStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MobileStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [MobileStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MobileStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MobileStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MobileStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MobileStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MobileStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MobileStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MobileStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MobileStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MobileStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MobileStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MobileStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MobileStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MobileStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MobileStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MobileStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MobileStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MobileStore] SET RECOVERY FULL 
GO
ALTER DATABASE [MobileStore] SET  MULTI_USER 
GO
ALTER DATABASE [MobileStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MobileStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MobileStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MobileStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MobileStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MobileStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MobileStore', N'ON'
GO
ALTER DATABASE [MobileStore] SET QUERY_STORE = OFF
GO
USE [MobileStore]
GO
/****** Object:  Table [dbo].[order]    Script Date: 21/02/2023 12:24:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[total_money] [float] NULL,
	[order_date] [datetime] NULL,
	[user_id] [bigint] NULL,
	[total_quantity] [int] NULL,
 CONSTRAINT [PK__order__3213E83FD40039D3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 21/02/2023 12:24:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [bigint] NOT NULL,
	[order_id] [bigint] NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK__order_de__3213E83FBD845DFB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 21/02/2023 12:24:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[manufacturer] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[image_url] [varchar](255) NULL,
	[price] [float] NULL,
	[stock] [int] NULL,
	[supplier_id] [bigint] NULL,
	[category] [varchar](255) NULL,
	[conditional] [varchar](255) NULL,
 CONSTRAINT [PK__product__3213E83FF4A138FB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 21/02/2023 12:24:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping_carts]    Script Date: 21/02/2023 12:24:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping_carts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[product_id] [bigint] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK__shopping__3213E83F52E8F944] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 21/02/2023 12:24:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[user_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 21/02/2023 12:24:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
	[phone_number] [varchar](20) NULL,
	[address] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[order] ON 
GO
INSERT [dbo].[order] ([id], [total_money], [order_date], [user_id], [total_quantity]) VALUES (1, 50, CAST(N'2023-02-20T10:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[order] ([id], [total_money], [order_date], [user_id], [total_quantity]) VALUES (2, 100, CAST(N'2023-02-19T15:30:00.000' AS DateTime), 2, NULL)
GO
INSERT [dbo].[order] ([id], [total_money], [order_date], [user_id], [total_quantity]) VALUES (3, 75, CAST(N'2023-02-18T08:45:00.000' AS DateTime), 3, NULL)
GO
INSERT [dbo].[order] ([id], [total_money], [order_date], [user_id], [total_quantity]) VALUES (6, 1299, CAST(N'2023-02-20T20:26:08.940' AS DateTime), NULL, 1)
GO
INSERT [dbo].[order] ([id], [total_money], [order_date], [user_id], [total_quantity]) VALUES (7, 1399, CAST(N'2023-02-20T20:48:32.960' AS DateTime), NULL, 1)
GO
INSERT [dbo].[order] ([id], [total_money], [order_date], [user_id], [total_quantity]) VALUES (8, 1399, CAST(N'2023-02-20T21:02:01.037' AS DateTime), NULL, 1)
GO
INSERT [dbo].[order] ([id], [total_money], [order_date], [user_id], [total_quantity]) VALUES (9, 3096, CAST(N'2023-02-20T21:04:55.737' AS DateTime), NULL, 4)
GO
INSERT [dbo].[order] ([id], [total_money], [order_date], [user_id], [total_quantity]) VALUES (10, 823.98, CAST(N'2023-02-20T21:06:07.143' AS DateTime), NULL, 4)
GO
INSERT [dbo].[order] ([id], [total_money], [order_date], [user_id], [total_quantity]) VALUES (11, 148.99, CAST(N'2023-02-20T21:08:30.803' AS DateTime), NULL, 3)
GO
INSERT [dbo].[order] ([id], [total_money], [order_date], [user_id], [total_quantity]) VALUES (12, 4097, CAST(N'2023-02-21T10:22:56.090' AS DateTime), NULL, 3)
GO
INSERT [dbo].[order] ([id], [total_money], [order_date], [user_id], [total_quantity]) VALUES (13, 7141, CAST(N'2023-02-21T10:27:49.967' AS DateTime), NULL, 9)
GO
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (1, 1, 1, 2, 25)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (2, 2, 1, 1, 15)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (3, 3, 2, 3, 20)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (4, 4, 2, 2, 30)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (5, 5, 3, 1, 75)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (6, 3, NULL, 1, 1299)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (7, 1, NULL, 1, 1399)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (8, 1, 8, 1, 1399)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (9, 2, 9, 2, 249)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (10, 3, 9, 2, 1299)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (11, 4, 10, 2, 399)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (12, 6, 10, 2, 12.99)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (13, 8, 11, 2, 59.5)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (14, 9, 11, 1, 29.99)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (15, 1, 12, 2, 1399)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (16, 3, 12, 1, 1299)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (17, 1, 13, 1, 1399)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (18, 2, 13, 1, 249)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (19, 3, 13, 3, 1299)
GO
INSERT [dbo].[order_detail] ([id], [product_id], [order_id], [quantity], [price]) VALUES (20, 4, 13, 4, 399)
GO
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 
GO
INSERT [dbo].[product] ([id], [name], [manufacturer], [description], [image_url], [price], [stock], [supplier_id], [category], [conditional]) VALUES (1, N'iPhone 13 Pro Max', N'Apple', N'Newest iPhone model', N'https://example.com/iphone13.jpg', 1399, 90, NULL, N'Apple', N'New')
GO
INSERT [dbo].[product] ([id], [name], [manufacturer], [description], [image_url], [price], [stock], [supplier_id], [category], [conditional]) VALUES (2, N'AirPods Pro', N'Apple', N'Wireless earbuds', N'https://example.com/airpodspro.jpg', 249, 43, NULL, N'Apple', N'New')
GO
INSERT [dbo].[product] ([id], [name], [manufacturer], [description], [image_url], [price], [stock], [supplier_id], [category], [conditional]) VALUES (3, N'ThinkPad X1 Carbon', N'Lenovo', N'Business laptop', N'https://example.com/thinkpad.jpg', 1299, 94, NULL, N'Samsung', N'New')
GO
INSERT [dbo].[product] ([id], [name], [manufacturer], [description], [image_url], [price], [stock], [supplier_id], [category], [conditional]) VALUES (4, N'UltraSharp U2721DE', N'Dell', N'27-inch monitor', N'https://example.com/dellmonitor.jpg', 399, 19, NULL, N'Samsung', N'New')
GO
INSERT [dbo].[product] ([id], [name], [manufacturer], [description], [image_url], [price], [stock], [supplier_id], [category], [conditional]) VALUES (5, N'The Alchemist', N'Paulo Coelho', N'A bestselling novel', N'https://example.com/alchemist.jpg', 9.99, 94, NULL, N'Dell', N'New')
GO
INSERT [dbo].[product] ([id], [name], [manufacturer], [description], [image_url], [price], [stock], [supplier_id], [category], [conditional]) VALUES (6, N'Fifty Shades of Grey', N'E.L. James', N'A bestselling novel', N'https://example.com/fiftyshades.jpg', 12.99, 48, NULL, N'OPPO', N'New')
GO
INSERT [dbo].[product] ([id], [name], [manufacturer], [description], [image_url], [price], [stock], [supplier_id], [category], [conditional]) VALUES (7, N'Adidas Superstar', N'Adidas', N'Classic sneakers', N'https://example.com/superstar.jpg', 80, 30, 1, N'OPPO', N'New')
GO
INSERT [dbo].[product] ([id], [name], [manufacturer], [description], [image_url], [price], [stock], [supplier_id], [category], [conditional]) VALUES (8, N'Levi', N' 501 Original Fit', N'Levi 1', N'https://example.com/501jeans.jpg', 59.5, 46, NULL, N'OPPO', N'New')
GO
INSERT [dbo].[product] ([id], [name], [manufacturer], [description], [image_url], [price], [stock], [supplier_id], [category], [conditional]) VALUES (9, N'H&M Hoodie', N'H&M', N'A comfortable hoodie', N'https://example.com/hmhoodie.jpg', 29.99, 99, NULL, N'OPPO', N'New')
GO
INSERT [dbo].[product] ([id], [name], [manufacturer], [description], [image_url], [price], [stock], [supplier_id], [category], [conditional]) VALUES (10, N'string', N'string', N'string', N'string', 0, 1000, NULL, N'string', N'New')
GO
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 
GO
INSERT [dbo].[role] ([id], [name]) VALUES (1, N'ROLE_ADMIN')
GO
INSERT [dbo].[role] ([id], [name]) VALUES (2, N'ROLE_USER')
GO
SET IDENTITY_INSERT [dbo].[role] OFF
GO
INSERT [dbo].[user_role] ([user_id], [role_id]) VALUES (1, 1)
GO
INSERT [dbo].[user_role] ([user_id], [role_id]) VALUES (2, 2)
GO
INSERT [dbo].[user_role] ([user_id], [role_id]) VALUES (3, 2)
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [email], [password], [name], [phone_number], [address]) VALUES (1, N'admin', N'$2a$12$B9fRClY/3MO1.m5.iaQvhO/8PBVpnQKsUMw7PVqqwZP/4JWKub2bK', N'User 1', N'0123456789', N'123 Main St')
GO
INSERT [dbo].[users] ([id], [email], [password], [name], [phone_number], [address]) VALUES (2, N'user', N'user', N'User 2', N'0123456789', N'456 Broad St')
GO
INSERT [dbo].[users] ([id], [email], [password], [name], [phone_number], [address]) VALUES (3, N'user3@gmail.com', N'123456', N'User 3', N'0123456789', N'789 Oak St')
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E6164F0C245A8]    Script Date: 21/02/2023 12:24:41 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK__order__user_id__2C3393D0] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK__order__user_id__2C3393D0]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK__order_det__order__300424B4] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK__order_det__order__300424B4]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK__order_det__produ__2F10007B] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK__order_det__produ__2F10007B]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__supplie__29572725] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__supplie__29572725]
GO
ALTER TABLE [dbo].[shopping_carts]  WITH CHECK ADD  CONSTRAINT [FK__shopping___produ__5DCAEF64] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[shopping_carts] CHECK CONSTRAINT [FK__shopping___produ__5DCAEF64]
GO
ALTER TABLE [dbo].[shopping_carts]  WITH CHECK ADD  CONSTRAINT [FK__shopping___user___5CD6CB2B] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[shopping_carts] CHECK CONSTRAINT [FK__shopping___user___5CD6CB2B]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
USE [master]
GO
ALTER DATABASE [MobileStore] SET  READ_WRITE 
GO
