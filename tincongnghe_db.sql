-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th10 23, 2025 lúc 02:25 AM
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
(1, 'iPhone 17 Pro Max ra mắt', 'Apple chính thức trình làng iPhone mới với nhiều cải tiến.', 'images/ip177.png', 2, '2025-10-24 13:00:00'),
(2, 'Laptop gaming Alienware 2025', 'Alienware 2025 sở hữu CPU Intel thế hệ mới và GPU RTX 5090.', 'images/alienware2025.png', 3, '2025-10-24 12:59:50'),
(3, 'Meta ra mắt kính thực tế ảo mới', 'Kính VR của Meta mang trải nghiệm sống động hơn với cảm biến 3D tiên tiến.', 'images/meta-vr.png', 1, '2025-10-24 12:58:50'),
(4, '10 ứng dụng AI miễn phí giúp học tập', 'Danh sách các ứng dụng AI hữu ích cho sinh viên và lập trình viên.', 'images/ai-apps.png', 4, '2025-10-24 12:57:50'),

(5, 'Top game hot tháng 9', 'Tổng hợp các tựa game được chơi nhiều nhất trong tháng 9.', 'images/game-sep.png', NULL, '2025-09-24 12:36:50'),

(6, 'Đánh giá chi tiết laptop Dell XPS 13 9350 2025', 'Mẫu laptop mới của Dell với thiết kế mỏng nhẹ và hiệu năng đỉnh cao nhờ chip Intel Core Ultra mới.', 'images/laptop.png', 3, '2025-10-24 12:56:00'),
(7, 'Samsung ra mắt Galaxy Z Fold 7', 'Chiếc điện thoại gập thế hệ mới của Samsung có nhiều cải tiến về màn hình và độ bền bản lề.', 'images/GalaxyZ.png', 2, '2025-10-24 12:55:30'),
(8, 'Xu hướng phát triển của trí tuệ nhân tạo tạo sinh', 'AI tạo sinh đang thay đổi nhiều ngành công nghiệp, từ nghệ thuật đến lập trình.', 'images/AIs.png', 1, '2025-10-24 12:54:00'),
(9, 'Top 5 ứng dụng quản lý công việc hiệu quả nhất', 'Danh sách các ứng dụng giúp bạn sắp xếp công việc và tăng năng suất làm việc nhóm.', 'images/TOP.png', 4, '2025-10-24 12:53:15'),


