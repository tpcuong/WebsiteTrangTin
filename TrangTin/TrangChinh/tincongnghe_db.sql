-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th10 01, 2025 lúc 08:10 AM
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
  `id_linhvuc` int(11) DEFAULT NULL,
  `id_tacgia` int(11) DEFAULT NULL,
  `ngay_dang` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `baiviet`
--

INSERT INTO `baiviet` (`id`, `tieu_de`, `mo_ta_ngan`, `hinh_anh`, `id_linhvuc`, `id_tacgia`, `ngay_dang`) VALUES
(1, 'iPhone 17 Pro Max ra mắt', 'Apple chính thức trình làng iPhone mới với nhiều cải tiến.', 'images/ip177.png', 2, NULL, '2025-10-24 13:00:00'),
(2, 'Laptop gaming Alienware 2025', 'Alienware 2025 sở hữu CPU Intel thế hệ mới và GPU RTX 5090.', 'images/alienware2025.png', 3, NULL, '2025-10-24 12:59:50'),
(3, 'Meta ra mắt kính thực tế ảo mới', 'Kính VR của Meta mang trải nghiệm sống động hơn với cảm biến 3D tiên tiến.', 'images/meta-vrr.png', 1, NULL, '2025-10-24 12:58:50'),
(4, '10 ứng dụng AI miễn phí giúp học tập', 'Danh sách các ứng dụng AI hữu ích cho sinh viên và lập trình viên.', 'images/ai-apps.png', 4, NULL, '2025-10-24 12:57:50'),
(5, 'Top game hot tháng 9', 'Tổng hợp các tựa game được chơi nhiều nhất trong tháng 9.', 'images/game-sep.png', NULL, NULL, '2025-09-24 12:36:50'),
(6, 'Đánh giá chi tiết laptop Dell XPS 13 9350 2025', 'Mẫu laptop mới của Dell với thiết kế mỏng nhẹ và hiệu năng đỉnh cao nhờ chip Intel Core Ultra mới.', 'images/laptop.png', 3, NULL, '2025-10-24 12:56:00'),
(7, 'Samsung ra mắt Galaxy Z Fold 7', 'Chiếc điện thoại gập thế hệ mới của Samsung có nhiều cải tiến về màn hình và độ bền bản lề.', 'images/GalaxyZ.png', 2, NULL, '2025-10-24 12:55:30'),
(8, 'Xu hướng phát triển của trí tuệ nhân tạo tạo sinh', 'AI tạo sinh đang thay đổi nhiều ngành công nghiệp, từ nghệ thuật đến lập trình.', 'images/AIs.png', 1, NULL, '2025-10-24 12:54:00'),
(9, 'Top 5 ứng dụng quản lý công việc hiệu quả nhất', 'Danh sách các ứng dụng giúp bạn sắp xếp công việc và tăng năng suất làm việc nhóm.', 'images/TOP.png', 4, NULL, '2025-10-24 12:53:15'),
(10, 'Google Pixel 9: Có gì mới?', 'Những nâng cấp đáng chú ý về camera và các tính năng AI độc quyền trên dòng Pixel mới.', 'images/pixel9.png', 2, NULL, '2025-10-15 10:05:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(11) NOT NULL,
  `id_baiviet` int(11) NOT NULL,
  `ten_tac_gia` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdt_tac_gia` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noi_dung` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay_gui` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trang_thai` int(1) NOT NULL DEFAULT '0' COMMENT '0=Chờ duyệt, 1=Đã duyệt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `content_blocks`
--

CREATE TABLE `content_blocks` (
  `id` int(11) NOT NULL,
  `id_baiviet` int(11) NOT NULL,
  `block_order` int(11) NOT NULL DEFAULT '0',
  `block_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `block_content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `content_blocks`
--

INSERT INTO `content_blocks` (`id`, `id_baiviet`, `block_order`, `block_type`, `block_content`) VALUES
(1, 1, 10, 'heading', 'iPhone 17 có gì mới?'),
(2, 1, 20, 'paragraph', 'Dòng iPhone 17 giới thiệu sự thay đổi đáng kể so với thế hệ trước...'),
(3, 1, 30, 'heading', 'Sự xuất hiện của iPhone Air'),
(4, 1, 40, 'paragraph', 'iPhone Air đánh dấu một bước ngoặt trong triết lý thiết kế của Apple...'),
(5, 1, 50, 'image', 'images/iphone17-air.jpg'),
(6, 1, 60, 'paragraph', 'Về cấu hình, iPhone Air sở hữu màn hình 6.5 inch...'),
(36, 2, 10, 'paragraph', 'Nếu bạn đang tìm một chiếc laptop gaming Dell, không thể không nhắc đến Alienware...'),
(37, 2, 20, 'heading', '1. Thiết kế \"Legend\" - Di sản từ tương lai'),
(38, 2, 30, 'paragraph', 'Các dòng máy Alienware, đặc biệt là series X và M, đều tuân theo triết lý thiết kế...'),
(39, 2, 40, 'image', 'images/laptop1.jpg'),
(40, 2, 50, 'paragraph', '<strong>Thiết kế biểu tượng:</strong> Giúp bạn nổi bật ở bất kỳ đâu...'),
(56, 3, 10, 'paragraph', 'Sự thành công vang dội của Meta Quest 3 đã thực sự định hình lại thị trường...'),
(57, 3, 20, 'heading', 'Meta Quest 4: Ngày phát hành dự kiến'),
(58, 3, 30, 'paragraph', 'Việc dự đoán ngày phát hành của Meta phụ thuộc nhiều vào việc phân tích chu kỳ...'),
(74, 4, 10, 'paragraph', 'Trí tuệ nhân tạo (AI) đang thay đổi cách chúng ta học tập và làm việc...'),
(75, 4, 20, 'heading', '1. Socratic by Google'),
(76, 4, 30, 'paragraph', 'Đây là một trợ lý học tập tuyệt vời được Google hậu thuẫn...'),
(77, 4, 40, 'image', 'images/ai-app-socratic.jpg'),
(220, 6, 10, 'paragraph', 'Dell XPS 13 9350 (2025) tiếp tục khẳng định vị thế là một trong những chiếc ultrabook...'),
(221, 6, 20, 'heading', 'Màn hình sắc nét, tốc độ quét cao'),
(222, 6, 30, 'paragraph', 'Trải nghiệm thị giác trên Dell XPS 13 9350 là một điểm nhấn đắt giá...'),
(233, 7, 10, 'heading', '1. Giá Samsung Galaxy Z Fold 7 bao nhiêu?'),
(234, 7, 20, 'paragraph', 'Samsung Galaxy Z Fold 7 chính thức mở bán với giá khởi điểm 46.990.000 đồng...'),
(266, 8, 10, 'paragraph', 'Trí tuệ nhân tạo tạo sinh (Generative AI) đã vượt qua ranh giới của những phòng thí nghiệm...'),
(267, 8, 20, 'heading', '1. Mô hình đa phương thức (Multimodal Models): Phá vỡ rào cản giao tiếp'),
(284, 9, 10, 'paragraph', 'Trong môi trường làm việc hiện đại, việc theo dõi và quản lý công việc...'),
(285, 9, 20, 'heading', '1. Trello: Trực quan và Linh hoạt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `linhvuc`
--

CREATE TABLE `linhvuc` (
  `id` int(11) NOT NULL,
  `ten_linhvuc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta` text COLLATE utf8mb4_unicode_ci,
  `ngay_tao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `linhvuc`
--

INSERT INTO `linhvuc` (`id`, `ten_linhvuc`, `mo_ta`, `ngay_tao`) VALUES
(1, 'Công nghệ', 'Tin tức và xu hướng công nghệ', '2025-09-24 12:36:50'),
(2, 'Điện thoại', 'Các sản phẩm smartphone mới nhất', '2025-09-24 12:36:50'),
(3, 'Máy tính', 'Laptop, PC, phần cứng và phần mềm', '2025-09-24 12:36:50'),
(4, 'Ứng dụng', 'App di động và phần mềm hữu ích', '2025-09-24 12:36:50');

--
-- ======================================================
-- == PHẦN BỔ SUNG CHO HỆ THỐNG ADMIN & PHÂN QUYỀN ==
-- ======================================================
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Luôn lưu mật khẩu đã hash',
  `ho_ten` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Tác giả, 1=Admin',
  `ngay_tao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_linhvuc` (`id_linhvuc`),
  ADD KEY `id_tacgia` (`id_tacgia`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_baiviet` (`id_baiviet`);

--
-- Chỉ mục cho bảng `content_blocks`
--
ALTER TABLE `content_blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_baiviet` (`id_baiviet`);

--
-- Chỉ mục cho bảng `linhvuc`
--
ALTER TABLE `linhvuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `content_blocks`
--
ALTER TABLE `content_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT cho bảng `linhvuc`
--
ALTER TABLE `linhvuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD CONSTRAINT `baiviet_ibfk_1` FOREIGN KEY (`id_linhvuc`) REFERENCES `linhvuc` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_baiviet_users` FOREIGN KEY (`id_tacgia`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `binhluan_ibfk_1` FOREIGN KEY (`id_baiviet`) REFERENCES `baiviet` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `content_blocks`
--
ALTER TABLE `content_blocks`
  ADD CONSTRAINT `content_blocks_ibfk_1` FOREIGN KEY (`id_baiviet`) REFERENCES `baiviet` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
