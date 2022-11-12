-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2022 at 05:04 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jj`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image_path`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'RAM', 'RAM (random access memory) is a computer\'s short-term memory, where the data that the processor is currently using is stored.', 'uploads/brands/1.jpg?v=1665644921', 1, 0, '2022-10-13 15:08:41'),
(2, 'Laptop', 'A laptop is a small, portable personal computer (PC) with a screen and alphanumeric keyboard.', 'uploads/brands/2.jpg?v=1665672616', 1, 0, '2022-10-13 22:50:16'),
(3, 'Keyboard', 'A computer keyboard is a peripheral input device modeled after the typewriter keyboard which uses an arrangement of buttons or keys to act as mechanical levers or electronic switches.', 'uploads/brands/3.jpeg?v=1665801915', 1, 0, '2022-10-15 10:45:14'),
(4, 'PC SET', 'A personal computer (PC) is a multi-purpose microcomputer whose size, capabilities, and price make it feasible for individual use.', NULL, 1, 0, '2022-10-17 16:22:11'),
(5, 'Mouse', 'A computer mouse is a hand-held pointing device that detects two-dimensional motion relative to a surface.', NULL, 1, 0, '2022-10-17 16:57:14'),
(6, 'Graphics Card', 'A graphics card also called a video card, display card, graphics adapter, GPU, VGA card/VGA, video adapter, or display adapter) is an expansion card which generates a feed of output images to a display device, such as a computer monitor.', NULL, 1, 0, '2022-10-17 17:05:34');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(11, 1, 8, 1600, 1, '2022-10-19 22:45:16');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Our Shop', 'Pc Tech products', 1, 0, '2022-10-13 15:07:57');

-- --------------------------------------------------------

--
-- Table structure for table `chatbot`
--

