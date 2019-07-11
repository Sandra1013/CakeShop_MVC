USE [master]
GO
/****** Object:  Database [dbCakeShop]    Script Date: 2019/7/11 下午 09:51:18 ******/
CREATE DATABASE [dbCakeShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbCakeShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\dbCakeShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbCakeShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\dbCakeShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbCakeShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbCakeShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbCakeShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbCakeShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbCakeShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbCakeShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbCakeShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbCakeShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbCakeShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbCakeShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbCakeShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbCakeShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbCakeShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbCakeShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbCakeShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbCakeShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbCakeShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbCakeShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbCakeShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbCakeShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbCakeShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbCakeShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbCakeShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbCakeShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbCakeShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbCakeShop] SET  MULTI_USER 
GO
ALTER DATABASE [dbCakeShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbCakeShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbCakeShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbCakeShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbCakeShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbCakeShop] SET QUERY_STORE = OFF
GO
USE [dbCakeShop]
GO
/****** Object:  Table [dbo].[tComment]    Script Date: 2019/7/11 下午 09:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](5) NULL,
	[Email] [nvarchar](30) NULL,
	[Phone] [nvarchar](12) NULL,
	[Message] [nvarchar](50) NULL,
	[CommentDate] [datetime] NULL,
	[Image] [nvarchar](20) NULL,
 CONSTRAINT [PK_tComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tIG]    Script Date: 2019/7/11 下午 09:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tIG](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IgContent] [nvarchar](400) NULL,
	[IgSrc] [nvarchar](200) NULL,
	[IgDate] [nvarchar](12) NULL,
	[IgLink] [nvarchar](200) NULL,
 CONSTRAINT [PK_tIG] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tMember]    Script Date: 2019/7/11 下午 09:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tMember](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NULL,
	[pwd] [nvarchar](20) NULL,
	[repwd] [nvarchar](20) NULL,
	[userName] [nvarchar](5) NULL,
	[birthDay] [date] NULL,
 CONSTRAINT [PK_tMember] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tOrderDetail]    Script Date: 2019/7/11 下午 09:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderGuid] [nvarchar](10) NULL,
	[userName] [nvarchar](5) NULL,
	[pName] [nvarchar](12) NULL,
	[pPrice] [int] NULL,
	[pQty] [int] NULL,
	[isApprove] [nvarchar](3) NULL,
	[recName] [nvarchar](5) NULL,
	[address] [nvarchar](30) NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_tOrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProd]    Script Date: 2019/7/11 下午 09:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProd](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[pName] [nvarchar](12) NULL,
	[pComp] [nvarchar](20) NULL,
	[pPrice] [int] NULL,
	[pImage] [nvarchar](15) NULL,
	[pSale] [int] NULL,
 CONSTRAINT [PK_tProd] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tComment] ON 

INSERT [dbo].[tComment] ([Id], [Name], [Email], [Phone], [Message], [CommentDate], [Image]) VALUES (1, N'黃芊芊', N'sdfv@fakemail.com', N'0912-864-596', N'甜點造型都很精緻，用料也很實在，值得一推!', CAST(N'2019-06-10T07:22:00.000' AS DateTime), N'cc3.png')
INSERT [dbo].[tComment] ([Id], [Name], [Email], [Phone], [Message], [CommentDate], [Image]) VALUES (2, N'林夢夢', N'zxdf1596@fakemail.com', N'0928-964-789', N'抹茶塔用的是宇治的寶相華抹茶粉！好"酒"好"酒"  ，很"大人風味"的一款。', CAST(N'2019-06-04T18:20:00.000' AS DateTime), N'cc4.png')
INSERT [dbo].[tComment] ([Id], [Name], [Email], [Phone], [Message], [CommentDate], [Image]) VALUES (3, N'李香香', N'asdf8694@fakemail.com', N'0928-964-896', N'葉食的甜點數量不多，甜度都很剛好。想要品嚐的朋友，建議早點來哦！', CAST(N'2019-06-13T14:06:00.000' AS DateTime), N'cc5.png')
INSERT [dbo].[tComment] ([Id], [Name], [Email], [Phone], [Message], [CommentDate], [Image]) VALUES (4, N'黃大大', N'asd847@fakemail.com', N'0928-774-123', N'檸檬塔酸度適中，可能有加了榛果的關係，多了層次感~', CAST(N'2019-06-11T22:00:21.220' AS DateTime), N'cc3.png')
INSERT [dbo].[tComment] ([Id], [Name], [Email], [Phone], [Message], [CommentDate], [Image]) VALUES (6, N'張娟娟', N'lich1245@gmail.com', N'0912-456-789', N'是一間低調簡約、不譁眾取寵的個性小店。', CAST(N'2019-06-15T01:18:00.637' AS DateTime), N'cc4.png')
INSERT [dbo].[tComment] ([Id], [Name], [Email], [Phone], [Message], [CommentDate], [Image]) VALUES (7, N'魏伊伊', N'tina0603@gmail.com', N'0945-785-962', N'整顆水蜜桃做成的超豪華塔-桃花源，塞進整顆覆盆莓增加酸度和香味，美味滿分！', CAST(N'2019-06-15T01:35:34.340' AS DateTime), N'cc5.png')
INSERT [dbo].[tComment] ([Id], [Name], [Email], [Phone], [Message], [CommentDate], [Image]) VALUES (19, N'陳亮亮', N'sasa1224@gmail.com', N'0928-964-789', N'每天現做的甜點美食，每一種都有不同滋味，愛甜點的你還不快來!', CAST(N'2019-06-16T01:08:18.440' AS DateTime), N'cc4.png')
INSERT [dbo].[tComment] ([Id], [Name], [Email], [Phone], [Message], [CommentDate], [Image]) VALUES (27, N'黃大大', N'zxdf1596@fakemail.com', N'0928-964-789', N'每天推出的塔都不太一樣，而且還有季節差別，晚來就買不到囉!', CAST(N'2019-06-16T03:36:52.697' AS DateTime), N'cc6.jpg')
SET IDENTITY_INSERT [dbo].[tComment] OFF
SET IDENTITY_INSERT [dbo].[tIG] ON 

INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (121, N'台中に来ました〜。
@kame0630yochan さんのお店
Patisserie YEHZ

獺祭を使った柚子と抹茶のタルト絶品です💕

#台湾 #taiwan #台中 #patisserieyehz #台湾旅行 #台湾スイーツ', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/bcc84e978f3f2bba2fc33a43dfa8f19b/5D8DD54F/t51.2885-15/e35/57775438_273580116928898_94737871536522415_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'APRIL 21', N'https://www.instagram.com/p/BwhQvGlAHrf/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (122, N'✨季節限定的水蜜桃🍑塔
用整顆水蜜桃去籽擠入水蜜桃酒鮮奶油和覆盆子粒搭配底下開心果杏仁塔微酸不甜膩已滿足❤️
-
📍Pâtisserie YEHZ 葉食甜點工作室
-桃花源（水蜜桃、水蜜桃酒、覆盆子、開心果、杏仁）#桃花源#水蜜桃#台中甜點#葉食甜點工作室#台中#peachtart#taichungfood#patisserieyehz#patisserie#勤美#水蜜桃塔#dessertlover #popyummy #季節限定 #葉食甜點工作室 #台中美食 #', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/01a63913cbe4a5acba4bb478fe039b5d/5D99A804/t51.2885-15/e35/39323067_2086237118053542_5539972637440081920_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2018/8/29', N'https://www.instagram.com/p/BnDfpt9FylJ/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (123, N'YEHZ 🍊💕
-
#獺祭柚子 $250
獺祭酒凍、日本柚子醬
#百香果2點0 $140
艾許奶油、百香果蛋奶醬
-
#葉食 #葉食甜點工作室pâtisserieyehz #葉食 #YEHZ #patisserieyehz #葉食甜點工作室 #台中美食 #台中甜點 #Taichung #taichungfood #taichungfoodie #taichungpatisserie #taichungdessert
-
🤷🏻‍♂️ #LING台中', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/874b1cd2f8a292607a68d48528cc2d77/5D903EDF/t51.2885-15/e35/44921026_468344077022802_163881211687600128_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2018/12/1', N'https://www.instagram.com/p/Bq2RUSwBuyz/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (124, N'你選哪一道？🤤 #dessert #葉食甜點工作室 #patisserieyehz #taichungfood #taichung', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/e361272b2570ccab85c42818c81fea4a/5D844ED6/t51.2885-15/e35/31973768_1637338313031545_5124717572717019136_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2018/5/15', N'https://www.instagram.com/p/Biy6yndB9b4/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (125, N'看到愛店出了我最愛的蒙布朗🌰💕
還好2:00開店就來了～
大概半小時我們點的三個品項就售罄
嚇死寶寶👶🏻💥😱
好吃好吃～～～
-
#栗子蒙布朗 $180
栗子、鮮奶油、蛋白餅
#零香焦糖 $160
東加豆、鮮奶油、明膠、焦糖巧克力
#咖啡泡芙 $150
咖啡、香草
#YEHZcoffee $120
-
#葉食 #葉食甜點工作室pâtisserieyehz #葉食 #YEHZ #patisserieyehz #葉食甜點工作室 #台中美食 #台中甜點 #Taichung #taichungfood #taichungfoodie #taichungpatisserie #taichungdessert
-
🤷🏻‍♂️ #LING台中', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/64b4ff6ee775a1e4ac3eed624f333117/5D8BEE9A/t51.2885-15/e35/41516245_158133668454810_6813543239430176768_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2018/9/28', N'https://www.instagram.com/p/BoQrY0Vl-99/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (126, N'#葉食甜點工作室 #patisserieyehz', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/77d45245c99bb33d63b824150017d329/5D99B0BA/t51.2885-15/e35/16585079_362631797452617_5231967171000664064_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2017/2/8', N'https://www.instagram.com/p/BQPpAxKjauh/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (127, N'真心❤️！每個都好好吃，有濃有清爽，價位也非常合理！
#taichung#dessert#patisserieYEHZ#teatime☕️', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/10d44ddcf05f1b05b7855718bae94898/5D84FB0C/t51.2885-15/e35/29417765_158868894779648_1479132401111138304_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2018/4/5', N'https://www.instagram.com/p/BhLduCOhO08/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (128, N'葉食✌🏻我又來了
-
最近各家水蜜桃甜點相繼出爐🍑當然不能錯過這一波，尤其是Juicy的蜜桃一想到咬下去會啵啾🤤真的是太引誘犯罪了啦～
-
Btw, 超喜歡他們的包裝
-
#桃花園 $280
水蜜桃酒、杏仁，開心果、覆盆子、水蜜桃
#百香果膠囊 $170
百香果、椰子、椰子酒、鮮奶油、白巧克力、杏仁
#芋心捲 $95
大甲芋頭、牛奶、鮮奶油、蜂蜜、蛋、香草
-
#葉食 #葉食甜點工作室pâtisserieyehz #葉食 #YEHZ #patisserieyehz #葉食甜點工作室 #台中美食 #台中甜點 #Taichung #taichungfood #taichungfoodie #taichungpatisserie #taichungdessert
-
🤷🏻‍♂️ #LING台中', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/320d413fcde6ecfef8d0337bb9bf9053/5D7C90F7/t51.2885-15/e35/36973689_223098344900445_3519684463090991104_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2018/7/22', N'https://www.instagram.com/p/BlhvLUGF50R/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (129, N'姊姊限定 伯爵 #葉食甜點工作室 #patisserieyehz', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/1c76b1614e301af55ae1c7e26154eed5/5D98D243/t51.2885-15/e35/21911078_300943263719050_2839941468284518400_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2017/9/24', N'https://www.instagram.com/p/BZan440BE3d/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (130, N'🌟2019/04/03🌟
｛#patisserieYEHZ}
朝思暮想的天使泡芙～還是最愛之一的伯爵茶！怎麼能不衝
.
#伯爵泡芙$160、內餡滿滿伯爵茶味的卡司達鮮奶油～好幸福❤️
波蘿泡芙不是走那種像餅乾一樣酥脆的口感！但是我喜歡這種的！
📎希望下次能吃到抹茶口味
📎獺祭寶相華抹茶塔也非常推！
📎注意外袋不提供袋子哦！（店內僅有環保袋可購買） 📎店家沒有電話哦！要私訊預定 🈺️14：00-～19：00！

#台中甜點#葉食甜點工作室#台中必吃#taichungdessert', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/94e6f6455c1a6721ca208d73167af846/5D8F3EB7/t51.2885-15/e35/54463760_324631575073126_2495304807085719820_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2019/4/3', N'https://www.instagram.com/p/BvyT6LYF_5E/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (131, N'🉐姐姐限定 季節限定🉐
造型古錐的🌰蒙布朗
#patisserieyehz #葉食 #montblanc #taichung', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/3dee9f376102b37601b211124cbbb821/5D9541C5/t51.2885-15/e35/42003665_246905626015897_7170335870745051136_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2018/9/23', N'https://www.instagram.com/p/BoD1BvBARFb/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (132, N'甜點日。#草莓慕斯 #番茄生起司 #零陵香豆塔 #葉食

#patisserieyehz #YEHZ #strawberry mousse #tomato cheese #Tonkabean', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/77d2dee5a74841c7c6dd6ea3d48e35b8/5D7F6CBA/t51.2885-15/e35/29715181_354561328390129_4042850628370694144_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2018/4/8', N'https://www.instagram.com/p/BhToFW5AWyQ/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (133, N'噴💸的甜點2個400🍓草莓好好吃😭😭😭抹茶有明太子的味道❔👨🏿❔
#patisserieyehz#straberrycake#matchatart#taichung', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/cbc97ea3c9970be747199249ea4dfe12/5D8100E3/t51.2885-15/e35/25017344_2003828763206687_4861817474863071232_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2017/12/15', N'https://www.instagram.com/p/BcuHHlmlIb4/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (134, N'超大水槽!!!!!
❤️
#買不起洗碗機只好買超大水槽
#cominsoon
#patisserieyehz
#葉食甜點工作室', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/cbf92852d35ef8aee2af531a1f7e6d81/5D8FC578/t51.2885-15/e35/15099548_1832912800318487_273919253063663616_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2016/11/29', N'https://www.instagram.com/p/BNYmFhWjoqX/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (135, N'❤️台中最愛甜點店😍❤️
葉食甜點工作室
@patisserie_yehz
📍台中市西區博館路222號
🕰下午兩點開店，週一週二公休
😋😋😋😋
-小蜜柑塔🍊
-檸檬塔🍋
⚠️想吃請早點到因為開店就賣完了⚠️
.
.
.
#patisserieyehz #patisserie #tart #sweetdessert #taichung #葉食 #新品 #日本甜蜜 #台中 #台中甜點 #甜點 #好好吃', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/5485fb8f72fc389efcadea5ac16618b1/5D96C8DA/t51.2885-15/e35/52034031_254921732113141_2018686343457091504_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2019/3/1', N'https://www.instagram.com/p/Bud5lJEHyy5/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (136, N'草莓塔很特別底部是開心果🥒
還有我愛🖤放大版の咖啡豆
#草莓開心果 #咖啡慕斯 #葉食甜點工作室 #patisserieyehz #taichung #taichungfood #dessert #foodie #strawberry #coffee #afternoontea #草莓 #台中 #台中甜點 #coffeebeans #葉食', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/5062c0ae1ad8c5590312671d1f2dfb57/5DC73ABA/t51.2885-15/e35/17332435_1117896265004420_4397992750998355968_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2017/3/24', N'https://www.instagram.com/p/BSBL2f8Ah0p/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (137, N'好可惜沒吃到獺祭寶相華😭😭😭', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/3750e8a12d3e9d9c798242b713711923/5D91ED7A/t51.2885-15/e35/22427140_287923708368422_6803313061122801664_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2017/10/13', N'https://www.instagram.com/p/BaLrI8TBE8h/')
INSERT [dbo].[tIG] ([Id], [IgContent], [IgSrc], [IgDate], [IgLink]) VALUES (138, N'🇹🇼 Taiwan #taichung
#dessert #patisserieyehz #毛毛巴豆妖 #台中
說好減肥不吃甜點的
破功只要ㄧ秒
抹茶無雙 plus 葡萄柚生起司
葡萄柚微酸下面的生起司微甜餅乾薄薄ㄧ層
抹茶外型口感不知道為什麼我想到達克瓦茲
但我沒吃過達克瓦茲啊 純亂想
兩種都好吃！
果然是高質感的大人味甜點
開沒多久環境也很優質非常安靜', N'https://instagram.frmq2-2.fna.fbcdn.net/vp/74ad53b8c44f280e331637c0c1360d3c/5DC3A425/t51.2885-15/e35/19931721_1267562130033574_2979232871216054272_n.jpg?_nc_ht=instagram.frmq2-2.fna.fbcdn.net', N'2017/7/9', N'https://www.instagram.com/p/BWUdOVpg-Bx/')
SET IDENTITY_INSERT [dbo].[tIG] OFF
SET IDENTITY_INSERT [dbo].[tMember] ON 

INSERT [dbo].[tMember] ([Id], [email], [pwd], [repwd], [userName], [birthDay]) VALUES (1, N'admin@gmail.com', N'admin', N'admin', N'admin', CAST(N'1991-12-20' AS Date))
INSERT [dbo].[tMember] ([Id], [email], [pwd], [repwd], [userName], [birthDay]) VALUES (2, N'staff@gmail.com', N'staff', N'staff', N'staff', CAST(N'1991-12-20' AS Date))
INSERT [dbo].[tMember] ([Id], [email], [pwd], [repwd], [userName], [birthDay]) VALUES (3, N'sandra801225@yahoo.com.tw', N'123', N'123', N'陳亭吟', CAST(N'2019-06-01' AS Date))
INSERT [dbo].[tMember] ([Id], [email], [pwd], [repwd], [userName], [birthDay]) VALUES (4, N'abcd1223@gmail.com', N'123', N'123', N'王小花', CAST(N'2019-06-01' AS Date))
INSERT [dbo].[tMember] ([Id], [email], [pwd], [repwd], [userName], [birthDay]) VALUES (5, N'jking@fakemail.com', N'jking', N'jking', N'王大大', CAST(N'2009-11-18' AS Date))
INSERT [dbo].[tMember] ([Id], [email], [pwd], [repwd], [userName], [birthDay]) VALUES (6, N'jtaylor@fakemail.com', N'jtaylor', N'jtaylor', N'林宇中', CAST(N'1999-07-21' AS Date))
INSERT [dbo].[tMember] ([Id], [email], [pwd], [repwd], [userName], [birthDay]) VALUES (7, N'elee@fakemail.com', N'elee', N'elee', N'黃大銘', CAST(N'1999-02-16' AS Date))
INSERT [dbo].[tMember] ([Id], [email], [pwd], [repwd], [userName], [birthDay]) VALUES (8, N'jwilliams@fakemail.com', N'jwilliams', N'jwilliams', N'賴彥彥', CAST(N'2012-10-31' AS Date))
INSERT [dbo].[tMember] ([Id], [email], [pwd], [repwd], [userName], [birthDay]) VALUES (9, N'pgates@fakemail.com', N'pgates', N'pgates', N'簡詩詩', CAST(N'2003-05-20' AS Date))
INSERT [dbo].[tMember] ([Id], [email], [pwd], [repwd], [userName], [birthDay]) VALUES (10, N'chen@fakemail.com', N'123', N'123', N'陳亮亮', CAST(N'1993-06-10' AS Date))
INSERT [dbo].[tMember] ([Id], [email], [pwd], [repwd], [userName], [birthDay]) VALUES (32, N'sandra@gmail.com', N'123', N'123', N'珊卓拉', CAST(N'2010-06-29' AS Date))
SET IDENTITY_INSERT [dbo].[tMember] OFF
SET IDENTITY_INSERT [dbo].[tOrderDetail] ON 

INSERT [dbo].[tOrderDetail] ([Id], [OrderGuid], [userName], [pName], [pPrice], [pQty], [isApprove], [recName], [address], [OrderDate]) VALUES (79, N'e8bbd0c8', N'珊卓拉', N'抹茶無雙', 180, 2, N'已出貨', N'陳亭吟', N'台中市公益路二段51號20樓', CAST(N'2019-06-21T21:47:57.717' AS DateTime))
SET IDENTITY_INSERT [dbo].[tOrderDetail] OFF
SET IDENTITY_INSERT [dbo].[tProd] ON 

INSERT [dbo].[tProd] ([Id], [pName], [pComp], [pPrice], [pImage], [pSale]) VALUES (1, N'綠樹。達克瓦茲', N'寶相華抹茶/白巧克力奶油霜/覆盆子醬', 180, N'sc1.jpg', 1)
INSERT [dbo].[tProd] ([Id], [pName], [pComp], [pPrice], [pImage], [pSale]) VALUES (2, N'抹茶無雙', N'寶相華抹茶巴巴露亞/白巧克力/櫻桃酒', 180, N'sc2.jpg', 1)
INSERT [dbo].[tProd] ([Id], [pName], [pComp], [pPrice], [pImage], [pSale]) VALUES (3, N'葡萄柚生起司', N'生乳酪/柑橘酒漬葡萄柚&檸檬&柳橙', 190, N'sc3.jpg', 1)
INSERT [dbo].[tProd] ([Id], [pName], [pComp], [pPrice], [pImage], [pSale]) VALUES (4, N'鳳梨泰姬瑪哈陵', N'椰奶/鳳梨果凍&果肉/鳳梨巴巴露亞', 180, N'sc4.jpg', 1)
INSERT [dbo].[tProd] ([Id], [pName], [pComp], [pPrice], [pImage], [pSale]) VALUES (5, N'覆盆子開心果', N'覆盆子/開心果/白巧克力', 200, N'sc5.jpg', 1)
INSERT [dbo].[tProd] ([Id], [pName], [pComp], [pPrice], [pImage], [pSale]) VALUES (6, N'栗子蒙布朗', N'杏仁榛果蛋白餅/栗子粒香緹鮮奶油/栗子泥', 150, N'sc6.jpg', 1)
INSERT [dbo].[tProd] ([Id], [pName], [pComp], [pPrice], [pImage], [pSale]) VALUES (7, N'小蜜柑', N'小蜜柑/開心果', 200, N'sc7.jpg', 1)
INSERT [dbo].[tProd] ([Id], [pName], [pComp], [pPrice], [pImage], [pSale]) VALUES (8, N'芒果塔', N'芒果凍/達克瓦滋/芒果巴巴露亞/芒果酒', 200, N'sc8.jpg', 1)
SET IDENTITY_INSERT [dbo].[tProd] OFF
USE [master]
GO
ALTER DATABASE [dbCakeShop] SET  READ_WRITE 
GO