(10, 'Google Pixel 9: Có gì mới?', 'Những nâng cấp đáng chú ý về camera và các tính năng AI độc quyền trên dòng Pixel mới.', 'images/pixel9.png', 2, '2025-10-15 10:05:55'),
(11, 'Tương lai của mạng 6G và những ứng dụng tiềm năng', 'Công nghệ mạng 6G hứa hẹn sẽ mở ra một kỷ nguyên mới cho Internet vạn vật (IoT) và xe tự lái.', 'images/6G.png', 1, '2025-10-15 18:00:00'),
(12, 'Microsoft Surface Pro 11: Sự kết hợp hoàn hảo giữa laptop và tablet', 'Thiết bị mới của Microsoft được trang bị chip ARM mạnh mẽ và thời lượng pin ấn tượng.', 'images/PRO.png', 3, '2025-10-16 10:10:10'),
(13, 'AI tổng hợp giọng nói ngày càng giống thật', 'Công nghệ AI giọng nói thế hệ mới có thể bắt chước cảm xúc con người một cách tự nhiên.', 'images/voiceAI.png', 1, '2025-10-18 09:00:00'),
(14, 'Robot thế hệ mới có khả năng học cảm xúc', 'Các nhà nghiên cứu phát triển robot biết nhận biết và phản hồi cảm xúc con người.', 'images/robotAI.png', 1, '2025-10-18 10:15:00'),
(15, 'Chip lượng tử đầu tiên được thương mại hóa', 'Một bước tiến lớn trong ngành máy tính lượng tử với con chip đầu tiên được bán ra thị trường.', 'images/quantumchip.png', 1, '2025-10-18 11:00:00'),
(16, 'Apple phát triển trợ lý AI cá nhân iIntelli', 'Trợ lý AI mới của Apple hứa hẹn thay đổi cách người dùng tương tác với thiết bị.', 'images/iIntelli.png', 1, '2025-10-19 08:45:00'),
(17, 'Công nghệ pin graphene sạc đầy trong 2 phút', 'Pin graphene mở ra kỷ nguyên mới cho thiết bị di động và xe điện.', 'images/graphene.png', 1, '2025-10-19 10:00:00'),
(18, 'Google giới thiệu dự án AI về sáng tạo nghệ thuật', 'AI của Google có thể tạo tranh, nhạc và video với phong cách nghệ sĩ nổi tiếng.', 'images/AIArt.png', 1, '2025-10-20 14:20:00'),
(19, 'Trí tuệ nhân tạo trong y học: Chẩn đoán nhanh hơn bác sĩ', 'AI y tế có thể phát hiện bệnh sớm và hỗ trợ bác sĩ ra quyết định điều trị.', 'images/medicalAI.png', 1, '2025-10-21 09:30:00'),
(20, 'Vivo X200 ra mắt với camera ZEISS', 'Vivo X200 được trang bị cảm biến ZEISS và chip Dimensity 9400 mạnh mẽ.', 'images/vivox200.png', 2, '2025-10-21 09:30:00'),
(21, 'Xiaomi 15 Pro chính thức ra mắt', 'Xiaomi 15 Pro ra mắt với chip Snapdragon 8 Gen 4 và camera Leica mới.', 'images/xiaomi15pro.png', 2, '2025-10-21 11:00:00'),
(22, 'Oppo Find X8 – Thiết kế tràn viền độc đáo', 'Oppo Find X8 gây ấn tượng với màn hình cong 120Hz và camera cảm biến lớn.', 'images/oppoX8.png', 2, '2025-10-21 13:30:00'),
(23, 'Google Pixel Fold 2 trình làng', 'Google Pixel Fold 2 sở hữu màn hình gập linh hoạt hơn và tính năng AI mạnh mẽ.', 'images/pixelfold2.png', 2, '2025-10-22 09:15:00'),
(24, 'Samsung Galaxy S26 Ultra rò rỉ cấu hình', 'Galaxy S26 Ultra được đồn đoán có cảm biến camera 250MP và chip Exynos 2500.', 'images/s26ultra.png', 2, '2025-10-22 10:45:00'),
(25, 'Asus ROG Phone 9 – Quái thú gaming', 'ROG Phone 9 ra mắt với tản nhiệt đột phá và màn hình AMOLED 165Hz.', 'images/rogphone9.png', 2, '2025-10-22 12:00:00'),
(26, 'Realme GT Neo 6 – Hiệu năng vượt tầm giá', 'Chiếc smartphone tầm trung của Realme gây bất ngờ với hiệu năng mạnh và sạc 240W.', 'images/realmeGT6.png', 2, '2025-10-22 13:15:00'),
(27, 'Intel Core Ultra 200 ra mắt với hiệu năng vượt trội', 'Dòng chip Intel Core Ultra 200 mang đến bước tiến lớn về hiệu năng và tiết kiệm điện năng.', 'images/intelcoreultra200.png', 3, '2025-10-21 09:00:00'),
(28, 'AMD Ryzen 9000 chính thức trình làng', 'AMD công bố thế hệ vi xử lý Ryzen 9000 với kiến trúc Zen 6 mạnh mẽ hơn bao giờ hết.', 'images/ryzen9000.png', 3, '2025-10-21 10:30:00'),
(29, 'Apple giới thiệu MacBook Pro M4', 'MacBook Pro M4 được nâng cấp chip Apple Silicon M4 và màn hình mini-LED sáng hơn.', 'images/macbookprom4.png', 3, '2025-10-21 12:00:00'),
(30, 'Dell XPS 16 2025 ra mắt với thiết kế mỏng nhẹ', 'Dell XPS 16 mang phong cách tinh tế cùng màn hình InfinityEdge thế hệ mới.', 'images/dellxps16.png', 3, '2025-10-21 14:00:00'),
(31, 'NVIDIA RTX 5090 – Hiệu năng đồ họa khủng', 'RTX 5090 đạt bước nhảy lớn về hiệu suất và hỗ trợ công nghệ ray tracing thế hệ mới.', 'images/rtx5090.png', 3, '2025-10-22 09:30:00'),
(32, 'Asus ROG Strix G18 2025 – Gaming laptop đỉnh cao', 'Asus ROG Strix G18 trang bị GPU RTX 5090 và hệ thống tản nhiệt cải tiến.', 'images/rogstrixg18.png', 3, '2025-10-22 11:00:00'),
(33, 'Lenovo Legion 9i Gen 10 trình làng', 'Laptop gaming cao cấp Lenovo Legion 9i Gen 10 có thiết kế sợi carbon và tản nhiệt chất lỏng.', 'images/legion9igen10.png', 3, '2025-10-22 13:00:00'),
(34, 'TikTok Notes ra mắt toàn cầu', 'TikTok Notes – nền tảng chia sẻ ảnh mới của TikTok, đối đầu trực tiếp với Instagram.', 'images/tiktoknotes.png', 4, '2025-10-21 09:00:00'),
(35, 'Meta AI chính thức tích hợp vào Messenger', 'Người dùng Messenger nay có thể trò chuyện và tạo hình ảnh với Meta AI ngay trong ứng dụng.', 'images/metaai_messenger.png', 4, '2025-10-21 10:15:00'),
(36, 'CapCut bổ sung công cụ AI dựng video tự động', 'Ứng dụng chỉnh sửa video CapCut cập nhật tính năng AI tự động tạo video từ văn bản.', 'images/capcutai.png', 4, '2025-10-21 12:00:00'),
(37, 'Google Maps cập nhật chế độ AR chỉ đường trong nhà', 'Google Maps thêm tính năng chỉ đường bằng AR tại trung tâm thương mại và sân bay.', 'images/googlemapsar.png', 4, '2025-10-21 14:00:00'),
(38, 'ChatGPT App cập nhật giao diện mới trên iOS và Android', 'Ứng dụng ChatGPT được nâng cấp giao diện hiện đại, hỗ trợ nhập liệu bằng giọng nói.', 'images/chatgptapp2025.png', 4, '2025-10-22 09:00:00'),
(39, 'Canva AI ra mắt công cụ thiết kế logo tự động', 'Canva tích hợp AI giúp người dùng tạo logo chuyên nghiệp chỉ trong vài giây.', 'images/canvaai.png', 4, '2025-10-22 10:30:00'),
(40, 'Zalo cập nhật tính năng nhắc lịch thông minh', 'Zalo giới thiệu tính năng mới cho phép tự động nhắc hẹn dựa trên tin nhắn.', 'images/zalo_smartreminder.png', 4, '2025-10-22 12:15:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baiviet_hot`
--

CREATE TABLE `baiviet_hot` (
  `id` int(11) NOT NULL,
  `id_baiviet` int(11) DEFAULT NULL,
  `vi_tri` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `baiviet_hot`
--

INSERT INTO `baiviet_hot` (`id`, `id_baiviet`, `vi_tri`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

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
(12, 1, 120, 'paragraph', 'Một trong những nâng cấp đáng giá và được mong chờ nhất trên iPhone 17 đã trở thành hiện thực: tất cả các phiên bản, từ iPhone 17 tiêu chuẩn cho đến bộ đôi Pro, đều được trang bị màn hình ProMotion 120Hz. Điều này có nghĩa là mọi trải nghiệm cuộn lướt trên web, mạng xã hội hay chuyển đổi giữa các ứng dụng đều trở nên mượt mà và phản hồi nhanh hơn đáng kể. Không chỉ vậy, Apple còn tích hợp một lớp phủ chống phản chiếu thế hệ mới. \n\nCông nghệ này giúp giảm thiểu hiệu quả độ chói và ánh sáng khi sử dụng ngoài trời hoặc dưới nguồn sáng mạnh, giúp hình ảnh hiển thị luôn rõ nét, màu sắc sống động và ít gây mỏi mắt hơn.'),
(13, 1, 130, 'image', 'images/iphone17-display.jpg'),
(14, 1, 140, 'heading', 'Hệ thống camera được nâng cấp'),
(15, 1, 150, 'paragraph', 'Apple tiếp tục khẳng định vị thế dẫn đầu trong lĩnh vực nhiếp ảnh di động với những cải tiến đột phá trên hệ thống camera của iPhone 17. Lần này, tất cả các phiên bản đều được trang bị cảm biến chính 48MP lớn hơn, cho phép thu nhận nhiều ánh sáng hơn. Điều này không chỉ giúp ảnh chụp ban ngày có độ chi tiết vượt trội mà còn cải thiện đáng kể khả năng chụp ảnh trong điều kiện thiếu sáng.\n\nĐặc biệt, phiên bản Pro Max được trang bị ống kính tele tiềm vọng thế hệ mới, nâng khả năng zoom quang học lên một tầm cao mới. Về khả năng quay video, toàn bộ dòng iPhone 17 đều hỗ trợ quay video 8K, mang lại những thước phim siêu sắc nét, sẵn sàng cho các màn hình trình chiếu chuyên nghiệp trong tương lai.'),
(16, 1, 160, 'image', 'images/iphone17-camera.jpg'),
(17, 1, 170, 'heading', 'Hiệu năng vượt trội với chip A19 và A19 Pro'),
(18, 1, 180, 'paragraph', 'Sức mạnh cốt lõi của dòng iPhone 17 đến từ thế hệ chip A-series mới nhất: chip A19 và A19 Pro. Được sản xuất trên tiến trình 2nm tiên tiến, bộ đôi chip này không chỉ mang lại bước nhảy vọt về tốc độ xử lý CPU và đồ họa GPU mà còn tối ưu hóa đáng kể khả năng tiết kiệm năng lượng.\n\nĐiểm nhấn của thế hệ chip năm nay là Neural Engine được nâng cấp mạnh mẽ, tăng cường khả năng xử lý các tác vụ trí tuệ nhân tạo (AI) ngay trên thiết bị. Điều này giúp các tính năng như nhận diện khuôn mặt, xử lý ngôn ngữ và các ứng dụng AR (thực tế tăng cường) hoạt động nhanh và thông minh hơn. Dù bạn đang chỉnh sửa video 4K hay chơi game đồ họa đỉnh cao, chip A19 Pro đều đảm bảo một trải nghiệm mượt mà và không có độ trễ.'),
(19, 1, 190, 'image', 'images/iphone17-chip.jpg'),
(20, 1, 200, 'heading', 'Dung lượng lưu trữ lên đến 2TB'),
(21, 1, 210, 'paragraph', 'Đáp ứng nhu cầu ngày càng tăng của các nhà sáng tạo nội dung, Apple lần đầu tiên giới thiệu tùy chọn bộ nhớ trong lên đến 2TB cho các phiên bản iPhone 17 Pro. Với không gian lưu trữ khổng lồ này, người dùng có thể thoải mái quay video 8K, chụp ảnh ProRAW và cài đặt game hạng nặng mà không lo hết dung lượng.\n\nĐây là một bước tiến quan trọng, biến iPhone trở thành một công cụ làm việc toàn diện hơn cho các chuyên gia. Ngoài ra, phiên bản tiêu chuẩn giờ đây cũng có bộ nhớ trong khởi điểm từ 256GB, mang lại không gian lưu trữ thoải mái hơn cho mọi người dùng.'),
(23, 1, 230, 'heading', 'Trang bị hệ thống tán nhiệt buồng hơi'),
(24, 1, 240, 'paragraph', 'Để đảm bảo hiệu năng đỉnh cao của chip A19 Pro được duy trì ổn định, Apple đã trang bị một hệ thống tản nhiệt buồng hơi (Vapor Chamber) tiên tiến cho dòng Pro. Công nghệ này giúp phân tán nhiệt lượng hiệu quả hơn, cho phép iPhone 17 duy trì hiệu suất tối đa trong thời gian dài khi chơi game đồ họa cao hoặc quay video 8K, hạn chế tình trạng máy quá nóng hay bị giảm hiệu năng đột ngột.'),
(25, 1, 250, 'image', 'images/iphone17-cooling.jpg'),
(26, 1, 260, 'heading', 'Thời lượng pin được kéo dài'),
(27, 1, 270, 'paragraph', 'Thời lượng pin luôn là một yếu tố được người dùng quan tâm hàng đầu, và iPhone 17 đã không làm họ thất vọng. Nhờ sự kết hợp giữa viên pin có dung lượng lớn hơn, chip A19 tiết kiệm năng lượng hơn và các thuật toán tối ưu hóa trong iOS, toàn bộ dòng iPhone 17 đều cho thời gian sử dụng dài hơn đáng kể so với thế hệ tiền nhiệm.\n\nCác bài kiểm tra thực tế cho thấy máy có thể hoạt động liên tục thêm từ 2 đến 3 giờ, đáp ứng thoải mái một ngày dài sử dụng với cường độ cao. Apple cũng đã cải tiến công nghệ sạc, cho phép sạc nhanh hơn mà vẫn đảm bảo an toàn và tuổi thọ của pin.'),
(28, 1, 280, 'image', 'images/iphone17-battery.jpg'),
(29, 1, 290, 'heading', 'iPhone 17 khi nào ra mắt? Giá bao nhiêu?'),
(30, 1, 300, 'paragraph', 'kiện ngày 9/9/2025. Đặt hàng trước bắt đầu từ 12/9/2025, và sản phẩm chính thức có mặt từ 19/9/2025. Giá khởi điểm cho iPhone 17 là 799 USD (khoảng 24.999.000 VNĐ cho bản 256GB), iPhone Air là 999 USD (khoảng 31.999.000 VNĐ), iPhone 17 Pro là 1099 USD (khoảng 34.999.000 VNĐ) và Pro Max 1199 USD (khoảng 37.999.000 VNĐ).'),
(31, 1, 310, 'image', 'images/iphone17-price.jpg'),
(32, 1, 320, 'heading', 'Có nên mua iPhone 17 hay không?'),
(33, 1, 330, 'paragraph', 'Việc chọn mua iPhone 17 phụ thuộc vào nhu cầu cụ thể của bạn. Nếu bạn cần thiết bị mỏng nhẹ, di động cao cho công việc hàng ngày, iPhone Air là lựa chọn lý tưởng với thiết kế đột phá và pin tiết kiệm, dù camera đơn giản hơn. Bản tiêu chuẩn phù hợp người dùng cơ bản, với màn hình 120Hz và camera nâng cấp ở mức giá phải chăng, giúp nâng cấp từ iPhone cũ mà không tốn kém. Đối với nhiếp ảnh gia hoặc game thủ, iPhone 17 Pro và Pro Max vượt trội nhờ camera 48MP đa dạng, tản nhiệt buồng hơi và hiệu năng A19 Pro mạnh mẽ, đáng đầu tư nếu bạn dùng iPhone 14 trở về trước.'),
(34, 1, 340, 'heading', 'Kết luận'),
(35, 1, 350, 'paragraph', 'Qua những thông tin mới nhất về iPhone 17 có gì mới trên có thể thấy iPhone 17 khẳng định sự tiến bộ của Apple trong việc kết hợp công nghệ tiên tiến với trải nghiệm người dùng thực tế. Từ iPhone Air mỏng nhẹ đến Pro Max mạnh mẽ, mỗi phiên bản đều mang đến giá trị riêng, giúp bạn dễ dàng tìm được thiết bị phù hợp.'),


(36, 2, 10, 'paragraph', 'Nếu bạn đang tìm một chiếc laptop gaming Dell, không thể không nhắc đến Alienware - thương hiệu con cao cấp nhất, biểu tượng cho sức mạnh và thiết kế gaming đỉnh cao của gã khổng lồ công nghệ Mỹ. Alienware không chỉ là một chiếc laptop, nó là một tuyên ngôn về đẳng cấp, hiệu năng và sự đột phá công nghệ, sinh ra để thống trị thế giới game.'),
(37, 2, 20, 'heading', '1. Thiết kế "Legend" - Di sản từ tương lai'),
(38, 2, 30, 'paragraph', 'Các dòng máy Alienware, đặc biệt là series X và M, đều tuân theo triết lý thiết kế ''Legend'' độc quyền. Với vỏ máy thường được làm từ hợp kim Magie cao cấp, chúng mang lại cảm giác chắc chắn, hầm hố nhưng vẫn tinh tế. Điểm nhấn không thể nhầm lẫn là hệ thống LED AlienFX RGB tùy chỉnh, đặc biệt là logo đầu người ngoài hành tinh phát sáng, tạo nên một bản sắc riêng biệt mà không game thủ nào có thể cưỡng lại.'),
(39, 2, 40, 'image', 'images/laptop1.jpg'),
(40, 2, 50, 'paragraph', '<strong>Thiết kế biểu tượng:</strong> Giúp bạn nổi bật ở bất kỳ đâu, thể hiện cá tính mạnh mẽ.<br><strong>Vật liệu cao cấp:</strong> Đảm bảo độ bền bỉ vượt trội so với các laptop gaming thông thường.'),
(41, 2, 60, 'tip', 'Sử dụng Alienware Command Center để đồng bộ ánh sáng AlienFX với các tựa game yêu thích của bạn.'),
(42, 2, 70, 'heading', '2. Cấu hình vượt trội - Sinh ra để thống trị'),
(43, 2, 80, 'paragraph', 'Alienware luôn là một trong những hãng đầu tiên được trang bị phần cứng mới nhất và mạnh nhất. Các tùy chọn CPU thường là Intel Core i9 hoặc Ultra 9 dòng HX, kết hợp với GPU NVIDIA GeForce RTX 40-series hoặc 50-series (như RTX 5080/5090) với mức TGP tối đa. Điều này đảm bảo bạn có thể ''max settings'' mọi tựa game AAA nặng nhất ở độ phân giải QHD hoặc 4K mà không gặp bất kỳ khó khăn nào.'),
(44, 2, 90, 'heading', '3. Phân loại các dòng Dell Alienware theo nhu cầu sử dụng'),
(45, 2, 100, 'paragraph', 'Dell Alienware chia thành hai dòng chính, đáp ứng nhu cầu sử dụng khác nhau:'),
(46, 2, 110, 'paragraph', '<strong>Alienware M Series – Hiệu năng cực đại, thiết kế truyền thống</strong><br>Các model: Alienware M15, M16, M18<br>Thiết kế lớn, nhiều cổng kết nối, tản nhiệt mạnh<br>Phù hợp cho: Game nặng, dựng phim, công việc đồ họa 3D chuyên sâu'),
(47, 2, 120, 'paragraph', '<strong>Alienware X Series – Mỏng nhẹ hơn, vẫn cực kỳ mạnh mẽ</strong><br>Các model: Alienware X14, X16<br>Thiết kế tinh tế, mỏng nhẹ, dễ mang theo<br>Phù hợp cho: Streamer, designer, người di chuyển nhiều, sinh viên ngành thiết kế/game'),
(48, 2, 130, 'heading', '4. Dell Alienware phù hợp với đối tượng nào?'),
(49, 2, 140, 'paragraph', 'Dell Alienware là dòng laptop dành cho người dùng yêu cầu cấu hình mạnh, độ bền cao và trải nghiệm toàn diện:<br>Game thủ chuyên nghiệp: Chơi game AAA, eSport, stream game, đấu giải<br>Người làm thiết kế đồ họa 3D, kỹ xảo: Sử dụng Blender, Cinema 4D, After Effects, Unreal Engine, Premiere Pro<br>Người yêu công nghệ, đam mê hiệu năng: Yêu thích build cao cấp, máy “ngầu”, trải nghiệm tốt<br>Người cần laptop thay thế desktop: Đáp ứng cả làm việc – chơi game – giải trí lâu dài'),
(50, 2, 150, 'image', 'images/laptop2.jpg'),
(51, 2, 160, 'heading', '5. Mức giá và Đẳng cấp'),
(52, 2, 170, 'paragraph', 'Không thể phủ nhận, Alienware có mức giá thuộc hàng cao nhất trên thị trường. Nhưng những gì bạn nhận lại không chỉ là phần cứng, mà là toàn bộ trải nghiệm: từ thiết kế, vật liệu cao cấp, công nghệ tản nhiệt tiên tiến cho đến sự tự hào khi sở hữu một biểu tượng. Đây là khoản đầu tư cho những game thủ nghiêm túc và những nhà sáng tạo chuyên nghiệp.'),
(53, 2, 180, 'paragraph', '<strong>Đáng giá?</strong> Nếu bạn tìm kiếm hiệu năng tối đa và một thiết kế mang tính biểu tượng, Alienware là câu trả lời.<br><strong>Lựa chọn:</strong> Dòng M-series cho sức mạnh tối đa, dòng X-series cho sự cân bằng giữa hiệu năng và tính di động mỏng nhẹ.'),
(54, 2, 190, 'tip', 'Luôn kiểm tra các chương trình khuyến mãi, vì mức giá cao của Alienware thường đi kèm với các ưu đãi hấp dẫn.'),
(55, 2, 200, 'tip', 'Công nghệ tản nhiệt Cryo-Tech trứ danh với keo tản nhiệt Element 31 và hệ thống 4 quạt (trên bản cao cấp) là yếu tố cốt lõi giữ cho máy luôn mát mẻ.'),

(56, 3, 10, 'paragraph', 'Sau thành công của Meta Quest 3, cộng đồng VR đang háo hức chờ đợi thế hệ tiếp theo: Meta Quest 4. Mặc dù chưa có thông báo chính thức, các tin đồn và phân tích công nghệ đã cho chúng ta một cái nhìn sơ bộ về những gì có thể mong đợi từ chiếc kính thực tế ảo đột phá này. Hãy cùng tổng hợp tất cả những thông tin và dự đoán đáng chú ý nhất.'),
(57, 3, 20, 'heading', 'Meta Quest 4: Ngày phát hành dự kiến'),
(58, 3, 30, 'paragraph', 'Meta thường tuân theo chu kỳ phát hành sản phẩm khoảng hai năm một lần. Với việc Quest 3 ra mắt vào mùa thu năm 2023, rất có thể Meta Quest 4 sẽ được trình làng vào khoảng **mùa thu năm 2025**. Giám đốc công nghệ của Meta, Andrew Bosworth, cũng đã gợi ý rằng một phiên bản kế nhiệm thực sự sẽ không xuất hiện sớm hơn 2025.'),
(59, 3, 40, 'heading', 'Meta Quest 4: Mức giá dự kiến'),
(60, 3, 50, 'paragraph', 'Quest 3 có giá khởi điểm là 499 USD, một mức giá được cho là khá cao nhưng hợp lý với công nghệ mà nó mang lại. Nhiều khả năng Meta sẽ cố gắng giữ mức giá của Quest 4 trong khoảng tương tự, có thể là từ **499 đến 599 USD**, để duy trì tính cạnh tranh và khả năng tiếp cận với người dùng phổ thông.'),
(61, 3, 60, 'image', 'images/meta-quest-4-concept.jpg'),
(62, 3, 70, 'heading', 'Những tính năng mới nào sẽ có trên Meta Quest 4?'),
(63, 3, 80, 'paragraph', 'Quest 4 được kỳ vọng sẽ không phải là một cuộc cách mạng, mà là một sự tiến hóa vượt bậc từ Quest 3 với những cải tiến tập trung vào trải nghiệm người dùng.'),
(64, 3, 90, 'heading', 'Thấu kính Pancake và Màn hình cải tiến'),
(65, 3, 100, 'paragraph', 'Thấu kính Pancake đã là một bước tiến lớn trên Quest 3, và Quest 4 chắc chắn sẽ tiếp tục cải tiến công nghệ này để mang lại hình ảnh sắc nét hơn và giảm hiện tượng quang sai. Về màn hình, chúng ta có thể mong đợi độ phân giải cao hơn nữa, có thể đạt mức 4.5K hoặc thậm chí 5K mỗi mắt, mang lại trải nghiệm hình ảnh siêu thực.'),
(66, 3, 110, 'heading', 'Thêm sức mạnh với chip Snapdragon mới'),
(67, 3, 120, 'paragraph', 'Quest 3 sử dụng chip Snapdragon XR2 Gen 2. Theo lẽ tự nhiên, Quest 4 sẽ được trang bị phiên bản kế nhiệm, có thể là **Snapdragon XR2 Gen 3 hoặc Gen 4**, hứa hẹn mang lại hiệu năng xử lý đồ họa mạnh mẽ hơn, hỗ trợ các tựa game phức tạp hơn và nâng cao khả năng AI.'),
(68, 3, 130, 'heading', 'Cải thiện Passthrough và Thực tế hỗn hợp (Mixed Reality)'),
(69, 3, 140, 'paragraph', 'Tính năng Passthrough (nhìn xuyên thấu) trên Quest 3 đã rất ấn tượng, nhưng vẫn còn độ trễ và nhiễu. Quest 4 được kỳ vọng sẽ giải quyết vấn đề này với các camera có độ phân giải cao hơn và vi xử lý mạnh hơn, mang lại trải nghiệm Thực tế hỗn hợp (MR) mượt mà và chân thực như nhìn bằng mắt thường.'),
(70, 3, 150, 'heading', 'Bộ điều khiển mới cho Quest 4?'),
(71, 3, 160, 'paragraph', 'Bộ điều khiển Touch Plus của Quest 3 đã loại bỏ vòng theo dõi, nhưng vẫn còn khá lớn. Có tin đồn rằng Meta đang nghiên cứu các công nghệ theo dõi tay tiên tiến hơn, có thể dẫn đến một bộ điều khiển nhỏ gọn hơn nữa hoặc thậm chí là khả năng tương tác hoàn toàn bằng tay mà không cần đến bộ điều khiển.'),
(72, 3, 170, 'heading', 'Kết luận: Quest 4 là bước tiến hợp lý'),
(73, 3, 180, 'paragraph', 'Meta Quest 4 hứa hẹn sẽ là một bản nâng cấp đáng giá, tập trung vào việc hoàn thiện những gì Quest 3 đã làm tốt: hình ảnh sắc nét hơn, hiệu năng mạnh mẽ hơn và trải nghiệm thực tế hỗn hợp liền mạch hơn. Dù phải đến 2025 chúng ta mới có thông tin chính thức, những gì được đồn đoán cũng đủ để khiến cộng đồng VR phải phấn khích.'),

(74, 4, 10, 'paragraph', 'Trí tuệ nhân tạo (AI) đang thay đổi cách chúng ta học tập và làm việc. Ngày nay, có rất nhiều ứng dụng AI miễn phí được thiết kế đặc biệt để hỗ trợ học sinh, sinh viên và những người ham học hỏi. Dưới đây là danh sách 10 công cụ AI mạnh mẽ và hữu ích nhất mà bạn không nên bỏ qua.'),
(75, 4, 20, 'heading', '1. Socratic by Google'),
(76, 4, 30, 'paragraph', 'Đây là một trợ lý học tập tuyệt vời được Google hậu thuẫn, sử dụng công nghệ AI và nhận dạng hình ảnh tiên tiến. Thay vì gõ các câu hỏi phức tạp, học sinh, sinh viên chỉ cần dùng camera điện thoại để chụp ảnh một bài toán, một công thức hóa học, hoặc một câu hỏi trắc nghiệm. Socratic sẽ ngay lập tức phân tích và truy xuất các nguồn tài liệu, video hướng dẫn, và cung cấp lời giải chi tiết từng bước. Nó hoạt động như một gia sư 24/7, hỗ trợ hầu hết các môn học từ Toán, Lý, Hóa đến Lịch sử, giúp người học hiểu sâu gốc rễ của vấn đề.'),
(77, 4, 40, 'image', 'images/ai-app-socratic.jpg'),
(78, 4, 50, 'heading', '2. Grammarly'),
(79, 4, 60, 'paragraph', 'Grammarly đã vượt xa một công cụ kiểm tra lỗi ngữ pháp và chính tả thông thường. Nó hoạt động như một trợ lý biên tập cá nhân, sử dụng AI để phân tích văn bản của bạn theo thời gian thực. Phiên bản miễn phí không chỉ sửa lỗi sai, mà còn giúp bạn cải thiện văn phong, gợi ý cách diễn đạt câu chữ rõ ràng, súc tích và chuyên nghiệp hơn. Nó cung cấp giải thích chi tiết cho các lỗi, giúp bạn học hỏi từ chính sai lầm của mình. Đây là công cụ không thể thiếu cho bất kỳ ai muốn nâng cao kỹ năng viết, đặc biệt là tiếng Anh, từ soạn email công việc, viết luận văn đến sáng tạo nội dung.'),
(80, 4, 70, 'image', 'images/ai-app-grammarly.jpg'),
(81, 4, 80, 'heading', '3. Duolingo'),
(82, 4, 90, 'paragraph', 'Duolingo là ví dụ điển hình của việc "game hóa" (gamification) giáo dục thành công. Ứng dụng sử dụng AI để tạo ra một lộ trình học tập được cá nhân hóa sâu sắc. Nó theo dõi hiệu suất của bạn, xác định điểm mạnh và điểm yếu, sau đó tự động điều chỉnh độ khó của các bài tập và flashcard. Nếu bạn liên tục sai một cấu trúc ngữ pháp, AI sẽ lặp lại nó thường xuyên hơn. Quá trình học được thiết kế như một trò chơi với điểm kinh nghiệm, "streak" (chuỗi ngày học) và bảng xếp hạng, tạo động lực mạnh mẽ để người dùng quay lại mỗi ngày. Đây là cách tuyệt vời để xây dựng thói quen và bắt đầu học một ngôn ngữ mới.'),
(83, 4, 100, 'image', 'images/ai-app-duolingo.jpg'),
(84, 4, 110, 'heading', '4. ChatGPT & Google Gemini'),
(85, 4, 120, 'paragraph', 'Hai chatbot AI hàng đầu này đã trở thành những gia sư cá nhân toàn năng. Bạn có thể đặt câu hỏi về bất kỳ chủ đề nào, từ lịch sử, văn học đến lập trình phức tạp. Chúng có khả năng giải thích các khái niệm khó một cách đơn giản, tóm tắt các tài liệu học thuật dài, và thậm chí tạo ra các câu hỏi ôn tập hoặc bài luận mẫu. Thay vì tìm kiếm trên Google, sinh viên có thể đối thoại trực tiếp với AI để đào sâu kiến thức, brainstorm ý tưởng và nhận phản hồi ngay lập tức. Phiên bản miễn phí của cả hai đều cực kỳ mạnh mẽ cho hầu hết các nhu cầu học tập.'),
(86, 4, 130, 'image', 'images/ai-app-chatbots.jpg'),
(87, 4, 140, 'heading', '5. Quizlet'),
(88, 4, 150, 'paragraph', 'Quizlet đã cách mạng hóa việc học bằng thẻ ghi nhớ (flashcards). Công cụ này sử dụng AI để giúp bạn tạo các bộ thẻ học tập từ tài liệu của mình, hoặc tìm kiếm trong kho dữ liệu khổng lồ do người dùng khác tạo ra. Tính năng "Learn" thông minh của nó sẽ ưu tiên lặp lại các câu hỏi mà bạn hay trả lời sai, áp dụng phương pháp lặp lại ngắt quãng để tối ưu hóa việc ghi nhớ. Quizlet biến việc ôn thi khô khan thành các trò chơi tương tác, giúp kiến thức được củng cố một cách hiệu quả và lâu dài.'),
(89, 4, 160, 'image', 'images/ai-app-quizlet.jpg'),
(90, 4, 170, 'heading', '6. Otter.ai'),
(91, 4, 180, 'paragraph', 'Otter.ai là một công cụ cứu cánh cho sinh viên trong các buổi học trực tuyến hoặc các bài giảng dài. Nó sử dụng AI để ghi âm và chuyển đổi giọng nói thành văn bản (speech-to-text) theo thời gian thực với độ chính xác cao. Nó không chỉ ghi lại lời giảng của giáo viên mà còn tự động nhận diện người nói khác nhau và tạo ra một bản ghi chú văn bản hoàn chỉnh, có thể tìm kiếm được. Điều này giúp sinh viên tập trung vào việc lắng nghe và hiểu bài thay vì cắm cúi ghi chép, đồng thời dễ dàng xem lại và tìm kiếm thông tin quan trọng khi ôn tập.'),
(92, 4, 190, 'image', 'images/ai-app-otter.jpg'),
(93, 4, 200, 'heading', '7. WolframAlpha'),
(94, 4, 210, 'paragraph', 'Được mệnh danh là "công cụ tri thức tính toán", WolframAlpha không giống như một công cụ tìm kiếm thông thường. Thay vì trả về các liên kết web, nó trực tiếp tính toán và đưa ra câu trả lời. Nó cực kỳ mạnh mẽ trong các lĩnh vực khoa học, toán học, thống kê và kỹ thuật. Bạn có thể yêu cầu nó giải một phương trình vi phân phức tạp, vẽ đồ thị hàm số 3D, hoặc phân tích dữ liệu. Đây là một công cụ không thể thiếu cho sinh viên các ngành STEM, cung cấp các giải pháp chính xác và trực quan hóa dữ liệu phức tạp.'),
(95, 4, 220, 'image', 'images/ai-app-wolfram.jpg'),
(96, 4, 230, 'heading', '8. Anki'),
(97, 4, 240, 'paragraph', 'Anki là một ứng dụng flashcard mã nguồn mở, được cộng đồng học thuật đánh giá rất cao. Sức mạnh cốt lõi của nó là thuật toán lặp lại ngắt quãng (Spaced Repetition System - SRS) do AI điều khiển. Thuật toán này tính toán chính xác thời điểm hoàn hảo để bạn ôn lại một kiến thức (một thẻ), ngay trước khi bạn chuẩn bị quên nó. Phương pháp này đã được khoa học chứng minh là cực kỳ hiệu quả để ghi nhớ thông tin lâu dài, đặc biệt hữu ích cho việc học từ vựng, công thức, hoặc các sự kiện lịch sử.'),
(98, 4, 250, 'image', 'images/ai-app-anki.jpg'),
(99, 4, 260, 'heading', '9. Semantic Scholar'),
(100, 4, 270, 'paragraph', 'Đối với các nhà nghiên cứu, sinh viên cao học và bất kỳ ai làm luận văn, Semantic Scholar là một công cụ tìm kiếm tài liệu học thuật được hỗ trợ bởi AI vượt trội hơn Google Scholar. Nó có thể phân tích hàng triệu bài báo khoa học để tìm ra những nghiên cứu liên quan nhất, tóm tắt nội dung chính của bài báo (TL;DR), và xác định các trích dẫn quan trọng. Nó giúp sinh viên nhanh chóng nắm bắt được bối cảnh của một lĩnh vực nghiên cứu, tiết kiệm hàng giờ đồng hồ đọc và sàng lọc tài liệu.'),
(101, 4, 280, 'image', 'images/ai-app-semantic.jpg'),
(102, 4, 290, 'heading', '10. Knowji'),
(103, 4, 300, 'paragraph', 'Knowji là một ứng dụng học từ vựng tiếng Anh thông minh, được thiết kế chuyên sâu cho việc ghi nhớ. AI của nó sẽ theo dõi tiến độ của bạn và điều chỉnh các bài học để bạn tập trung vào những từ bạn cảm thấy khó nhất hoặc hay quên nhất. Mỗi từ vựng không chỉ có định nghĩa, mà còn đi kèm với hình ảnh minh họa, câu ví dụ, và một câu chuyện ngắn hài hước (memory aids) để giúp bạn tạo liên kết cảm xúc, giúp việc học trở nên sinh động và dễ nhớ hơn rất nhiều so với cách học truyền thống.'),
(104, 4, 310, 'image', 'images/ai-app-knowji.jpg'),
(105, 4, 320, 'heading', 'Kết luận'),
(106, 4, 330, 'paragraph', 'Việc tích hợp AI vào quá trình học tập không còn là khoa học viễn tưởng. Với 10 công cụ miễn phí trên, bạn có thể tăng tốc độ học, cải thiện hiệu suất và khám phá kiến thức một cách thông minh hơn. Hãy thử nghiệm và tìm ra ứng dụng phù hợp nhất với phong cách học của bạn!');



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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `baiviet_hot`
--
ALTER TABLE `baiviet_hot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `content_blocks`
--
ALTER TABLE `content_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT cho bảng `linhvuc`
--
ALTER TABLE `linhvuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `binhluan_ibfk_1` FOREIGN KEY (`id_baiviet`) REFERENCES `baiviet` (`id`) ON DELETE CASCADE;

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
