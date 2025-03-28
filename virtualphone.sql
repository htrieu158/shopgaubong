-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2025 at 06:49 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `virtualphone`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
  `name_bank` varchar(255) NOT NULL,
  `num_bank` varchar(255) NOT NULL,
  `name_num` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id_bill` int(11) NOT NULL,
  `bill_code` varchar(255) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_pro` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `name_pro` varchar(255) NOT NULL,
  `full_name` varchar(55) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` int(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `payment` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1.Thanh toán khi nhận hàng 2.Chuyển khoản ngân hàng 3.Thanh toán online',
  `order_date` datetime NOT NULL,
  `total_amount` int(10) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0.Đơn hàng mới \r\n1.Đang xử lý\r\n2.Đang giao hàng\r\n3.Đã giao hàng',
  `status_pay` varchar(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id_bill`, `bill_code`, `id_user`, `id_pro`, `user_name`, `name_pro`, `full_name`, `address`, `phone`, `email`, `payment`, `order_date`, `total_amount`, `status`, `status_pay`) VALUES
(91, '42615', 30, 0, 'user', '', 'Nguyễn Cường', 'Thái Bình', 904059404, 'nguyencuongf75@gmail.com', 1, '2024-07-10 04:34:29', 35980000, 0, '0'),
(92, '28934', 30, 0, 'user', '', 'Nguyễn Cường', 'Thái Bình', 904059404, 'nguyencuongf75@gmail.com', 1, '2024-07-10 08:32:12', 5990000, 0, '0'),
(93, '97524', 30, 0, 'user', '', 'Nguyễn Cường', 'Thái Bình', 904059404, 'nguyencuongf75@gmail.com', 1, '2024-07-20 10:39:35', 3180000, 3, '1'),
(94, '13426', 31, 0, 'linh2k5', '', 'Nguyễn Linh', 'Đà Nẵng', 904059404, 'nguyenlinh2005@gmail.com', 1, '2024-07-20 03:43:03', 368000, 3, '1'),
(95, '26578', 32, 0, 'trieu123', '', 'Hoàng Triều', 'hhhh', 334568848, 'trieu123@gmail.com', 1, '2024-11-07 05:24:57', 150000000, 2, '0');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `id_pro` int(11) NOT NULL,
  `img_pro` varchar(255) NOT NULL,
  `name_pro` varchar(255) NOT NULL,
  `price_pro` int(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_amount` int(10) NOT NULL,
  `id_bill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `user_name`, `id_pro`, `img_pro`, `name_pro`, `price_pro`, `quantity`, `total_amount`, `id_bill`) VALUES
(86, 31, 'linh2k5', 40, 'a10.jpg', 'Gấu Bông Hoạt Hình', 184000, 2, 368000, 94),
(87, 32, 'trieu123', 42, 'a3.jpg', 'Chó Đức', 150000000, 1, 150000000, 95);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_cate` int(11) NOT NULL,
  `name_cate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id_cate`, `name_cate`) VALUES
(1, 'GẤU TEDDY'),
(7, 'GẤU BÔNG TO'),
(8, 'GẤU BÔNG GIÁ RẺ'),
(10, 'THÚ BÔNG'),
(11, 'BST NGÀY LỄ'),
(12, 'NHÂN VẬT HOẠT HÌNH'),
(13, 'PHỤ KIỆN GẤU BÔNG'),
(14, 'GỐI BÔNG'),
(19, 'BST GẤU BÔNG BIG SIZE');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id_cmt` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `id_pro` int(11) NOT NULL,
  `comment_date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id_cmt`, `content`, `id_user`, `user_name`, `full_name`, `id_pro`, `comment_date`) VALUES
(25, 'sản phẩm tốt', 31, 'linh2k5', 'Nguyễn Linh', 41, '07/20/2024 03:46:48pm');

-- --------------------------------------------------------

--
-- Table structure for table `history_bank`
--

