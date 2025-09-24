-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th9 24, 2025 lúc 02:26 PM
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
  `ngay_dang` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `baiviet`
--

INSERT INTO `baiviet` (`id`, `tieu_de`, `mo_ta_ngan`, `hinh_anh`, `id_linhvuc`, `ngay_dang`) VALUES
(1, 'iPhone 17 Pro Max ra mắt', 'Apple chính thức trình làng iPhone mới với nhiều cải tiến.', 'images/ip17.png', 2, '2025-09-24 12:36:50'),
(2, 'Laptop gaming Alienware 2025', 'Alienware 2025 sở hữu CPU Intel thế hệ mới và GPU RTX 5090.', 'images/alienware2025.png', 3, '2025-09-24 12:36:50'),
(3, 'Meta ra mắt kính thực tế ảo mới', 'Kính VR của Meta mang trải nghiệm sống động hơn với cảm biến 3D tiên tiến.', 'images/meta-vr.png', 1, '2025-09-24 12:36:50'),
(4, '10 ứng dụng AI miễn phí giúp học tập', 'Danh sách các ứng dụng AI hữu ích cho sinh viên và lập trình viên.', 'images/ai-apps.png', 4, '2025-09-24 12:36:50'),
(5, 'Top game hot tháng 9', 'Tổng hợp các tựa game được chơi nhiều nhất trong tháng 9.', 'images/game-sep.png', 5, '2025-09-24 12:36:50');

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
(2, 1, 20, 'paragraph', 'Dòng iPhone 17 giới thiệu sự thay đổi đáng kể so với thế hệ trước và bao gồm bốn phiên bản chính: iPhone 17 tiêu chuẩn, iPhone Air, iPhone 17 Pro và iPhone 17 Pro Max. Những cập nhật này không chỉ nâng cao chất lượng sử dụng mà còn đáp ứng nhu cầu đa dạng của người dùng, từ nhu cầu cơ bản đến chuyên sâu về nhiếp ảnh hay chơi game. Dưới đây là các điểm nổi bật của iPhone 17 mà bạn nên biết.'),

(3, 1, 30, 'heading', 'Sự xuất hiện của iPhone Air'),
(4, 1, 40, 'paragraph', 'iPhone Air đánh dấu một bước ngoặt trong triết lý thiết kế của Apple, với độ mỏng ấn tượng chỉ 5.6mm và trọng lượng nhẹ hơn đáng kể nhờ vào khung viền làm từ titanium cấp 5. Phiên bản này được ra mắt để thay thế cho vị trí của dòng Plus trước đây, mang đến một lựa chọn màn hình lớn nhưng vẫn đảm bảo sự thanh lịch, mỏng nhẹ và bền bỉ với lớp kính Ceramic Shield ở cả hai mặt.'),
(5, 1, 50, 'image', 'images/iphone17-air.jpg'),
(6, 1, 60, 'paragraph', 'Về cấu hình, iPhone Air sở hữu màn hình 6.5 inch, hỗ trợ công nghệ ProMotion 120Hz và đạt độ sáng tối đa lên tới 3000 nits, giúp hiển thị sắc nét ngay cả dưới trời nắng gắt. Sức mạnh của máy đến từ vi xử lý A19 Pro với 6 lõi CPU, đi kèm các chip kết nối tiên tiến như Wi-Fi 7 và Bluetooth 6. Hệ thống camera cũng không kém phần ấn tượng với cảm biến chính 48MP hỗ trợ zoom 2X và camera trước 18MP có tính năng Center Stage, tự động điều'),

