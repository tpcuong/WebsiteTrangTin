-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 23, 2025 at 05:04 PM
-- Server version: 5.7.25
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tincongnghe_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `baiviet`
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
-- Dumping data for table `baiviet`
--

INSERT INTO `baiviet` (`id`, `tieu_de`, `mo_ta_ngan`, `hinh_anh`, `id_danhmuc`, `ngay_dang`) VALUES
(101, 'iPhone 17 Pro Max ra mắt với chip A19', 'Apple chính thức trình làng dòng iPhone mới với nhiều cải tiến đột phá về hiệu năng.', 'images/ip17.png', 1, '2025-09-23 10:00:00'),
(102, 'Xu hướng lập trình Python năm 2026', 'Phân tích các thư viện và framework Python được dự đoán sẽ hot trong năm tới.', 'python-trends.jpg', 2, '2025-09-23 11:30:00'),
(103, 'Google phát triển AI có thể tự viết mã nguồn', 'Dự án mới của Google hứa hẹn cách mạng hóa ngành công nghiệp phần mềm.', 'google-ai-coding.jpg', 3, '2025-09-23 12:45:00'),
(104, 'Samsung giới thiệu màn hình gập 4 lần', 'Công nghệ màn hình mới của Samsung cho phép thiết bị gập đến 4 lần, mở ra không gian làm việc rộng hơn.', 'samsung-fold.jpg', 1, '2025-09-23 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `baiviet_hot`
--

CREATE TABLE `baiviet_hot` (
  `id` int(11) NOT NULL,
  `id_baiviet` int(11) DEFAULT NULL,
  `vi_tri` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `baiviet_hot`
--

INSERT INTO `baiviet_hot` (`id`, `id_baiviet`, `vi_tri`) VALUES
(1, 101, 1),
(2, 103, 2);

-- --------------------------------------------------------

--
-- Table structure for table `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `ten_danhmuc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta` text COLLATE utf8mb4_unicode_ci,
  `ngay_tao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `ten_danhmuc`, `mo_ta`, `ngay_tao`) VALUES
(1, 'Tin công nghệ', 'Các tin tức mới nhất về công nghệ và thiết bị điện tử.', '2025-09-23 09:00:00'),
(2, 'Lập trình', 'Bài viết chuyên sâu về các ngôn ngữ và framework lập trình.', '2025-09-23 09:05:00'),
(3, 'Trí tuệ nhân tạo', 'Các nghiên cứu và ứng dụng mới nhất trong lĩnh vực AI.', '2025-09-23 09:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `noidung`
--

CREATE TABLE `noidung` (
  `id` int(11) NOT NULL,
  `id_baiviet` int(11) DEFAULT NULL,
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noi_dung` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `noidung`
--

INSERT INTO `noidung` (`id`, `id_baiviet`, `hinh_anh`, `noi_dung`) VALUES
(1, 101, NULL, 'Bài viết chi tiết về iPhone 17 Pro Max: \"Mẫu iPhone mới nhất từ Apple mang đến những cải tiến vượt trội về hiệu năng và camera. Được trang bị chip A19 Bionic, thiết bị này xử lý các tác vụ nặng một cách mượt mà và hiệu quả.\"'),
(2, 101, 'iphone-a19-chip.jpg', NULL),
(3, 102, NULL, 'Báo cáo về Python: \"Năm 2026 được dự đoán sẽ là năm bùng nổ của các ứng dụng AI và Machine Learning, kéo theo sự phát triển mạnh mẽ của các framework Python như PyTorch và TensorFlow.\"'),
(4, 103, NULL, 'Chi tiết dự án AI của Google: \"Dự án này sử dụng mô hình ngôn ngữ lớn để hiểu và tự động viết code, giúp các lập trình viên tiết kiệm thời gian và tập trung vào các vấn đề phức tạp hơn.\"'),
(5, 104, NULL, 'Sự kiện ra mắt màn hình gập của Samsung: \"Thiết kế màn hình gập 4 lần không chỉ tăng diện tích hiển thị mà còn giúp các nhà phát triển tạo ra những ứng dụng sáng tạo, tận dụng tối đa không gian màn hình.\"');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_danhmuc` (`id_danhmuc`);

--
-- Indexes for table `baiviet_hot`
--
ALTER TABLE `baiviet_hot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_baiviet` (`id_baiviet`);

--
-- Indexes for table `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noidung`
--
ALTER TABLE `noidung`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_baiviet` (`id_baiviet`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `baiviet`
--
ALTER TABLE `baiviet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `baiviet_hot`
--
ALTER TABLE `baiviet_hot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `noidung`
--
ALTER TABLE `noidung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `baiviet`
--
ALTER TABLE `baiviet`
  ADD CONSTRAINT `baiviet_ibfk_1` FOREIGN KEY (`id_danhmuc`) REFERENCES `danhmuc` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `baiviet_hot`
--
ALTER TABLE `baiviet_hot`
  ADD CONSTRAINT `baiviet_hot_ibfk_1` FOREIGN KEY (`id_baiviet`) REFERENCES `baiviet` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `noidung`
--
ALTER TABLE `noidung`
  ADD CONSTRAINT `noidung_ibfk_1` FOREIGN KEY (`id_baiviet`) REFERENCES `baiviet` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