CREATE TABLE `history_bank` (
  `id` int(11) NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `tranid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history_bank`
--

INSERT INTO `history_bank` (`id`, `amount`, `comment`, `time`, `tranid`) VALUES
(21, '1000', 'CUSTOMER 94173 Trace 985625', '30/11/2022 14:30:00', 'FT22334261631086BNK'),
(22, '0', 'CUSTOMER DO QUANG LINH chuyen khoan - Ma gia o dich/ Trace 401309', '30/11/2022 13:40:00', 'FT22334147891961'),
(23, '0', 'CUSTOMER Thanh toan QR DO QUANG LINH chuyen  khoan - Ma giao dich/ Trace 031916', '30/11/2022 11:45:00', 'FT22334401685537'),
(24, '0', 'CUSTOMER DO QUANG LINH chuyen khoan - Ma gia o dich/ Trace 070167', '30/11/2022 11:18:00', 'FT22334305991988'),
(25, '100000', 'CUSTOMER MBVCB 2768157086 025846 NGUYEN KHAC  TOAN chuyen tien CT tu 04510004281 92 NGUYEN KHAC TOAN toi 60000000003  DO QUANG LINH Ngan hang Quan Doi  ', '30/11/2022 10:44:00', 'FT22334426800035BNK'),
(26, '0', 'CUSTOMER Thanh toan QR DO QUANG LINH chuyen  khoan - Ma giao dich/ Trace 462972', '30/11/2022 09:02:00', 'FT22334100078954'),
(27, '1000', 'CUSTOMER Linh 17654 Trace 588656', '30/11/2022 02:33:00', 'FT22334547643305BNK'),
(28, '1000', 'CUSTOMER Linh 04678 Trace 581325', '30/11/2022 02:18:00', 'FT22334507816023BNK'),
(29, '1000', 'CUSTOMER Chuyen tien Trace 571867', '30/11/2022 01:53:00', 'FT22334062224594BNK');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_pro` int(11) NOT NULL,
  `name_pro` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `img_pro` varchar(255) NOT NULL,
  `short_des` text NOT NULL,
  `detail_des` text NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `idcate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_pro`, `name_pro`, `price`, `discount`, `img_pro`, `short_des`, `detail_des`, `view`, `idcate`) VALUES
(8, 'Gấu Bông Teddy Mặt Gấu', 445000, 0, 'a2.webp', 'Gấu bông to là chủng loại sản phẩm được khách hàng của gấu bông online hết sức ưa chuộng, bởi chúng có được những đặc điểm và ý nghĩa phong phú. Nào hãy cùng chúng tôi điểm qua về những đặc điểm của gấu bông to trên thị trường nha.', '<p><em>Gấu b&ocirc;ng to l&agrave; chủng loại sản phẩm được kh&aacute;ch h&agrave;ng của gấu b&ocirc;ng online hết sức ưa chuộng, bởi ch&uacute;ng c&oacute; được những đặc điểm v&agrave; &yacute; nghĩa phong ph&uacute;. N&agrave;o h&atilde;y c&ugrave;ng ch&uacute;ng t&ocirc;i điểm qua về những đặc điểm của gấu b&ocirc;ng to tr&ecirc;n thị trường nha.</em></p>\r\n\r\n<p>a.20 &ndash; 60cm</p>\r\n\r\n<p>Với k&iacute;ch thước nhỏ nhắn v&agrave; xinh xắn, gấu b&ocirc;ng to 20- 60cm được rất nhiều bạn nhỏ ưu th&iacute;ch bởi độ dễ thương của ch&uacute;ng. Những sản phẩm n&agrave;y lu&ocirc;n được c&aacute;c b&agrave; mẹ hay &ocirc;ng bố tin d&ugrave;ng, để trao tặng cho nhưng đứa con của m&igrave;nh.</p>\r\n\r\n<p>b.60 &ndash; 1m</p>\r\n\r\n<p>Với k&iacute;ch thước thuộc d&ograve;ng tầm trung, gấu b&ocirc;ng to 60 &ndash; 1m rất th&iacute;ch hợp l&agrave;m qu&agrave; tặng sinh nhật hay qu&agrave; noel.</p>\r\n', 46, 7),
(9, 'Gấu Bông Dễ Thương', 195000, 0, 'a3.jpg', 'Ngày nay Gấu Teddy đã trở thành món đồ chơi yêu thích của mọi người trên thế giới. Không ai có thể cưỡng được vẻ đẹp dễ thương, đáng yêu của những chú gấu Teddy. Vậy bạn biết gì về gấu Teddy? Gấu Teddy mang ý nghĩa gì? Bạn thân mến, trong bài viết này hãy cùng chúng tôi khám phá về món đồ chơi này nhé!', '<p><a href=\"https://gaubongonline.com/collections/gau-teddy\"><strong>Gấu Teddy</strong></a>&nbsp;xinh xắn, đ&aacute;ng y&ecirc;u l&agrave; niềm y&ecirc;u th&iacute;ch của rất nhiều người tr&ecirc;n thế giới. Tuy nhi&ecirc;n, &iacute;t ai biết được ch&uacute; gấu xinh xắn n&agrave;y lại c&oacute; nguồn gốc từ cựu Tổng thống Mỹ Theodore Roosevelt.</p>\r\n\r\n<p><em><strong>Gấu teddy</strong></em>&nbsp;c&oacute; nguồn gốc&nbsp;bắt đầu từ một sự cố trong chuyến đi săn của Tổng Thống tại Mississippi năm 1902. Tất cả mọi xạ thủ tham gia cuộc đi săn đều quyết t&acirc;m mang về thật nhiều chiến lợi phẩm. V&agrave; t&ugrave;y t&ugrave;ng của Tổng thống Theodore Roosevelt cũng kh&ocirc;ng ngoại lệ.</p>\r\n', 185, 1),
(11, 'Gấu Bông Lena Mặc Bộ Đồ', 175000, 0, 'a4.webp', 'Thú nhồi bông từ trước tới nay luôn là một món quà tuyệt vời cho các bạn tặng bé không chỉ bởi vẻ ngoài ngộ nghĩnh, đáng yêu mà còn nằm ở những giá trị nhân văn sâu sắc đằng sau mỗi nhân vật thú bông giúp nuôi dưỡng tâm hồn lương thiện của bé.', '<p>C&oacute; rất nhiều b&eacute; th&iacute;ch chơi với ch&oacute; nhưng kh&ocirc;ng phải l&uacute;c n&agrave;o bạn cũng c&oacute; thể quan s&aacute;t b&eacute; khi chơi đ&uacute;ng kh&ocirc;ng?</p>\r\n\r\n<p>Nếu bạn lo lắng về những bệnh tiềm ẩn như đường h&ocirc; hấp hoặc ti&ecirc;u h&oacute;a từ việc chơi với những ch&uacute; ch&oacute; thật, th&igrave; giờ đ&acirc;y h&atilde;y chọn cho b&eacute; một ch&uacute;&nbsp;th&uacute; nhồi b&ocirc;ng, v&iacute; dụ như ch&oacute; b&ocirc;ng nh&eacute;.</p>\r\n\r\n<p>Một ch&uacute; ch&oacute; b&ocirc;ng Shiba với đ&ocirc;i mắt nhắm nghiền, gương mặt mỉm cười cực kỳ dễ mến sẽ chiếm cảm t&igrave;nh của c&aacute;c b&eacute; ngay lần đầu nh&igrave;n thấy th&ocirc;i.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 26, 10),
(20, 'Gối Ôm Trâu Đứng Happy', 325000, 0, 'a5.webp', 'Bạn đang muốn mua gấu bông giá rẻ để tặng bạn gái, hay là món quà dễ thương tặng cô con gái nhỏ.Nhưng bạn đang đắn đo về chất lượng, xuất xứ của gấu nhồi bông giá rẻ, có đảm bảo an toàn hay chất lượng sản phẩm hay không.', '<p>Những ch&uacute;&nbsp;<em>gấu b&ocirc;ng gi&aacute; rẻ</em>&nbsp;tại Việt Nam hầu hết được sản xuất theo c&ocirc;ng nghệ của H&agrave;n Quốc với cơ sở đặt tại c&aacute;c tỉnh như , Th&aacute;i B&igrave;nh, Hải ph&ograve;ng v&agrave; c&aacute;c tỉnh ph&iacute;a nam.</p>\r\n\r\n<p>Với chất lượng theo d&acirc;y chuyền ti&ecirc;n tiến, nguy&ecirc;n liệu rẻ tại Việt Nam, n&ecirc;n c&oacute; những ưu điểm nhược điểm r&otilde; rệt mức gi&aacute; th&agrave;nh của những sản phẩm&nbsp;tại Việt Nam kh&aacute; thấp.</p>\r\n\r\n<p>Chất lượng lại rất đảm bảo cho người ti&ecirc;u d&ugrave;ng do xử dụng những nguy&ecirc;n liệu d&otilde; nguồn gốc.Nhược điểm của những ch&uacute; gấu teddy n&agrave;y l&agrave; mẫu m&atilde; của sản phẩm kh&ocirc;ng được da dạng.</p>\r\n', 117, 11),
(21, 'Brown Áo NewYork', 435000, 0, 'a6.webp', 'Gấu Brown và Thỏ Cony, hai nhân vật đặc biệt trong ứng dụng Line,được các ban trẻ yêu thích ngay từ cái nhìn đầu tiên.Hãy cùng shop tìm hiểu về hai mẫu gấu đang hot này bạn nhé.', '<p>&nbsp;Một m&ugrave;a lễ hội sắp tới gần, bạn chưa biết n&ecirc;n tặng g&igrave; cho n&agrave;ng th&igrave; gấu brown &ocirc;m tim ch&iacute;nh l&agrave; m&oacute;n qu&agrave; tuyệt vời m&agrave; bạn c&oacute; thể d&agrave;nh cho n&agrave;ng để thể b&agrave;y tỏ t&igrave;nh cảm của m&igrave;nh. Kh&aacute; l&iacute; tưởng nếu dịp Lễ t&igrave;nh nh&acirc;n Valentin tới đ&acirc;y, hay ng&agrave;y Quốc tế Phụ nữ 8/3,... bạn d&agrave;nh tặng n&agrave;ng một ch&uacute; gấu Brown dễ thương.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp;Kh&ocirc;ng chỉ l&agrave; một m&oacute;n qu&agrave; l&atilde;ng mạn gấu brown &ocirc;m tim c&ograve;n rất th&iacute;ch hợp d&agrave;nh tặng cho c&aacute;c b&eacute;. Với kiểu d&aacute;ng đ&aacute;ng y&ecirc;u v&agrave; dễ thương, ch&uacute; gấu brown n&agrave;y sẽ l&agrave; một m&oacute;n qu&agrave; tuyệt vời d&agrave;nh cho thi&ecirc;n thần nhỏ của bạn.</p>\r\n', 21, 12),
(22, 'Chó Bông Husky Cosplay Khủng Long', 475000, 0, 'a7.webp', 'Chó vốn là loại vật được yêu thích của rất nhiều gia đình. Phiên bản chó bông tiếp tục trở thành nhân vật trung thành được nhiều bạn trẻ yêu thích.Hãy cùng gấu bông online khám phá siêu phẩm gấu bông cực hot này bạn nhé.', '<h3>a. Tặng cho trẻ nhỏ</h3>\r\n\r\n<p>Đ&acirc;y l&agrave; nh&acirc;n vật được nhắc đến đầu ti&ecirc;n nếu muốn tặng ch&oacute; b&ocirc;ng g&ograve;n. Tuổi thơ của mỗi người đều gắn liền với một ch&uacute; ch&oacute; trung th&agrave;nh. Ai cũng từng c&oacute; một người bạn tuổi thơ như thế v&agrave; bởi vậy một ch&uacute; ch&oacute; nhồi b&ocirc;ng vừa gi&uacute;p trẻ c&oacute; bạn vừa bảo vệ c&aacute;c con tr&aacute;nh khỏi những t&aacute;c hại từ l&ocirc;ng ch&oacute; thật g&acirc;y n&ecirc;n. Đ&oacute; l&agrave; m&oacute;n qu&agrave; rất &yacute; nghĩa đối với trẻ nhỏ.</p>\r\n\r\n<h3>b. Bạn g&aacute;i/bạn trai tuổi tuất</h3>\r\n\r\n<p>Nếu n&agrave;ng hoặc ch&agrave;ng của bạn thuộc tuổi Tuất việc tặng một em th&uacute; nhồi b&ocirc;ng cầm tinh con ch&oacute; l&agrave; m&oacute;n qu&agrave; v&ocirc; c&ugrave;ng &yacute; nghĩa. Thể hiện bạn l&agrave; người t&acirc;m l&yacute; đồng thời tặng ch&oacute; b&ocirc;ng cho người tuổi Tuất nhằm truyền tải th&ocirc;ng điệp của bạn khi y&ecirc;u l&agrave; y&ecirc;u tất cả những g&igrave; thuộc về n&agrave;ng.</p>\r\n', 252, 11),
(23, 'Gối Ôm Mèo DuDu', 435000, 0, 'a8.webp', 'Gấu bông to là chủng loại sản phẩm được khách hàng của gấu bông online hết sức ưa chuộng, bởi chúng có được những đặc điểm và ý nghĩa phong phú. Nào hãy cùng chúng tôi điểm qua về những đặc điểm của gấu bông to trên thị trường nha.', '<p>c.1m &ndash; 1m4</p>\r\n\r\n<p>L&agrave; mẫu sản phẩm hot nhất trong mẫu sản phẩm gấu b&ocirc;ng bự. Đặc biệt hơn cả gấu b&ocirc;ng 1m2, n&oacute; lu&ocirc;n lu&ocirc;n được c&aacute;c bạn trẻ săn đ&oacute;n, cũng như lựa chọn h&agrave;ng đầu trong c&aacute;c mẫu sản phẩm gấu b&ocirc;ng, bởi x&eacute;t theo h&igrave;nh thể của mẫu sản phẩm n&agrave;y, n&oacute; hội tụ đầy đủ những t&iacute;nh chất đ&aacute;nh gi&aacute; v&agrave; t&acirc;m l&yacute; kh&aacute;ch h&agrave;ng. Một ch&uacute; gấu b&ocirc;ng khổng lồ&nbsp;bằng người với chất liệu cũng như mẫu m&atilde; ho&agrave;n to&agrave;n kh&aacute;c biệt, sẽ l&agrave; m&oacute;n qu&agrave; tỏ t&igrave;nh hết sức đ&aacute;ng y&ecirc;u.</p>\r\n\r\n<p>d.1m4 &ndash; 1m8</p>\r\n\r\n<p>Đấy l&agrave; sản phẩm gấu nhồi b&ocirc;ng to bằng người được c&aacute;c bạn trẻ y&ecirc;u th&iacute;ch. Những h&igrave;nh ảnh tr&ecirc;n xe l&agrave; một anh ch&agrave;ng đi phượt c&ugrave;ng một ch&uacute; gấu b&ocirc;ng, đ&atilde; l&agrave;m cư d&acirc;n mạng hết sức th&iacute;ch th&uacute; v&agrave; săn t&igrave;m.</p>\r\n', 46, 14),
(40, 'Gấu Bông Hoạt Hình', 184000, 5, 'a10.jpg', 'Con gấu bông doraemon được mẹ em mua tặng cho em nhân ngày sinh nhật, hình ảnh đó đã gắn bó với tâm trí của em và mang trong em những cung bậc riêng và nó tạo nên những ý nghĩa riêng và càng có ý nghĩa, khi hình ảnh đó gắn bó với mỗi người chúng ta.  Con gấu bông doraemon màu xanh da trời, nó được làm bằng lông dày và rất mượt, nó gắn bó mạnh mẽ với tâm trí của em bởi hình ảnh của nó mang những cung bậc riêng và vô cùng có ý nghĩa lớn, mũi của nó màu đỏ được đính bằng nhựa, trên cổ của nó có đeo một chiếc chuông.', '<p>Con gấu b&ocirc;ng doraemon được mẹ em mua tặng cho em nh&acirc;n ng&agrave;y sinh nhật, h&igrave;nh ảnh đ&oacute; đ&atilde; gắn b&oacute; với t&acirc;m tr&iacute; của em v&agrave; mang trong em những cung bậc ri&ecirc;ng v&agrave; n&oacute; tạo n&ecirc;n những &yacute; nghĩa ri&ecirc;ng v&agrave; c&agrave;ng c&oacute; &yacute; nghĩa, khi h&igrave;nh ảnh đ&oacute; gắn b&oacute; với mỗi người ch&uacute;ng ta.</p>\r\n\r\n<p>Con gấu b&ocirc;ng doraemon m&agrave;u xanh da trời, n&oacute; được l&agrave;m bằng l&ocirc;ng d&agrave;y v&agrave; rất mượt, n&oacute; gắn b&oacute; mạnh mẽ với t&acirc;m tr&iacute; của em bởi h&igrave;nh ảnh của n&oacute; mang những cung bậc ri&ecirc;ng v&agrave; v&ocirc; c&ugrave;ng c&oacute; &yacute; nghĩa lớn, mũi của n&oacute; m&agrave;u đỏ được đ&iacute;nh bằng nhựa, tr&ecirc;n cổ của n&oacute; c&oacute; đeo một chiếc chu&ocirc;ng.</p>\r\n', 3, 7),
(41, 'Chó Đức', 150000000, 15, 'a3.jpg', 'dafdasfdsf', '<p>gfsdgfsdgfsdgsfdgsdfgsdfgs</p>\r\n', 2, 11),
(42, 'Chó Đức', 150000000, 15, 'a3.jpg', 'dafdasfdsf', '<p>gfsdgfsdgfsdgsfdgsdfgsdfgs</p>\r\n', 5, 11);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id_ques` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `contennt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id_ques`, `name`, `email`, `phone`, `contennt`) VALUES
(16, 'HoangTrieu', 'trieutch.21it@vku.udn.vn', '0334568848', 'alo');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT 0,
  `email_user` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_user` varchar(25) NOT NULL,
  `img_user` varchar(255) NOT NULL,
  `register_date` date DEFAULT NULL,
  `last_login` date DEFAULT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `user_name`, `password`, `full_name`, `sex`, `email_user`, `address`, `phone_user`, `img_user`, `register_date`, `last_login`, `role`) VALUES
(28, 'user111', '111111', 'cường', 0, 'cuongncph37062@fpt.edu.vn', '', '', '', NULL, NULL, 0),
(29, 'adminpt', '123456', 'Admin Phụ Tùng Tốt', 0, '[value-6]', '[value-7]', '[value-8]', '[value-9]', '0000-00-00', '0000-00-00', 1),
(30, 'user', '000000', 'Nguyễn Cường', 0, 'nguyencuongf75@gmail.com', '', '', '', NULL, NULL, 0),
(31, 'linh2k5', '123456', 'Nguyễn Linh', 0, 'nguyenlinh2005@gmail.com', '', '', '', NULL, NULL, 0),
(32, 'trieu123', '12345 6', 'Hoàng Triều', 0, 'trieu123@gmail.com', '', '', 'Screenshot 2024-10-15 213404.png', NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id_bill`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_pro_cart` (`id_pro`),
  ADD KEY `lk_bill_cart` (`id_bill`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_cate`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_cmt`),
  ADD KEY `lk_user_cmt` (`id_user`),
  ADD KEY `lk_pro_cmt` (`id_pro`);

--
-- Indexes for table `history_bank`
--
ALTER TABLE `history_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_pro`),
  ADD KEY `lk_cate_product` (`idcate`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id_ques`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id_bill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_cate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id_cmt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `history_bank`
--
ALTER TABLE `history_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_pro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id_ques` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `lk_bill_cart` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id_bill`),
  ADD CONSTRAINT `lk_pro_cart` FOREIGN KEY (`id_pro`) REFERENCES `product` (`id_pro`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `lk_pro_cmt` FOREIGN KEY (`id_pro`) REFERENCES `product` (`id_pro`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `lk_cate_product` FOREIGN KEY (`idcate`) REFERENCES `category` (`id_cate`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