(7, 1, 70, 'heading', 'Thiết kế và bảng màu mới'),
(8, 1, 80, 'paragraph', 'Năm nay, Apple tiếp tục tinh chỉnh thiết kế trên dòng iPhone 17 với sự kết hợp giữa vật liệu cao cấp và cảm giác cầm nắm thoải mái. Toàn bộ dòng sản phẩm đều sở hữu khung viền làm từ titan, không chỉ mang lại vẻ ngoài sang trọng mà còn giúp giảm đáng kể trọng lượng của máy. Bề mặt titan được xử lý nhám mờ, giúp chống bám vân tay và mồ hôi hiệu quả.'),
(9, 1, 90, 'image', 'images/iphone17-colors.jpg'),
(10, 1, 100, 'paragraph', 'Mặt lưng kính của iPhone 17 cũng được làm nhám, tạo sự đồng bộ với phần khung viền. Điểm nhấn đặc biệt của năm nay là bảng màu hoàn toàn mới, vừa thời thượng, vừa tinh tế. Các màu sắc nổi bật bao gồm Titan Sa Mạc (Desert Titanium), Xám Xi Măng (Cement Gray), và Xanh Đại Dương (Ocean Blue), mang đến những lựa chọn độc đáo, thể hiện cá tính riêng của người dùng.'),

