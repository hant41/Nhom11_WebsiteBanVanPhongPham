-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 06, 2022 lúc 03:15 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laptopstore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `image` text COLLATE utf8_vietnamese_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `created_by`, `created_at`, `updated_at`) VALUES
(8, 'Bút viết', '1670208025Screenshot 2022-12-03 232811.jpg', 21, '2022-05-30 09:55:54', '2022-12-05 03:40:25'),
(9, 'Sổ tập', '1670208537Screenshot (396).png', 21, '2022-05-31 10:41:53', '2022-12-05 03:48:57'),
(10, 'Giấy in', '1670209259Screenshot (397).png', 21, '2022-05-31 10:42:08', '2022-12-05 04:00:59'),
(11, 'Thiết bị văn phòng', '1670209280Screenshot 2022-12-03 232811.jpg', 21, '2022-05-31 10:42:30', '2022-12-05 04:01:20'),
(12, 'Họa cụ', '1670209303Screenshot (396).png', 21, '2022-05-31 10:42:47', '2022-12-05 04:01:43'),
(13, 'Quà lưu niệm', '1670209326Screenshot (397).png', 21, '2022-05-31 10:42:57', '2022-12-05 04:02:06'),
(15, 'Sách', '1670231410School.png', 21, '2022-12-05 10:10:10', '2022-12-05 10:10:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES
(22, 21, 1, '2022-06-19 11:12:11', '2022-06-19 11:12:11'),
(23, 21, 4, '2022-06-22 04:01:18', '2022-06-22 04:01:18'),
(44, 35, 2, '2022-06-23 04:59:23', '2022-06-23 04:59:23'),
(45, 35, 1, '2022-06-23 05:17:44', '2022-06-23 05:17:44'),
(46, 35, 1, '2022-12-05 08:09:06', '2022-12-05 08:09:06'),
(47, 37, 1, '2022-12-05 09:56:59', '2022-12-05 09:56:59'),
(48, 37, 1, '2022-12-05 09:57:34', '2022-12-05 09:57:34'),
(49, 35, 1, '2022-12-05 10:06:45', '2022-12-05 10:06:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `capacity_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `capacity_id`, `quantity`, `price`) VALUES
(42, 42, 15, 10, 1, 10000),
(43, 43, 54, 82, 1, 15000),
(44, 44, 14, 9, 1, 15000),
(45, 44, 14, 8, 1, 23000),
(46, 45, 17, 14, 1, 11000),
(47, 46, 30, 41, 1, 63000),
(48, 46, 14, 8, 1, 45000),
(49, 47, 16, 12, 1, 18000),
(50, 47, 19, 19, 1, 18000),
(51, 48, 14, 8, 1, 45000),
(52, 49, 14, 8, 1, 45000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `model` text COLLATE utf8_vietnamese_ci NOT NULL,
  `screen` text COLLATE utf8_vietnamese_ci NOT NULL,
  `RAM` text COLLATE utf8_vietnamese_ci NOT NULL,
  `hardware` text COLLATE utf8_vietnamese_ci NOT NULL,
  `OS` text COLLATE utf8_vietnamese_ci NOT NULL,
  `CPU` text COLLATE utf8_vietnamese_ci NOT NULL,
  `VGA` text COLLATE utf8_vietnamese_ci NOT NULL,
  `background` text COLLATE utf8_vietnamese_ci NOT NULL,
  `warranty` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `color` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `brand_id`, `model`, `screen`, `RAM`, `hardware`, `OS`, `CPU`, `VGA`, `background`, `warranty`, `discount`, `color`, `created_by`, `created_at`, `updated_at`) VALUES
(14, 8, 'Bút gel B màu Pastel Thiên Long Flexoffice Pazto FO-GELB039/VN - Mực xanh (5 cây)', '       Việt Nam  \n        ', '26gram', 'dài 142mm', 'Thiết kế với 5 tone màu pastel bắt mắt, với thiết kế đơn giản, hiện đại, hợp thời trang, hợp xu hướng.', 'Flexoffice', '        Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. \r\n        ', '1670217682fo-gelb039_vn_14_copy_729e60fbff6e4576862cc11254a2a56e.webp', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 06:21:22'),
(15, 8, 'Hộp 20 Bút Bi Thiên Long TL-027', 'Thụy Sĩ', '9gram', 'dài 140mm', 'Bút có thiết kế đơn giản, toàn bộ thân bút làm từ nhựa trong, nút bấm bằng nhựa cùng màu với ruột bút. Viết rất trơn, êm, mực ra đều, liên tục.', 'Flexoffice', 'Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi.', '1670214344tl_copy_c47521457ab2448cbabdd5ac1f6c617d.webp', 'ASTM D-4236, ASTM F 963-91, EN71/3, TSCA.', 5, 'black', 21, '2022-06-06 06:40:13', '2022-12-05 05:25:44'),
(16, 8, 'Bút dạ quang màu Pastel Thiên Long Pazto HL-016 - Bút dạ quang rửa được - Không để lại vết khi Photocopy', '        Việt Nam  \r\n        ', '26gram', 'dài 142mm', 'Thiết kế với 5 tone màu pastel bắt mắt, với thiết kế đơn giản, hiện đại, hợp thời trang, hợp xu hướng.', 'Flexoffice', '        Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. \r\n        ', '1670216787hl-016_7_e37a7ded6af2415190d1674e6d4dc208.webp', 'ASTM D-4236, ASTM F 963-91, EN71/3, TSCA.', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 06:06:27'),
(17, 8, 'Bút dạ quang màu Pastel Thiên Long Flexoffice Pazto FO-HL009/VN - Bút dạ quang rửa được - Không để lại vết khi Photocopy', 'Việt Nam  ', '26gram', 'dài 142mm', 'Thiết kế với 5 tone màu pastel bắt mắt, với thiết kế đơn giản, hiện đại, hợp thời trang, hợp xu hướng.', 'Flexoffice', 'Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. ', 'fo-hl009_vn_10_dd34b500ed0c405fa9eda657ccdd24aa.webp', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 05:22:38'),
(18, 8, 'Bộ 2 Bút gel Thiên Long Bizner BIZ-KIT20/40years - Bút ký không phai màu', 'Việt Nam  ', '26gram', 'dài 142mm', 'Thiết kế với 5 tone màu pastel bắt mắt, với thiết kế đơn giản, hiện đại, hợp thời trang, hợp xu hướng.', 'Flexoffice', 'Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. ', 'bizner_3_copy_32c344fcaa7746e5ab76d8bf5a71712b.webp', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 05:22:38'),
(19, 9, 'Vở Campap A4 CW', 'Việt Nam  ', '26gram', 'dài 142mm', 'Thiết kế với 5 tone màu pastel bắt mắt, với thiết kế đơn giản, hiện đại, hợp thời trang, hợp xu hướng.', 'Flexoffice', 'Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. ', 'vo-campap-a4-cw-2508-ngoc-lan-vpp.jpeg', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 05:22:38'),
(20, 9, 'Vở may kẻ caro Klong B5 KL835', 'Việt Nam  ', '26gram', 'dài 142mm', 'Thiết kế với 5 tone màu pastel bắt mắt, với thiết kế đơn giản, hiện đại, hợp thời trang, hợp xu hướng.', 'Flexoffice', 'Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. ', 'vo-klong-caro-b5-kl835.jpeg', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 05:22:38'),
(21, 9, 'Sổ giáo án 4 ô ly to A4 KL 314', '        Việt Nam  \r\n        ', '26gram', 'dài 142mm', 'Thiết kế với 5 tone màu pastel bắt mắt, với thiết kế đơn giản, hiện đại, hợp thời trang, hợp xu hướng.', 'Flexoffice', '        Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. \r\n        ', 'vo-giao-an-4-o-ly-klong.jpeg', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 07:06:36'),
(22, 10, 'Giấy A4 Paper One', 'Việt Nam  ', '26gram', 'dài 142mm', 'Thiết kế với 5 tone màu pastel bắt mắt, với thiết kế đơn giản, hiện đại, hợp thời trang, hợp xu hướng.', 'Flexoffice', 'Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. ', 'giay-paperOne-a4-80gsm.jpg', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 05:22:38'),
(23, 10, 'Giấy A3 DoubleA ', 'Việt Nam  ', '26gram', 'dài 142mm', 'Thiết kế với 5 tone màu pastel bắt mắt, với thiết kế đơn giản, hiện đại, hợp thời trang, hợp xu hướng.', 'Flexoffice', 'Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. ', 'Giay-A3-Double-A-70-gsm-vpp-ngoc-lan.png', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 05:22:38'),
(24, 10, 'Giấy A3 Idea', 'Việt Nam  ', '26gram', 'dài 142mm', 'Thiết kế với 5 tone màu pastel bắt mắt, với thiết kế đơn giản, hiện đại, hợp thời trang, hợp xu hướng.', 'Flexoffice', 'Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. ', 'giay-a3-idea-70gsm-vpp-ngoc-lan.jpeg', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 05:22:38'),
(25, 11, 'Kẹp giấy Flexoffice FO-PAC01', 'Việt Nam  ', '38gram', '25mm', 'Sản xuất từ kim loại có chất lượng cao, được phủ lớp niken chống gỉ.', 'Flexoffice', 'Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. ', 'kep_giay_thien_long_-_flexoffice_25mm_fo-pac01__2__grande.webp', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 05:22:38'),
(26, 11, 'Kéo đa năng Thiên Long SC-022', 'Việt Nam  ', '78gram', '150mm', 'Kéo đa năng Thiên Long SC-022 có cán làm từ nhựa PP, thân làm bằng thép không gỉ. Kéo đa năng Thiên Long SC-022 phù hơp cho học sinh, sinh viên, văn phòng và gia đình. Kiểu dáng trang nhã, màu sắc phong phú.', 'Thiên Long', 'Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. ', 'sc-022_copy_9aded5657d234f0ab502249a4504137b.webp', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 05:22:38'),
(27, 12, 'Bút lông 20 màu Pastel Washable Fiber Pen Thiên Long Colokit SWM-C008 - Bút lông màu rửa được', 'Việt Nam  ', '50gram', 'dài 142mm', 'Bộ 20 màu Pastel Washable Fiber Pen thích hợp trang trí sổ tay, planner, penpal, góc học tập, album, handmade, calligraphy, bullet journal...Tone màu Pastel - màu Vintage - màu dịu mát và ấm áp, mang lại sự nhẹ nhàng, thanh lịch, thoải mái…cho cảm giác mới lạ, nổi bật cá tính.', ' Colokit', 'Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. ', 'swm-c008_new_2_e4d10407ee4b491bab3f7378c5d2a2e8.webp', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 05:22:38'),
(28, 12, 'Bộ màu nghệ thuật Crayola Inspiration Art Case Coloring sáng tạo 140 món cho bé', 'Việt Nam  ', '1500 gram', '41.6 x 25.1 x 32.4 cm\n', '64 Màu sáp + 20 Bút chì màu + 40 Bút lông rửa được + 15 Tờ hình mẫu + 01 Vali', 'CRAYOLA', 'Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. ', 'bo_vali_nghe_thuat_sang_tao_140_mon_cho_be3_6d7d33f34c8240628cbb32f424ef4ea4.webp', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 05:22:38'),
(29, 13, 'Đồng Hồ Cát Đế Gỗ Sang Trọng', 'Việt Nam', '500gram', '5cm x 5cm x 12cm', 'Sản phẩm cực đẹp cực sang , dùng để trang trí tủ kính,bàn làm việc ', 'Flexoffice', 'Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. ', 'c1.jpg', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 05:22:38'),
(30, 13, 'Đồng Hồ Cát Tháp Eiffel Đèn Led', 'Việt Nam  ', '360gram', '5cm x 12cm', 'Được làm bằng chất liệu nhựa và được sơn màu giả đồng cổ, nhưng chiếc đồng hồ cát tháp eiffel này khiến người nhìn chẳng thế biết rằng nó được làm từ chất liệu nhựa mà chắc hẳn ai cũng sẽ nghĩ rằng được làm từ chất liệu đồng và chỉ khi cầm lên mới nhận ra.\nĐồng hồ cát tháp eiffel món quà tặng lưu niệm, trang trí độc đáo. Hãy dành tặng món quà thú vị này cho người thân bạn bè của bạn nhé. ', 'CheeryKiPa', 'Tránh xa nguồn nhiệt, hóa chất. Không thích hợp cho trẻ dưới 3 tuổi. ', 'f1.jpg', 'TCCS 009:2001/TL-BGEL', 10, 'Dark Shadow Grey', 21, '2022-06-06 06:29:10', '2022-12-05 05:22:38'),
(56, 9, 'Bộ cọ deli', '              Cânda  ', '12', '12', 'Thiết kế với 5 tone màu pastel bắt mắt, với thiết kế đơn giản, hiện đại, hợp thời trang, hợp xu hướng.', 'Flexoffice', '                Nang', '1670231337School.png', 'TCCS 009:2001/TL-BGEL', 1, 'đỏ hồng', 21, '2022-12-05 10:08:57', '2022-12-05 10:08:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_capacities`
--

CREATE TABLE `product_capacities` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `capacity_name` text COLLATE utf8_vietnamese_ci NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product_capacities`
--

INSERT INTO `product_capacities` (`id`, `product_id`, `capacity_name`, `price`, `quantity`) VALUES
(8, 14, 'Combo', 50000, 18009985),
(9, 14, 'lẻ', 10000, 190050502),
(10, 15, 'Mực đen', 85000, 100046),
(11, 15, 'Mực xanh', 85000, 5000),
(12, 16, 'Combo 3 bút', 20000, 4995),
(13, 16, 'Combo 5 bút', 40000, 4998),
(14, 17, 'Xanh', 10000, 999),
(15, 17, 'Tím', 11000, 1000),
(16, 18, 'Mực đen', 160000, 2000),
(17, 17, 'Vàng', 11000, 1000),
(19, 19, '200 trang', 20000, 98),
(20, 19, '120 trang', 14000, 100),
(21, 20, 'Hồng - 120 trang', 15000, 100),
(22, 20, 'Hồng - 200 trang', 23000, 100),
(23, 21, '180 trang', 25000, 10),
(24, 21, '200 trang', 38000, 10),
(25, 22, '70 gram', 120000, 200),
(26, 22, '100 gram', 150000, 200),
(27, 23, '70 gram', 135000, 10),
(28, 23, '100 gram', 162000, 10),
(29, 24, '80 gram', 125000, 10),
(30, 24, '100 gram', 155000, 10),
(31, 25, 'màu bạc', 5000, 1000),
(32, 25, 'Combo 5 chiếc', 22000, 1000),
(33, 26, 'màu đỏ', 35000, 100),
(35, 27, 'Vỏ nhựa', 50000, 100),
(36, 27, 'Vỏ thiếc', 65000, 100),
(37, 28, 'Vali', 195000, 100),
(39, 29, 'Cát màu vàng', 60000, 100),
(40, 29, 'Cát màu đồng', 61000, 10),
(41, 30, '15cm', 70000, 8),
(42, 30, '18cm', 82000, 10),
(86, 20, 'Xanh - 120 trang', 15000, 1000),
(87, 20, 'Xanh - 200 trang', 23000, 345),
(88, 56, '3', 20000, 12);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, 'Chờ shop xác nhận'),
(2, 'Shop đã xác nhận'),
(3, 'Shop đang chuẩn bị hàng'),
(4, 'Đơn vị đang vận chuyển'),
(5, 'Shiper đang giao hàng'),
(6, 'Giao hàng thành công'),
(7, 'Yêu cầu trả hàng'),
(8, 'Shop xác nhận trả hàng'),
(9, 'Trả hàng thành công'),
(10, 'Đơn hàng bị hủy.'),
(11, 'Trả hàng thất bại'),
(12, 'Khách không nhận.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `account` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `address` text COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `avatar` text COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `role_id`, `account`, `password`, `name`, `phone_number`, `address`, `avatar`, `email`, `created_at`, `updated_at`) VALUES
(21, 2, 'admin', '25d55ad283aa400af464c76d713c07ad', 'Trịnh Thị Bảo Yến', '973867269', 'Xóm 4, thôn Gia Lễ, xã Đông Mỹ, thành phố Thái Bình, tỉnh Thái Bình', NULL, 'admin@gmail.com', '2022-05-29 10:06:46', '2022-06-04 02:58:01'),
(33, 1, 'anh123', '827ccb0eea8a706c4c34a16891f84e7b', 'Đỗ Hồng Anh', '0973867269', 'Xóm 3, thôn Gia Lễ, xã Đông Mỹ, thành phố Thái Bình', NULL, 'anh123@gmail.com', '2022-06-18 11:24:30', '2022-06-19 07:13:12'),
(34, 1, 'ha123', '25d55ad283aa400af464c76d713c07ad', 'Nguyễn Thu Hà', '0973867269', 'Xom 4, thon gia le, xa dong my, thanh pho thai binh', NULL, 'ha123@gmail.com', '2022-06-19 07:18:52', '2022-06-23 04:24:21'),
(35, 1, 'yen123', '827ccb0eea8a706c4c34a16891f84e7b', 'Trịnh Thị Bảo Yến', '0837535633', 'Minh Khai, Bắc Từ Liêm, Hà Nội', '1670221148LogoSample_ByTailorBrands.jpg', 'yenttb18@gmail.com', '2022-12-05 07:18:06', '2022-12-05 07:19:08'),
(37, 1, 'user1', '827ccb0eea8a706c4c34a16891f84e7b', 'Trịnh Thị Bảo Yến', '0837535633', 'Minh Khai, Bắc Từ Liêm, Hà Nội', NULL, 'yenttb18@gmail.com', '2022-12-05 09:49:40', '2022-12-05 09:56:45'),
(38, 1, 'user2', 'fcea920f7412b5da7be0cf42b8c93759', 'Nguyễn Hà', '0973259096', 'Minh Khai, Bắc Từ Liêm, Hà Nội', NULL, 'yenttb18@gmail.com', '2022-12-05 10:01:34', '2022-12-05 10:02:16');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `capacity_id` (`capacity_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `product_capacities`
--
ALTER TABLE `product_capacities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `product_capacities`
--
ALTER TABLE `product_capacities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