CREATE TABLE `chatbot` (
  `id` int(11) NOT NULL,
  `queries` varchar(300) NOT NULL,
  `replies` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chatbot`
--

INSERT INTO `chatbot` (`id`, `queries`, `replies`) VALUES
(1, 'hi', 'hello'),
(2, 'where is your shop', 'We are at 61 Incantadora St. Poblacion, Mapandan');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Mark', 'Tinte', 'Male', '09123011325', 'joshuatinte321@gmail.com', 'a6b2a418143fb0c8c04f488d23bda47d', 'Mapandan, Pangasinan', 1, 0, '2022-10-13 15:05:43');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `variant` text NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `variant`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 'Laptop only', 1, 18, 14999, '2022-10-13 22:55:05', '2022-10-17 21:11:29'),
(2, 'Laptop + Keyboard', 1, 24, 15499, '2022-10-13 22:55:50', '2022-10-17 21:10:16'),
(3, 'Keyboard only', 2, 21, 999, '2022-10-15 10:47:46', '2022-10-17 21:11:52'),
(4, 'Keyboard only', 3, 13, 9941, '2022-10-17 15:47:14', '2022-10-17 21:12:38'),
(5, 'Keyboard Only', 4, 15, 5262, '2022-10-17 15:56:54', '2022-10-17 21:12:48'),
(6, 'Keyboard', 5, 15, 999, '2022-10-17 15:58:27', '2022-10-17 21:13:00'),
(7, '1 pc', 6, 22, 899, '2022-10-17 16:02:51', '2022-10-17 21:13:22'),
(8, '2 pcs', 6, 16, 1600, '2022-10-17 16:03:34', '2022-10-17 21:13:30'),
(9, '1 pc', 7, 35, 1559, '2022-10-17 16:08:02', NULL),
(10, '1 pc', 8, 24, 6355, '2022-10-17 16:15:31', NULL),
(11, '1 pc', 9, 45, 2299, '2022-10-17 16:19:50', NULL),
(12, 'ALL', 10, 36, 12999, '2022-10-17 16:27:57', '2022-10-17 21:11:02'),
(13, 'Used', 11, 15, 8999, '2022-10-17 16:30:51', '2022-10-17 21:13:09'),
(14, 'Complete', 12, 19, 12999, '2022-10-17 16:48:19', '2022-10-17 21:12:27'),
(15, 'Complete', 13, 14, 22359, '2022-10-17 16:54:00', '2022-10-17 21:11:41'),
(16, 'Mouse only', 14, 16, 1500, '2022-10-17 16:58:36', '2022-10-17 21:12:20'),
(17, 'Mouse', 15, 16, 599, '2022-10-17 16:59:44', '2022-10-17 21:12:15'),
(18, 'Mouse Only', 17, 18, 1500, '2022-10-17 17:02:20', '2022-10-17 21:12:08'),
(19, '2GB DDR5', 18, 16, 5999, '2022-10-17 17:07:46', '2022-10-17 21:11:59'),
(20, '12GB GDDR6', 19, 19, 30999, '2022-10-17 17:11:08', '2022-10-17 21:10:50'),
(21, '6GB GDDR6', 20, 26, 19999, '2022-10-17 17:14:46', '2022-10-17 21:10:40'),
(22, '8GB GDDR6X', 21, 9, 50999, '2022-10-17 17:17:40', '2022-10-17 21:11:16'),
(23, 'MOUSE', 16, 12, 399, '2022-10-17 17:21:54', '2022-10-17 21:10:26');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `ref_code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = pending,\r\n1= Packed,\r\n2 = Out for Delivery,\r\n3=Delivered,\r\n4=cancelled',
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `ref_code`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(1, '20221000001', 1, 'Mapandan, Pangasinan', 'cod', 0, 14999, 3, 1, '2022-10-13 23:00:22', '2022-10-13 23:17:21'),
(2, '20221000002', 1, 'Mapandan, Pangasinan', 'cod', 0, 14999, 4, 0, '2022-10-14 22:36:29', '2022-10-14 22:36:45'),
(3, '20221000003', 1, 'Mapandan, Pangasinan', 'cod', 0, 30498, 3, 1, '2022-10-15 10:42:02', '2022-10-17 22:48:01'),
(4, '20221000004', 1, 'Mapandan, Pangasinan', 'cod', 0, 16997, 4, 0, '2022-10-17 20:13:25', '2022-10-17 20:48:49'),
(5, '20221000005', 1, 'Mapandan, Pangasinan', 'cod', 0, 19999, 4, 0, '2022-10-17 20:33:50', '2022-10-17 20:48:26'),
(6, '20221000006', 1, 'Mapandan, Pangasinan', 'cod', 0, 15499, 3, 1, '2022-10-17 20:52:21', '2022-10-17 21:13:51'),
(7, '20221000007', 1, 'Mapandan, Pangasinan', 'cod', 0, 1500, 3, 1, '2022-10-17 21:01:16', '2022-10-17 21:05:08'),
(8, '20221000008', 1, 'Mapandan, Pangasinan', 'cod', 0, 599, 0, 0, '2022-10-18 00:14:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `inventory_id`, `quantity`, `price`, `total`) VALUES
(1, 1, 1, 1, 14999, 14999),
(2, 2, 1, 1, 14999, 14999),
(3, 3, 1, 1, 14999, 14999),
(4, 3, 1, 1, 15499, 15499),
(5, 4, 2, 2, 999, 1998),
(6, 4, 1, 1, 14999, 14999),
(7, 5, 20, 1, 19999, 19999),
(8, 6, 1, 1, 15499, 15499),
(9, 7, 14, 1, 1500, 1500),
(10, 8, 15, 1, 599, 599);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `specs` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `name`, `specs`, `status`, `delete_flag`, `date_created`) VALUES
(1, 2, 1, 'ASUS Thin Light Business Student Laptop Computer', '&lt;p&gt;&lt;div class=&quot;more-product-detail-content&quot; style=&quot;box-sizing: border-box; margin: 0px 0px 30px; padding: 0px; list-style: none; border: none; outline: none; color: rgb(21, 21, 21); font-family: &amp;quot;Open Sans&amp;quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;/div&gt;&lt;/p&gt;&lt;div class=&quot;features&quot; id=&quot;features&quot; style=&quot;box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; list-style: none; border: none; outline: none; color: rgb(21, 21, 21); font-family: &amp;quot;Open Sans&amp;quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;ul itemprop=&quot;description&quot; style=&quot;box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; border: none; outline: none;&quot;&gt;&lt;li style=&quot;box-sizing: border-box; margin: 0px; padding: 8px 0px; list-style: none; border: none; outline: none;&quot;&gt;【Processor】Dual Core Intel Celeron N4020 , 2.80GHz Brust Frequency, 6W TDP, 4MB Cache, Featuring true machine intelligence and a newly designed efficient architecture, the groundbreaking processor learns and adapts to your needs so you can achieve more&lt;/li&gt;&lt;li style=&quot;box-sizing: border-box; margin: 0px; padding: 8px 0px; list-style: none; border: none; outline: none;&quot;&gt;【Display】14&quot; HD (1366 x 768) Display with NanoEdge and up to 178 degree viewing angles, narrow bezel design, enables you to focus more on your work and studies&lt;/li&gt;&lt;li style=&quot;box-sizing: border-box; margin: 0px; padding: 8px 0px; list-style: none; border: none; outline: none;&quot;&gt;【Memory &amp;amp; Storage】4GB High-Bandwidth DDR4 Memory, 64GB Storage, Smoothly run multiple applications and browser tabs at the same time, ensure the smoothness of daily use and improve your work efficiency&lt;/li&gt;&lt;li style=&quot;box-sizing: border-box; margin: 0px; padding: 8px 0px; list-style: none; border: none; outline: none;&quot;&gt;【Operating System】 Windows 11 Home | 12Hrs+ Battery Life&lt;/li&gt;&lt;li style=&quot;box-sizing: border-box; margin: 0px; padding: 8px 0px; list-style: none; border: none; outline: none;&quot;&gt;【Included in the package】Bundled with Microfiber Cloth&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;', 1, 0, '2022-10-13 22:51:45'),
(2, 3, 1, 'SteelSeries  Apex 3 Gaming Keyboard ', '&lt;p&gt;This all-in-one complete gaming bundle includes everything you need to take your gaming to the next level including an Apex 3 Gaming Keyboard, Rival 3 Gaming Mouse, and QcK M Gaming Mousepad &ndash; all in one box.&lt;br&gt;&lt;/p&gt;', 1, 0, '2022-10-15 10:46:31'),
(3, 3, 1, 'Corsair Strafe RGB MK.2 Mechanical Keyboard', '&lt;p&gt;The next-generation Corsair Strafe RGB MK.2 Mechanical Keyboard features 100% Cherry MX RGB key switches with vibrant RGB backlighting, full-key-rollover anti-ghosting, and 8 MB onboard profile storage to take your gaming profiles with you. The dedicated multimedia and volume controls allow you to adjust your audio without interrupting your game while the USB pass-through port provides convenient access to plug in your devices. Powerful Corsair iCUE software enables sophisticated macro programming vivid dynamic multicolor illumination and full-system lighting synchronization. Strafe RGB MK.2 comes fully loaded with a detachable soft-touch palm rest to provide optimal comfort and textured FPS/MOBA keycap sets. Get your game on with the Corsair Strafe RGB MK.2 Mechanical Keyboard.&lt;br&gt;&lt;/p&gt;', 1, 0, '2022-10-17 15:44:34'),
(4, 3, 1, 'Razer BlackWidow Wired Gaming Keyboard ', '&lt;p&gt;Razer BlackWidow Wired Gaming Keyboard for PC, Green Mechanical Switches, Chroma RGB Lighting, Hybrid On-Board Memory, N-Key Rollover, Up to 80 Million Key Strokes, Easy Cable Management, Black&lt;/p&gt;', 1, 0, '2022-10-17 15:53:48'),
(5, 3, 1, 'Snpurdiri Wired Gaming Keyboard', '&lt;p&gt;Snpurdiri Wired Gaming Keyboard, Mechanical Feeling Small Mini Gaming Keyboard, Portable Compact RGB Backlit Keyboard for PC, Mac, Office, Gaming (68 Keys, Black&lt;/p&gt;&lt;p&gt;✅Mini 60% Compact Layout - Snpurdiri 60 percent gaming keyboard without numeric keypad can save more space for mouse movements, improve your gaming experience, best choice for FPS game lover.&lt;/p&gt;&lt;p&gt;✅RGB Backlit - This RGB keyboard provides 8 backlit colors and multiple backlight modes, you can customize the brightness and breathing rate to your liking. Cool backlight effects can enhance your gaming ambience for a better experience.&lt;/p&gt;&lt;p&gt;✅Ergonomic Gaming Keyboard - Conform to ergonomics, kickstand feet can adjust typing angle, keeping your hand in a most natural state to reduce hand fatigue after longtime use.&lt;/p&gt;&lt;p&gt;✅Mechanical Feeling Keyboard - This membrane keyboard has a mechanical feel comparable to a mechanical keyboard, at the same time, each keystroke produces a soft sound, avoid disturbing noise, designed for gamer and office worker.&lt;/p&gt;&lt;p&gt;✅Broad Compatibility - Plug and play, no drivers or software required, save more time. This microsoft keyboard is compatible with Windows (XP/ VISTA/ 7/ 8/ 10), Mac OS and other systems.&lt;/p&gt;', 1, 0, '2022-10-17 15:58:09'),
(6, 1, 1, 'Corsair Vengeance LPX 32GB DDR4 3200 Desktop Memory', '&lt;p&gt;Hand-sorted memory chips ensure high performance with generous overclocking headroom&lt;/p&gt;&lt;p&gt;VENGEANCE LPX is optimized for wide compatibility with the latest Intel and AMD DDR4 motherboards&lt;/p&gt;&lt;p&gt;A low-profile height of just 34mm ensures that VENGEANCE LPX even fits in most small-form-factor builds&lt;/p&gt;&lt;p&gt;A solid aluminum heatspreader efficiently dissipates heat from each module so that they consistently run at high clock speeds&lt;/p&gt;&lt;p&gt;Supports Intel XMP 2.0 for simple one-setting installation and setup&lt;/p&gt;&lt;p&gt;Available in multiple colors to match the style of your system&lt;/p&gt;', 1, 0, '2022-10-17 16:01:12'),
(7, 1, 1, 'G.Skill Trident Z RGB Series SDRAM DDR4 3600', '&lt;p&gt;G.Skill Trident Z RGB Series 32GB (2 x 16GB) 288-Pin SDRAM DDR4 3600 CL18-22-22-42 1.35V Dual Channel Desktop Memory F4-3600C18D-32GTZR&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Trident Z RGB Series, compatible for AMD Ryzen 3000 and X570 Series; Intel Z390 and newer.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;32GB kit containing 2 x 16GB modules, DDR4-3600, 288-Pin, CAS Latency CL18 (18-22-22-42) at 1.35V (Intel XMP)&lt;/p&gt;&lt;p&gt;Brand: G.SKILL, Series: Trident Z RGB, Model: F4-3600C18D-32GTZR&lt;/p&gt;&lt;p&gt;Capacity: 32GB (2x16GB), ECC: No, Dual Channel Kit, Recommended Use: High Performance or Gaming Memory&lt;/p&gt;&lt;p&gt;XMP 2.0 profile support to reach up to the rated overclock speed, or run at default JEDEC profile speed&lt;/p&gt;&lt;p&gt;Rated XMP frequency &amp;amp; stability depends on MB &amp;amp; CPU capability&lt;/p&gt;&lt;p&gt;Check G.Skill QVL or RAM Configurator on the G.Skill website for validated motherboards&lt;/p&gt;', 1, 0, '2022-10-17 16:06:58'),
(8, 1, 1, 'Kingston FURY Beast RGB 16GB 3600MHz DDR4 Desktop Memory', '&lt;p&gt;Kingston FURY Beast DDR4 RGB delivers a boost of performance and style with speeds of up to 3733MHz, aggressive styling, and RGB lighting that runs the length of the module for smooth and stunning effects. This dazzling, cost-effective upgrade is available in 2666MHz&ndash;3733MHz speeds, CL15&ndash;19 latencies, single module capacities of 8GB&ndash;32GB, and kit capacities of 16GB&ndash;128GB. It features Plug N Play automatic overclocking at 2666MHz speeds and is both Intel XMP-ready and ready for Ryzen. FURY Beast DDR4 RGB stays cool with its stylish, low-profile heat spreader.&lt;br&gt;&lt;/p&gt;', 1, 0, '2022-10-17 16:09:21'),
(9, 1, 1, 'TEAMGROUP T-Force Vulcan Z DDR4 DRAM 16GB 3200MHz Desktop Memory', '&lt;p&gt;TEAMGROUP T-Force Vulcan Z DDR4 DRAM 16GB Kit (2x8GB) 3200MHz Desktop Memory Module (PC4-25600) CL16 Ram (Gray) - TLZGD416G3200HC16FDC01&lt;/p&gt;&lt;p&gt;Simple design to perfectly protect the cooling module&lt;/p&gt;&lt;p&gt;High thermal conductive adhesive&lt;/p&gt;&lt;p&gt;Supports Intel &amp;amp; AMD motherboards&lt;/p&gt;&lt;p&gt;Selected high-quality IC, Supports XMP2.0&lt;/p&gt;', 1, 0, '2022-10-17 16:19:23'),
(10, 4, 1, 'DELL Optiplex 7020 Desktop Computer PC', '&lt;p&gt;DELL Optiplex 7020 Desktop Computer PC, Intel Quad-Core i5, 250GB HDD, 8GB DDR3 RAM, Windows 10 Home, DVD, WIFI, 22in Monitor, USB Keyboard and Mouse (Used - Like New)&lt;/p&gt;&lt;p&gt;Originally designed for heavy use in the corporate environment, this Dell computer has been rebuilt with higher quality components than you\\\\\\\'ll find in typical off-the-shelf retail models.&lt;/p&gt;&lt;p&gt;Specifically configured for optimal use at home or school, this computer has been professionally rebuilt by a Microsoft Authorized Refurbisher (MAR). Every component is tested for full functionality to ensure years of ongoing performance and reliability.&lt;/p&gt;', 1, 0, '2022-10-17 16:26:56'),
(11, 4, 1, 'HP Desktop Computer i5 Quad Core', '&lt;p&gt;HP Desktop Computer i5 Quad Core Windows 11 8GB RAM 1TB HD Wi-fi with a 19 LCD Monitor Keyboard and Mouse - Used PC&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Intel Core i5 quad-core processor3.40 GHz, 6MB CacheDDR3 SDRAM system memory (expandable to 32GB)Gives you the power to handle most power-hungry applications and tons of multimedia workSATA hard driveStore 166,000 photos, 71,000 songs or 131 hours of HD video and moreDVD driveWatch movies and read CDs and DVDs in multiple formats10/100/1000Base-T EthernetConnect to a broadband modem with wired Ethernet&lt;/span&gt;&lt;/p&gt;', 1, 0, '2022-10-17 16:30:29'),
(12, 4, 1, 'Dell Gaming Desktop Computer SFF', '&lt;p&gt;Dell Gaming Desktop Computer SFF, Core i5-4th Gen. 16GB Ram, 500GB HDD, Nvidia GT 730 4GB Graphics, 19&quot; LCD, 16GB Flash Drive, Keyboard &amp;amp; Mouse, Wi-Fi, Bluetooth, Windows 10 Pro (Renewed)&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Originally designed for heavy use in the corporate environment, this Dell computer has been Renewed with higher quality components than you\\\\\\\'ll find in typical off the shelf retail models. Perfect for business, home, and school, this computer has been professionally refurbished by SJ Computers. Every component is tested for full functionality to ensure years of ongoing performance and reliability. A fresh and authentic installation of Microsoft Windows 10 is performed with the new license digitally rendered in the PC for an easy and secure start upon first use.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2022-10-17 16:47:46'),
(13, 4, 1, 'Dell OptiPlex Desktop Computer PC ', '&lt;p&gt;Dell OptiPlex Desktop Computer PC w/RGB Lighting, Ultra-Fast Intel i5 Quad-Core, 8GB RAM, 500GB SSD, DVD-RW, Windows 10 Home, WiFi, Includes 24&quot; Monitor and Periphio 4-in-1 Kit&lt;/p&gt;&lt;p&gt;CPU: Intel Quad Core i5-3470 Processor&amp;nbsp;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;iGPU: Intel HD Graphics (for Streaming Multi-tasking, &amp;amp; Productivity)&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;RAM: 8 GB DDR3&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Storage Drive: 500GB Solid State Drive&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Operating System: Windows 10 Home&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Optical: DVDRW Drive&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;USB: (4) USB 3.0 &amp;amp; (6) USB 2.0 ports for connectivity&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Network: Onboard Gigabit Network Adapter, USB WiFi Adapter&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;RGB Lighting: Installed and setup RGB Light strip with wireless remote for c&lt;/span&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;ustomizing your look&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Peripherals: New Periphio 24 Inch Monitor, Periphio 4in1 Bundle - Keyboard, Mouse,&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Headset, and large mouse pad&lt;/span&gt;&lt;/p&gt;', 1, 0, '2022-10-17 16:52:53'),
(14, 5, 1, 'Anker 2.4G Wireless Vertical Ergonomic Optical Mouse', '&lt;p&gt;Anker 2.4G Wireless Vertical Ergonomic Optical Mouse, 800 / 1200 /1600 DPI, 5 Buttons for Laptop, Desktop, PC, Macbook - Black&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Scientific ergonomic design encourages healthy neutral &quot;handshake&quot; wrist and arm positions for smoother movement and less overall strain.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;800 / 1200 / 1600 DPI Resolution Optical Tracking Technology provides more sensitivity than standard optical mice for smooth and precise tracking on a wide range of surfaces.&lt;/p&gt;', 1, 0, '2022-10-17 16:58:03'),
(15, 5, 1, 'E-YOOSO Wireless Mouse', '&lt;p&gt;Wireless Mouse, E-YOOSO Computer Mouse 18 Months Battery Life Cordless Mouse, 5-Level 2400 DPI, 6 Button Ergo Wireless Mice, 2.4G Portable USB Wireless Mouse for Laptop, Mac, Chromebook, PC, Windows&lt;/p&gt;&lt;p&gt;5-level DPI settings (800/1200/1600/2000/2400) to meet your multiple needs, either for daily work or gaming. The factory default is 1200DPI, with DPI gear indication,which will indicated the current DPI gear speed by LED flash times (1/2/3/4/5 times). 2️⃣ 2 kind polling rate adjustment :125Hz/250Hz，the factory default is 125Hz. Press the right button + the middle buttom for 3 seconds to switch (during the switching process, LED will flash 5 times).&lt;/p&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;', 1, 0, '2022-10-17 16:59:23'),
(16, 5, 1, 'OKIMO LED Wireless Mouse', '&lt;p&gt;Upgrade】 LED Wireless Mouse, Rechargeable Slim Silent Mouse 2.4G Portable Mobile Optical Office Mouse with USB &amp;amp; Type-c Receiver, 3 Adjustable DPI for Notebook, PC, Laptop, Computer, Desktop (Black)&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;【LED Design】The upgraded version mouse with the LED lights adds more fun to the boring office life. The bottom of the mouse has a switch, you can switch lights freely. Low-key or sparkle, switch in one second, suitable for any occasion.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;【Rechargeable Optical Mouse】Built-in durable rechargeable battery, it can be easily charged using the included USB cable without replacing the battery. Just 2 hours charging, you can use it about 7-15 days. Standby time is very long, energy-saving features, automatic sleep mode and wake-up mode are installed to save energy. Turn off the mouse LED light when not in use to save power.&lt;/p&gt;', 1, 0, '2022-10-17 17:00:40'),
(17, 5, 1, 'T-DAGGER Wireless Gaming Mouse - USB Cordless', '&lt;p&gt;Ergonomic Silent Gamer Laptop Mouse with 7 Silent Click Buttons, 5 Adjustable DPI Plug &amp;amp; Play for PC, Windows, Mac&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;【Silent &amp;amp; Durable Click】Gaming mouse will make no noise when clicking left or right buttons, no worry for disturbing others. Suitable for public places such as office, library dormitory, cafe, etc. Our wireless mouse is tested for up to 5 million clicks.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;【Cool LED Backlights】Mouse for gaming provides a BLUE LED backlit, greatly matching your cool style and creating a great atmosphere to enhance your gaming fun. Besides, gaming mouse will make your gaming room more special, especially at night.(Light is disabled)&lt;/p&gt;&lt;p&gt;【5 DPI Levels for Gaming and Work】Wireless gaming mouse can be driven from 2400-2000-1600-1200-800 DPI, providing excellent sensitivity and precise tracking on a wide range, ideal for gaming and daily work.&lt;/p&gt;', 1, 0, '2022-10-17 17:01:48'),
(18, 6, 1, 'ASUS NVIDIA GeForce GT 730 Graphics Card 2GB GDDR5', '&lt;p&gt;ASUS NVIDIA GeForce GT 730 Graphics Card (PCIe 2.0, 2GB GDDR5 Memory, 4X HDMI Ports, Single-Slot Design, Passive Cooling)&lt;/p&gt;&lt;p&gt;4x HDMI Ports enable multi-monitor productivity on up to 4 displays.&lt;/p&gt;&lt;p&gt;Single-slot Design fits in small chassis and leaves room for additional PCIe devices.&lt;/p&gt;&lt;p&gt;Passive Cooling keeps things quiet.&lt;/p&gt;', 1, 0, '2022-10-17 17:07:05'),
(19, 6, 1, 'Sapphire AMD Radeon RX 6700 XT Gaming OC 12GB GDDR6', '&lt;p&gt;Sapphire AMD Radeon RX 6700 XT Gaming OC 12GB GDDR6Video Card 11306-01-20G Nitro Plus AMD Radeon RX 6700 XT Gaming OC 12GB GDDR6 Retail.&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Features:&lt;/p&gt;&lt;p&gt;Tri-X Cooling Technology&lt;/p&gt;&lt;p&gt;Two-Ball Bearing Fans&lt;/p&gt;&lt;p&gt;AMD RDNA2 Architecture&lt;/p&gt;&lt;p&gt;DirectX 12 Ultimate Support&lt;/p&gt;&lt;p&gt;Content Creation with up to 12GB GDDR6&lt;/p&gt;', 1, 0, '2022-10-17 17:10:35'),
(20, 6, 1, 'ASUS GeForce RTX 2060 Overclocked 6G GDDR6', '&lt;p&gt;Digital Max Resolution:7680 x 4320&lt;/p&gt;&lt;p&gt;Powered by NVIDIA Turing with 1785 MHz Boost Clock, 1920 CUDA cores and overclocked 6GB GDDR6 memory&lt;/p&gt;&lt;p&gt;Supports up-to 4 monitors with DisplayPort 1. 4, HDMI 2. 0 and DVI ports&lt;/p&gt;&lt;p&gt;Wing-Blade Fans boasts IP5X dust-resistance and operates at 0 dB levels when temperatures hit below 55C.&lt;/p&gt;', 1, 0, '2022-10-17 17:12:55'),
(21, 6, 1, 'ASUS ROG Strix NVIDIA GeForce RTX 3070', '&lt;p&gt;ASUS ROG Strix NVIDIA GeForce RTX 3070 Ti OC Edition Gaming Graphics Card (PCIe 4.0, 8GB GDDR6X, HDMI 2.1, DisplayPort 1.4a, Axial-tech Fan Design, 2.9-Slot, Super Alloy Power II, GPU Tweak II)&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;NVIDIA Ampere Streaming Multiprocessors: The building blocks for the world&rsquo;s fastest, most efficient GPU, the all-new Ampere SM brings 2X the FP32 throughput and improved power efficiency.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;2nd Generation RT Cores: Experience 2X the throughput of 1st gen RT Cores, plus concurrent RT and shading for a whole new level of ray tracing performance.&lt;/p&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;', 1, 0, '2022-10-17 17:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 1, 14999, '2022-10-13 23:00:22'),
(2, 2, 14999, '2022-10-14 22:36:30'),
(3, 3, 30498, '2022-10-15 10:42:02'),
(4, 4, 16997, '2022-10-17 20:13:25'),
(5, 5, 19999, '2022-10-17 20:33:51'),
(6, 6, 15499, '2022-10-17 20:52:21'),
(7, 7, 1500, '2022-10-17 21:01:16'),
(8, 8, 599, '2022-10-18 00:14:48');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'JJ PC TECH'),
(2, 'short_name', 'JJ PC TECH'),
(3, 'logo', 'uploads/logo-1665498473.png?v=1665498473'),
(4, 'cover', 'uploads/cover-1665496447.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.png?v=1645064505', NULL, 1, '2021-01-20 14:02:37', '2022-02-17 10:21:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