(11, 1, 110, 'heading', 'Màn hình 120Hz chống phản chiếu cho tất cả phiên bản'),
(12, 1, 120, 'paragraph', 'Một trong những nâng cấp đáng giá và được mong chờ nhất trên iPhone 17 đã trở thành hiện thực: tất cả các phiên bản, từ iPhone 17 tiêu chuẩn cho đến bộ đôi Pro, đều được trang bị màn hình ProMotion 120Hz. Điều này có nghĩa là mọi trải nghiệm cuộn lướt trên web, mạng xã hội hay chuyển đổi giữa các ứng dụng đều trở nên mượt mà và phản hồi nhanh hơn đáng kể. Không chỉ vậy, Apple còn tích hợp một lớp phủ chống phản chiếu thế hệ mới. 

Công nghệ này giúp giảm thiểu hiệu quả độ chói và ánh sáng khi sử dụng ngoài trời hoặc dưới nguồn sáng mạnh, giúp hình ảnh hiển thị luôn rõ nét, màu sắc sống động và ít gây mỏi mắt hơn.'),
(13, 1, 130, 'image', 'images/iphone17-display.jpg'),

(14, 1, 140, 'heading', 'Hệ thống camera được nâng cấp'),
(15, 1, 150, 'paragraph', 'Apple tiếp tục khẳng định vị thế dẫn đầu trong lĩnh vực nhiếp ảnh di động với những cải tiến đột phá trên hệ thống camera của iPhone 17. Lần này, tất cả các phiên bản đều được trang bị cảm biến chính 48MP lớn hơn, cho phép thu nhận nhiều ánh sáng hơn. Điều này không chỉ giúp ảnh chụp ban ngày có độ chi tiết vượt trội mà còn cải thiện đáng kể khả năng chụp ảnh trong điều kiện thiếu sáng.

Đặc biệt, phiên bản Pro Max được trang bị ống kính tele tiềm vọng thế hệ mới, nâng khả năng zoom quang học lên một tầm cao mới. Về khả năng quay video, toàn bộ dòng iPhone 17 đều hỗ trợ quay video 8K, mang lại những thước phim siêu sắc nét, sẵn sàng cho các màn hình trình chiếu chuyên nghiệp trong tương lai.'),
(16, 1, 160, 'image', 'images/iphone17-camera.jpg'),

(17, 1, 170, 'heading', 'Hiệu năng vượt trội với chip A19 và A19 Pro'),
(18, 1, 180, 'paragraph', 'Sức mạnh cốt lõi của dòng iPhone 17 đến từ thế hệ chip A-series mới nhất: chip A19 và A19 Pro. Được sản xuất trên tiến trình 2nm tiên tiến, bộ đôi chip này không chỉ mang lại bước nhảy vọt về tốc độ xử lý CPU và đồ họa GPU mà còn tối ưu hóa đáng kể khả năng tiết kiệm năng lượng.

Điểm nhấn của thế hệ chip năm nay là Neural Engine được nâng cấp mạnh mẽ, tăng cường khả năng xử lý các tác vụ trí tuệ nhân tạo (AI) ngay trên thiết bị. Điều này giúp các tính năng như nhận diện khuôn mặt, xử lý ngôn ngữ và các ứng dụng AR (thực tế tăng cường) hoạt động nhanh và thông minh hơn. Dù bạn đang chỉnh sửa video 4K hay chơi game đồ họa đỉnh cao, chip A19 Pro đều đảm bảo một trải nghiệm mượt mà và không có độ trễ.'),
(19, 1, 190, 'image', 'images/iphone17-chip.jpg'),

(20, 1, 200, 'heading', 'Dung lượng lưu trữ lên đến 2TB'),
(21, 1, 210, 'paragraph', 'Đáp ứng nhu cầu ngày càng tăng của các nhà sáng tạo nội dung, Apple lần đầu tiên giới thiệu tùy chọn bộ nhớ trong lên đến 2TB cho các phiên bản iPhone 17 Pro. Với không gian lưu trữ khổng lồ này, người dùng có thể thoải mái quay video 8K, chụp ảnh ProRAW và cài đặt game hạng nặng mà không lo hết dung lượng.

Đây là một bước tiến quan trọng, biến iPhone trở thành một công cụ làm việc toàn diện hơn cho các chuyên gia. Ngoài ra, phiên bản tiêu chuẩn giờ đây cũng có bộ nhớ trong khởi điểm từ 256GB, mang lại không gian lưu trữ thoải mái hơn cho mọi người dùng.'),


(23, 1, 230, 'heading', 'Trang bị hệ thống tán nhiệt buồng hơi'),
(24, 1, 240, 'paragraph', 'Để đảm bảo hiệu năng đỉnh cao của chip A19 Pro được duy trì ổn định, Apple đã trang bị một hệ thống tản nhiệt buồng hơi (Vapor Chamber) tiên tiến cho dòng Pro. Công nghệ này giúp phân tán nhiệt lượng hiệu quả hơn, cho phép iPhone 17 duy trì hiệu suất tối đa trong thời gian dài khi chơi game đồ họa cao hoặc quay video 8K, hạn chế tình trạng máy quá nóng hay bị giảm hiệu năng đột ngột.'),
(25, 1, 250, 'image', 'images/iphone17-cooling.jpg'),

(26, 1, 260, 'heading', 'Thời lượng pin được kéo dài'),
(27, 1, 270, 'paragraph', 'Thời lượng pin luôn là một yếu tố được người dùng quan tâm hàng đầu, và iPhone 17 đã không làm họ thất vọng. Nhờ sự kết hợp giữa viên pin có dung lượng lớn hơn, chip A19 tiết kiệm năng lượng hơn và các thuật toán tối ưu hóa trong iOS, toàn bộ dòng iPhone 17 đều cho thời gian sử dụng dài hơn đáng kể so với thế hệ tiền nhiệm.

Các bài kiểm tra thực tế cho thấy máy có thể hoạt động liên tục thêm từ 2 đến 3 giờ, đáp ứng thoải mái một ngày dài sử dụng với cường độ cao. Apple cũng đã cải tiến công nghệ sạc, cho phép sạc nhanh hơn mà vẫn đảm bảo an toàn và tuổi thọ của pin.'),
(28, 1, 280, 'image', 'images/iphone17-battery.jpg'),

(29, 1, 290, 'heading', 'iPhone 17 khi nào ra mắt? Giá bao nhiêu?'),
(30, 1, 300, 'paragraph', 'kiện ngày 9/9/2025. Đặt hàng trước bắt đầu từ 12/9/2025, và sản phẩm chính thức có mặt từ 19/9/2025. Giá khởi điểm cho iPhone 17 là 799 USD (khoảng 24.999.000 VNĐ cho bản 256GB), iPhone Air là 999 USD (khoảng 31.999.000 VNĐ), iPhone 17 Pro là 1099 USD (khoảng 34.999.000 VNĐ) và Pro Max 1199 USD (khoảng 37.999.000 VNĐ).'),
(31, 1, 310, 'image', 'images/iphone17-price.jpg'),

(32, 1, 320, 'heading', 'Có nên mua iPhone 17 hay không?'),
(33, 1, 330, 'paragraph', 'Việc chọn mua iPhone 17 phụ thuộc vào nhu cầu cụ thể của bạn. Nếu bạn cần thiết bị mỏng nhẹ, di động cao cho công việc hàng ngày, iPhone Air là lựa chọn lý tưởng với thiết kế đột phá và pin tiết kiệm, dù camera đơn giản hơn. Bản tiêu chuẩn phù hợp người dùng cơ bản, với màn hình 120Hz và camera nâng cấp ở mức giá phải chăng, giúp nâng cấp từ iPhone cũ mà không tốn kém. Đối với nhiếp ảnh gia hoặc game thủ, iPhone 17 Pro và Pro Max vượt trội nhờ camera 48MP đa dạng, tản nhiệt buồng hơi và hiệu năng A19 Pro mạnh mẽ, đáng đầu tư nếu bạn dùng iPhone 14 trở về trước.'),

(34, 1, 340, 'heading', 'Kết luận'),
(35, 1, 350, 'paragraph', 'Qua những thông tin mới nhất về iPhone 17 có gì mới trên có thể thấy iPhone 17 khẳng định sự tiến bộ của Apple trong việc kết hợp công nghệ tiên tiến với trải nghiệm người dùng thực tế. Từ iPhone Air mỏng nhẹ đến Pro Max mạnh mẽ, mỗi phiên bản đều mang đến giá trị riêng, giúp bạn dễ dàng tìm được thiết bị phù hợp.');

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
(4, 'Ứng dụng', 'App di động và phần mềm hữu ích', '2025-09-24 12:36:50'),
(5, 'Game', 'Tin tức game, e-sport, đánh giá game', '2025-09-24 12:36:50');

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
(1, 1, NULL, 'Chi tiết iPhone 17 Pro Max: Chip A19, camera nâng cấp, hỗ trợ sạc nhanh.'),
(2, 2, NULL, 'Alienware 2025: CPU Intel Gen mới, GPU RTX 5090, màn hình 240Hz.'),
(3, 3, NULL, 'Meta VR 2025: Kính thực tế ảo với cảm biến 3D, hỗ trợ nhiều ứng dụng.'),
(4, 4, NULL, 'Top 10 ứng dụng AI miễn phí giúp học tập, lập trình và nghiên cứu hiệu quả.'),
(5, 5, NULL, 'Danh sách game hot tháng 9 cùng đánh giá chi tiết.');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_linhvuc` (`id_linhvuc`);

--
-- Chỉ mục cho bảng `baiviet_hot`
--
ALTER TABLE `baiviet_hot`
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
-- AUTO_INCREMENT cho bảng `content_blocks`
--
ALTER TABLE `content_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `linhvuc`
--
ALTER TABLE `linhvuc`
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
  ADD CONSTRAINT `baiviet_ibfk_1` FOREIGN KEY (`id_linhvuc`) REFERENCES `linhvuc` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `baiviet_hot`
--
ALTER TABLE `baiviet_hot`
  ADD CONSTRAINT `baiviet_hot_ibfk_1` FOREIGN KEY (`id_baiviet`) REFERENCES `baiviet` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `content_blocks`
--
ALTER TABLE `content_blocks`
  ADD CONSTRAINT `content_blocks_ibfk_1` FOREIGN KEY (`id_baiviet`) REFERENCES `baiviet` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `noidung`
--
ALTER TABLE `noidung`
  ADD CONSTRAINT `noidung_ibfk_1` FOREIGN KEY (`id_baiviet`) REFERENCES `baiviet` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
