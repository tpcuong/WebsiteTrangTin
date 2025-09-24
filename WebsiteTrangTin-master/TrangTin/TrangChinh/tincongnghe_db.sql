-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th9 24, 2025 lúc 12:41 AM
-- Phiên bản máy phục vụ: 5.7.25
-- Phiên bản PHP: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tincongnghe_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baiviet`
--

CREATE TABLE `baiviet` (
  `id` int(11) NOT NULL,
  `tieu_de` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta_ngan` text COLLATE utf8mb4_unicode_ci,
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_danhmuc` int(11) DEFAULT NULL,
  `ngay_dang` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `baiviet`
--

INSERT INTO `baiviet` (`id`, `tieu_de`, `mo_ta_ngan`, `hinh_anh`, `id_danhmuc`, `ngay_dang`) VALUES
(1, 'iPhone 17 Pro Max ra mắt', 'Apple chính thức trình làng iPhone mới với nhiều cải tiến về hiệu năng.', 'images/ip17.png', 2, '2025-09-24 00:45:10'),
(2, 'Laptop gaming Alienware 2025', 'Alienware 2025 sở hữu CPU Intel thế hệ mới và GPU RTX 5090.', 'images/alienware2025.jpg', 3, '2025-09-24 00:45:10'),
(3, 'Meta ra mắt kính thực tế ảo mới', 'Kính VR của Meta mang trải nghiệm sống động hơn với cảm biến 3D tiên tiến.', 'images/meta-vr.jpg', 1, '2025-09-24 00:45:10'),
(4, '10 ứng dụng AI miễn phí giúp học tập', 'Danh sách các ứng dụng AI hữu ích cho sinh viên và lập trình viên.', 'images/ai-apps.jpg', 4, '2025-09-24 00:45:10'),
(5, 'Top game hot tháng 9', 'Tổng hợp các tựa game được chơi nhiều nhất trong tháng 9.', 'images/game-sep.jpg', 5, '2025-09-24 00:45:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baiviet_hot`
--

CREATE TABLE `baiviet_hot` (
  `id` int(11) NOT NULL,
  `id_baiviet` int(11) DEFAULT NULL,
  `vi_tri` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `ten_danhmuc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta` text COLLATE utf8mb4_unicode_ci,
  `ngay_tao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `ten_danhmuc`, `mo_ta`, `ngay_tao`) VALUES
(1, 'Công nghệ', 'Các tin tức mới nhất về công nghệ và thiết bị điện tử.', '2025-09-24 00:45:05'),
(2, 'Điện thoại', 'Thông tin, đánh giá và tin tức về điện thoại.', '2025-09-24 00:45:05'),
(3, 'Máy tính', 'Các tin tức và đánh giá về máy tính và laptop.', '2025-09-24 00:45:05'),
(4, 'Ứng dụng', 'Tin tức và đánh giá các ứng dụng phần mềm.', '2025-09-24 00:45:05'),
(5, 'Game', 'Các tin tức về game, e-sport và đánh giá game.', '2025-09-24 00:45:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `noidung`
--

CREATE TABLE `noidung` (
  `id` int(11) NOT NULL,
  `id_baiviet` int(11) DEFAULT NULL,
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noi_dung` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `noidung`
--

INSERT INTO `noidung` (`id`, `id_baiviet`, `hinh_anh`, `noi_dung`) VALUES
(1, 1, NULL, 'Chi tiết về iPhone 17 Pro Max: Trang bị chip A19, camera nâng cấp, hỗ trợ sạc nhanh và nhiều cải tiến khác.'),
(2, 2, 'images/alienware-gaming.jpg', 'Laptop gaming Alienware 2025 với CPU Intel thế hệ mới, GPU RTX 5090, màn hình 240Hz.'),
(3, 3, NULL, 'Meta VR 2025: Kính thực tế ảo mới với cảm biến 3D, trải nghiệm sống động, hỗ trợ nhiều ứng dụng và game VR.'),
(4, 4, NULL, 'Danh sách 10 ứng dụng AI miễn phí giúp học tập, lập trình và nghiên cứu hiệu quả.'),
(5, 5, NULL, 'Top game hot tháng 9: tổng hợp các tựa game được chơi nhiều nhất và đánh giá chi tiết.');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_danhmuc` (`id_danhmuc`);

--
-- Chỉ mục cho bảng `baiviet_hot`
--
ALTER TABLE `baiviet_hot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_baiviet` (`id_baiviet`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `noidung`
--
ALTER TABLE `noidung`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_baiviet` (`id_baiviet`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `baiviet_hot`
--
ALTER TABLE `baiviet_hot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `noidung`
--
ALTER TABLE `noidung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD CONSTRAINT `baiviet_ibfk_1` FOREIGN KEY (`id_danhmuc`) REFERENCES `danhmuc` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `baiviet_hot`
--
ALTER TABLE `baiviet_hot`
  ADD CONSTRAINT `baiviet_hot_ibfk_1` FOREIGN KEY (`id_baiviet`) REFERENCES `baiviet` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `noidung`
--
ALTER TABLE `noidung`
  ADD CONSTRAINT `noidung_ibfk_1` FOREIGN KEY (`id_baiviet`) REFERENCES `baiviet` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
