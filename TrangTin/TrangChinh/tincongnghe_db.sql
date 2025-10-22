-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 16, 2025 at 03:16 AM
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
  `id` int(20) NOT NULL,
  `tieu_de` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta_ngan` text COLLATE utf8mb4_unicode_ci,
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_linhvuc` int(11) DEFAULT NULL,
  `ngay_dang` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `baiviet`
--

INSERT INTO `baiviet` (`id`, `tieu_de`, `mo_ta_ngan`, `hinh_anh`, `id_linhvuc`, `ngay_dang`) VALUES

(1, 'iPhone 17 Pro Max ra mắt', 'Apple chính thức trình làng iPhone mới với nhiều cải tiến.', 'images/ip17.png', 2, '2025-10-24 13:00:00'),

(2, 'Laptop gaming Alienware 2025', 'Alienware 2025 sở hữu CPU Intel thế hệ mới và GPU RTX 5090.', 'images/alienware2025.png', 3, '2025-10-24 12:59:50'),

(3, 'Meta ra mắt kính thực tế ảo mới', 'Kính VR của Meta mang trải nghiệm sống động hơn với cảm biến 3D tiên tiến.', 'images/meta-vr.png', 1, '2025-10-24 12:58:50'),

(4, '10 ứng dụng AI miễn phí giúp học tập', 'Danh sách các ứng dụng AI hữu ích cho sinh viên và lập trình viên.', 'images/ai-apps.png', 4, '2025-10-24 12:57:50'),

(5, 'Top game hot tháng 9', 'Tổng hợp các tựa game được chơi nhiều nhất trong tháng 9.', 'images/game-sep.png', NULL, '2025-9-24 12:36:50'),

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
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `content_blocks`
--

CREATE TABLE `content_blocks` (
  `id` int(11) NOT NULL,
  `id_baiviet` int(11) NOT NULL,
  `block_order` int(11) NOT NULL DEFAULT '0',
  `block_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `block_content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_blocks`
--

INSERT INTO `content_blocks` (`id`, `id_baiviet`, `block_order`, `block_type`, `block_content`) VALUES
-- NỘI DUNG BÀI VIẾT 1 (iPHONE)
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
(35, 1, 350, 'paragraph', 'Qua những thông tin mới nhất về iPhone 17 có gì mới trên có thể thấy iPhone 17 khẳng định sự tiến bộ của Apple trong việc kết hợp công nghệ tiên tiến với trải nghiệm người dùng thực tế. Từ iPhone Air mỏng nhẹ đến Pro Max mạnh mẽ, mỗi phiên bản đều mang đến giá trị riêng, giúp bạn dễ dàng tìm được thiết bị phù hợp.'),

-- NỘI DUNG BÀI VIẾT 2 (ALIENWARE)
(36, 2, 10,  'paragraph',  'Bạn đã sẵn sàng cho một chiếc laptop chơi game kết hợp giữa sức mạnh đáng kinh ngạc và phong cách tương lai chưa? Alienware 16 Area-51, sản phẩm chủ lực năm 2025 của Dell, là một kiệt tác dành cho game thủ và nhà sáng tạo. Được trang bị Intel Core Ultra 275HX, NVIDIA RTX 5080 và màn hình QHD 240Hz, nó được chế tạo để thống trị. Bài viết này nêu bật 10 lý do thuyết phục để bạn sở hữu nó, dựa trên bài đánh giá chi tiết trên YouTube của Mash IT và những thông tin chuyên sâu từ các nguồn công nghệ đáng tin cậy. Hãy mong đợi một bầu không khí trò chuyện, những đoạn văn ngắn, bảng so sánh và phần Hỏi & Đáp, tất cả đều được tối ưu hóa để rõ ràng và hấp dẫn. Với mức giá khoảng 3.500 bảng Anh (~ 4.500 đô la), đây là một khoản đầu tư cao cấp. Hãy cùng tìm hiểu lý do tại sao Alienware 16 Area-51 xứng đáng với từng xu!'),
(37, 2, 20,  'heading', '1. Eye-Catching Liquid Teal Design'),
(38, 2, 30,  'paragraph', 'Alienware 16 Area-51 nổi bật với lớp vỏ ngoài màu xanh ngọc lam. Lớp phủ rực rỡ này chuyển màu tinh tế dưới ánh sáng, tạo nên hiệu ứng ấn tượng. Buồng làm mát bằng kính Gorilla Glass cho thấy các quạt tản nhiệt RGB, mang đến nét hiện đại.

Các cạnh bo tròn đảm bảo sự thoải mái trong những phiên làm việc dài, thể hiện sự tập trung vào khả năng sử dụng của Dell trong năm 2025. Thiết kế cao cấp mang lại cảm giác chắc chắn, mặc dù mặt kính dễ bám dấu vân tay. Hãy luôn mang theo khăn lau để giữ vẻ ngoài sạch sẽ.'),
(39, 2, 40,  'image', NULL),
(40, 2, 50,  'paragraph', '<strong>Ưu điểm:</strong> Thiết kế độc đáo giúp máy nổi bật so với các máy tính xách tay thông thường.<br><strong>Lưu ý:</strong> Vệ sinh thường xuyên giúp máy luôn bóng bẩy.'),
(41, 2, 60, 'tip', 'Sử dụng vải sợi nhỏ để giữ cho kính luôn sáng bóng.'),
(42, 2, 70, 'heading', '2. Sức mạnh vô song với Intel Core Ultra 275HX'),
(43, 2, 80,  'paragraph', 'Cốt lõi của máy là bộ vi xử lý Intel Core Ultra 275HX 24 nhân, xung nhịp tối đa 5,4 GHz. Các bài kiểm tra Geekbench 6 cho thấy hiệu năng đơn nhân mạnh mẽ, hoàn hảo cho Windows và các ứng dụng. Các tác vụ đa nhân như render video hoạt động rất tốt, mặc dù Cinebench cho thấy nhiệt độ bị giảm xuống 105°C trong khung máy nhỏ gọn này.

Việc điều chỉnh giới hạn nhiệt độ lên 80°C thông qua phần mềm giúp máy mát hơn mà không làm giảm hiệu suất. CPU này mang lại hiệu năng tốt hơn 20% so với các chip thế hệ trước, trở thành một cỗ máy mạnh mẽ cho các tác vụ nặng.

<strong>Lý do vượt trội:</strong> Xử lý game, chỉnh sửa và đa nhiệm dễ dàng.

<strong>Mẹo:</strong> Điều chỉnh cài đặt nhiệt độ để cân bằng tối ưu.'),
(44, 2, 90, 'heading', '3. NVIDIA RTX 5080 cho đồ họa tuyệt đẹp'),
(45, 2, 100, 'paragraph', 'NVIDIA RTX 5080 với TGP 175W mang đến hình ảnh ngoạn mục. Điểm chuẩn Time Spy xác nhận nó dễ dàng xử lý các tựa game AAA như The Finals ở cài đặt tối đa. Các tính năng như Advanced Optimus, G-Sync và công tắc MUX đảm bảo trải nghiệm chơi game mượt mà, không bị xé hình.

Tuy hơi chậm hơn so với người anh em 18 inch, nhưng hiệu năng của nó vượt trội hơn hầu hết các đối thủ 16 inch. GPU này lý tưởng cho các game thủ khao khát trải nghiệm tốc độ khung hình cao và các nhà sáng tạo nội dung dựng hình 4K.

<strong>Ưu điểm:</strong> Mở khóa cài đặt siêu cao cho các trò chơi hiện đại.'),
(46, 2, 110, 'tip', 'Mẹo: Khởi động lại để kích hoạt công tắc MUX cho hiệu suất GPU tối đa.'),
(47, 2, 120, 'heading', '4. Khả năng nâng cấp trong tương lai'),
(48, 2, 130,  'paragraph', 'Những người yêu thích mày mò sẽ yêu thích cấu hình bên trong của Alienware 16. Máy có hai khe cắm DDR5 SODIMM, một SSD Gen 5 (chính) và hai khe cắm SSD Gen 4 cho dung lượng lưu trữ lớn. Pin 96Wh đảm bảo tuổi thọ pin lâu dài, tương đương với các mẫu máy lớn hơn.

Quạt tản nhiệt có thể tháo rời giúp việc vệ sinh dễ dàng hơn, một cải tiến so với người anh em 18 inch của nó. Tuy nhiên, card Wi-Fi hàn chết và bo mạch chủ đảo ngược khiến việc nâng cấp trở nên phức tạp.
'),
(49, 2, 140,  'image', NULL),
(50, 2, 150,  'tip', 'Mở rộng RAM và dung lượng lưu trữ trong nhiều năm. Hãy tìm kiếm sự trợ giúp chuyên nghiệp để dán lại nhãn nhiệt.'),
(51, 2, 160,  'heading', '5. Kết nối toàn diện'),
(52, 2, 170,  'paragraph', 'Alienware 16 Area-51 được trang bị đầy đủ các cổng kết nối: hai Thunderbolt 5, HDMI 2.1, ba USB-A, một khe cắm thẻ nhớ và một giắc cắm tai nghe. Các cổng kết nối được bố trí phía sau giúp dây cáp gọn gàng, tạo nên một không gian chơi game gọn gàng.

Việc thiếu cổng Ethernet RJ45 là một thiếu sót đáng ngạc nhiên đối với một chiếc laptop chơi game. Bộ chuyển đổi Thunderbolt sang Ethernet có thể giải quyết vấn đề này cho các kết nối có dây.'),
(53, 2, 180,  'image', NULL),
(54, 2, 190,  'paragraph', '<strong>Ưu điểm:</strong> Hỗ trợ dock, màn hình và thiết bị ngoại vi.
<strong>Giải pháp:</strong> Đầu tư vào một hub USB-C để có thêm cổng.'),
(55, 2, 200,  'tip', 'Sử dụng HDMI 2.1 cho màn hình ngoài 4K.'),

-- Mở đầu
(56, 3, 10, 'paragraph', 'Sau thành công của Meta Quest 3, cộng đồng VR đang háo hức chờ đợi thế hệ tiếp theo: Meta Quest 4. Mặc dù chưa có thông báo chính thức, các tin đồn và phân tích công nghệ đã cho chúng ta một cái nhìn sơ bộ về những gì có thể mong đợi từ chiếc kính thực tế ảo đột phá này. Hãy cùng tổng hợp tất cả những thông tin và dự đoán đáng chú ý nhất.'),

-- Ngày phát hành
(57, 3, 20, 'heading', 'Meta Quest 4: Ngày phát hành dự kiến'),
(58, 3, 30, 'paragraph', 'Meta thường tuân theo chu kỳ phát hành sản phẩm khoảng hai năm một lần. Với việc Quest 3 ra mắt vào mùa thu năm 2023, rất có thể Meta Quest 4 sẽ được trình làng vào khoảng **mùa thu năm 2025**. Giám đốc công nghệ của Meta, Andrew Bosworth, cũng đã gợi ý rằng một phiên bản kế nhiệm thực sự sẽ không xuất hiện sớm hơn 2025.'),

-- Mức giá
(59, 3, 40, 'heading', 'Meta Quest 4: Mức giá dự kiến'),
(60, 3, 50, 'paragraph', 'Quest 3 có giá khởi điểm là 499 USD, một mức giá được cho là khá cao nhưng hợp lý với công nghệ mà nó mang lại. Nhiều khả năng Meta sẽ cố gắng giữ mức giá của Quest 4 trong khoảng tương tự, có thể là từ **499 đến 599 USD**, để duy trì tính cạnh tranh và khả năng tiếp cận với người dùng phổ thông.'),

-- Hình ảnh
(61, 3, 60, 'image', 'images/meta-quest-4-concept.jpg'),

-- Các tính năng mới
(62, 3, 70, 'heading', 'Những tính năng mới nào sẽ có trên Meta Quest 4?'),
(63, 3, 80, 'paragraph', 'Quest 4 được kỳ vọng sẽ không phải là một cuộc cách mạng, mà là một sự tiến hóa vượt bậc từ Quest 3 với những cải tiến tập trung vào trải nghiệm người dùng.'),

-- Thấu kính và Màn hình
(64, 3, 90, 'heading', 'Thấu kính Pancake và Màn hình cải tiến'),
(65, 3, 100, 'paragraph', 'Thấu kính Pancake đã là một bước tiến lớn trên Quest 3, và Quest 4 chắc chắn sẽ tiếp tục cải tiến công nghệ này để mang lại hình ảnh sắc nét hơn và giảm hiện tượng quang sai. Về màn hình, chúng ta có thể mong đợi độ phân giải cao hơn nữa, có thể đạt mức 4.5K hoặc thậm chí 5K mỗi mắt, mang lại trải nghiệm hình ảnh siêu thực.'),

-- Sức mạnh
(66, 3, 110, 'heading', 'Thêm sức mạnh với chip Snapdragon mới'),
(67, 3, 120, 'paragraph', 'Quest 3 sử dụng chip Snapdragon XR2 Gen 2. Theo lẽ tự nhiên, Quest 4 sẽ được trang bị phiên bản kế nhiệm, có thể là **Snapdragon XR2 Gen 3 hoặc Gen 4**, hứa hẹn mang lại hiệu năng xử lý đồ họa mạnh mẽ hơn, hỗ trợ các tựa game phức tạp hơn và nâng cao khả năng AI.'),

-- Passthrough
(68, 3, 130, 'heading', 'Cải thiện Passthrough và Thực tế hỗn hợp (Mixed Reality)'),
(69, 3, 140, 'paragraph', 'Tính năng Passthrough (nhìn xuyên thấu) trên Quest 3 đã rất ấn tượng, nhưng vẫn còn độ trễ và nhiễu. Quest 4 được kỳ vọng sẽ giải quyết vấn đề này với các camera có độ phân giải cao hơn và vi xử lý mạnh hơn, mang lại trải nghiệm Thực tế hỗn hợp (MR) mượt mà và chân thực như nhìn bằng mắt thường.'),

-- Bộ điều khiển
(70, 3, 150, 'heading', 'Bộ điều khiển mới cho Quest 4?'),
(71, 3, 160, 'paragraph', 'Bộ điều khiển Touch Plus của Quest 3 đã loại bỏ vòng theo dõi, nhưng vẫn còn khá lớn. Có tin đồn rằng Meta đang nghiên cứu các công nghệ theo dõi tay tiên tiến hơn, có thể dẫn đến một bộ điều khiển nhỏ gọn hơn nữa hoặc thậm chí là khả năng tương tác hoàn toàn bằng tay mà không cần đến bộ điều khiển.'),

-- Kết luận
(72, 3, 170, 'heading', 'Kết luận: Quest 4 là bước tiến hợp lý'),
(73, 3, 180, 'paragraph', 'Meta Quest 4 hứa hẹn sẽ là một bản nâng cấp đáng giá, tập trung vào việc hoàn thiện những gì Quest 3 đã làm tốt: hình ảnh sắc nét hơn, hiệu năng mạnh mẽ hơn và trải nghiệm thực tế hỗn hợp liền mạch hơn. Dù phải đến 2025 chúng ta mới có thông tin chính thức, những gì được đồn đoán cũng đủ để khiến cộng đồng VR phải phấn khích.'),

-- Mở đầu
(74, 4, 10, 'paragraph', 'Trí tuệ nhân tạo (AI) đang thay đổi cách chúng ta học tập và làm việc. Ngày nay, có rất nhiều ứng dụng AI miễn phí được thiết kế đặc biệt để hỗ trợ học sinh, sinh viên và những người ham học hỏi. Dưới đây là danh sách 10 công cụ AI mạnh mẽ và hữu ích nhất mà bạn không nên bỏ qua.'),

-- 1. Socratic by Google
(75, 4, 20, 'heading', '1. Socratic by Google'),
(76, 4, 30, 'paragraph', 'Đây là một trợ lý học tập tuyệt vời do Google phát triển. Bạn chỉ cần dùng camera điện thoại để chụp ảnh một bài toán, một câu hỏi trắc nghiệm hoặc một vấn đề phức tạp, Socratic sẽ phân tích và cung cấp các tài liệu, video hướng dẫn và lời giải chi tiết từng bước. Ứng dụng này hỗ trợ hầu hết các môn học từ Toán, Lý, Hóa đến Lịch sử.'),
(77, 4, 40, 'image', 'images/ai-app-socratic.jpg'),

-- 2. Grammarly
(78, 4, 50, 'heading', '2. Grammarly'),
(79, 4, 60, 'paragraph', 'Grammarly không chỉ là một công cụ kiểm tra lỗi ngữ pháp và chính tả thông thường. Phiên bản miễn phí của nó còn giúp bạn cải thiện văn phong, gợi ý cách diễn đạt câu chữ rõ ràng và chuyên nghiệp hơn. Đây là công cụ không thể thiếu cho bất kỳ ai muốn nâng cao kỹ năng viết tiếng Anh, từ viết email đến luận văn.'),
(80, 4, 70, 'image', 'images/ai-app-grammarly.jpg'),

-- 3. Duolingo
(81, 4, 80, 'heading', '3. Duolingo'),
(82, 4, 90, 'paragraph', 'Sử dụng AI để cá nhân hóa lộ trình học, Duolingo biến việc học ngoại ngữ trở thành một trò chơi thú vị. Ứng dụng sẽ điều chỉnh độ khó của các bài tập dựa trên hiệu suất của bạn, giúp bạn củng cố kiến thức ở những điểm yếu và tiến bộ nhanh hơn. Đây là cách tuyệt vời để bắt đầu học một ngôn ngữ mới.'),

-- 4. ChatGPT & Google Gemini
(83, 4, 100, 'heading', '4. ChatGPT & Google Gemini'),
(84, 4, 110, 'paragraph', 'Hai chatbot AI hàng đầu này có thể đóng vai trò như một gia sư cá nhân. Bạn có thể đặt câu hỏi về bất kỳ chủ đề nào, yêu cầu chúng giải thích các khái niệm phức tạp, tóm tắt tài liệu dài, hoặc thậm chí là tạo ra các câu hỏi ôn tập. Phiên bản miễn phí của cả hai đều rất mạnh mẽ cho nhu cầu học tập.'),
(85, 4, 120, 'image', 'images/ai-app-chatbots.jpg'),

-- 5. Quizlet
(86, 4, 130, 'heading', '5. Quizlet'),
(87, 4, 140, 'paragraph', 'Quizlet sử dụng AI để tạo ra các bộ thẻ ghi nhớ (flashcards), bài kiểm tra và trò chơi học tập từ tài liệu của bạn. Tính năng "Learn" thông minh của nó sẽ lặp lại các câu hỏi mà bạn hay trả lời sai, giúp bạn ghi nhớ kiến thức một cách hiệu quả và lâu dài.'),

-- 6. Otter.ai
(88, 4, 150, 'heading', '6. Otter.ai'),
(89, 4, 160, 'paragraph', 'Otter.ai là một công cụ ghi âm và chuyển đổi giọng nói thành văn bản theo thời gian thực. Đối với sinh viên, đây là một cứu cánh trong các bài giảng. Nó không chỉ ghi lại lời giảng của giáo viên mà còn tự động tạo ra một bản ghi chú văn bản, giúp bạn dễ dàng xem lại và tìm kiếm thông tin quan trọng.'),

-- 7. WolframAlpha
(90, 4, 170, 'heading', '7. WolframAlpha'),
(91, 4, 180, 'paragraph', 'Được mệnh danh là "công cụ tri thức tính toán", WolframAlpha không chỉ đưa ra câu trả lời mà còn thực hiện các phép tính toán phức tạp. Nó cực kỳ mạnh mẽ trong các lĩnh vực khoa học, toán học và kỹ thuật, có thể giải phương trình, vẽ đồ thị và phân tích dữ liệu một cách trực quan.'),
(92, 4, 190, 'image', 'images/ai-app-wolfram.jpg'),

-- 8. Anki
(93, 4, 200, 'heading', '8. Anki'),
(94, 4, 210, 'paragraph', 'Anki là một ứng dụng flashcard sử dụng thuật toán lặp lại ngắt quãng (spaced repetition) do AI điều khiển. Nó sẽ tính toán thời điểm hoàn hảo để bạn ôn lại một kiến thức nào đó, ngay trước khi bạn chuẩn bị quên nó. Đây là phương pháp đã được khoa học chứng minh là cực kỳ hiệu quả để ghi nhớ lâu dài.'),

-- 9. Semantic Scholar
(95, 4, 220, 'heading', '9. Semantic Scholar'),
(96, 4, 230, 'paragraph', 'Đối với các nhà nghiên cứu và sinh viên làm luận văn, Semantic Scholar là một công cụ tìm kiếm tài liệu học thuật được hỗ trợ bởi AI. Nó có thể phân tích hàng triệu bài báo khoa học để tìm ra những nghiên cứu liên quan nhất, tóm tắt nội dung và xác định các trích dẫn quan trọng, giúp tiết kiệm hàng giờ đồng hồ tìm kiếm.'),

-- 10. Knowji
(97, 4, 240, 'heading', '10. Knowji'),
(98, 4, 250, 'paragraph', 'Knowji là một ứng dụng học từ vựng tiếng Anh thông minh. AI của nó sẽ theo dõi tiến độ của bạn và điều chỉnh các bài học để bạn tập trung vào những từ bạn cảm thấy khó nhất. Mỗi từ vựng đều đi kèm với hình ảnh, ví dụ và âm thanh, giúp việc học trở nên sinh động và dễ nhớ hơn.'),

-- Kết luận
(99, 4, 260, 'heading', 'Kết luận'),
(100, 4, 270, 'paragraph', 'Việc tích hợp AI vào quá trình học tập không còn là khoa học viễn tưởng. Với 10 công cụ miễn phí trên, bạn có thể tăng tốc độ học, cải thiện hiệu suất và khám phá kiến thức một cách thông minh hơn. Hãy thử nghiệm và tìm ra ứng dụng phù hợp nhất với phong cách học của bạn!'),

(101, 5, 10, 'paragraph', 'Tháng 9 năm 2025 hứa hẹn sẽ là một tháng bùng nổ cho game thủ PC với hàng loạt siêu phẩm được mong chờ. Từ những cuộc phiêu lưu không gian hoành tráng đến các tựa game hành động nghẹt thở, đây là thời điểm không thể tuyệt vời hơn để nâng cấp cỗ máy của bạn. Hãy cùng điểm qua những cái tên hot nhất sẽ ra mắt trong tháng này.'),

-- 1. Starlight Odyssey
(102, 5, 20, 'heading', '1. Starlight Odyssey (Ngày 5 tháng 9)'),
(103, 5, 30, 'paragraph', 'Từ nhà phát triển Nova Dynamics, Starlight Odyssey là một tựa game nhập vai hành động không gian mở. Người chơi sẽ vào vai một thuyền trưởng, khám phá các thiên hà vô tận, giao thương, chiến đấu và xây dựng đế chế của riêng mình. Với đồ họa mãn nhãn và cơ chế gameplay sâu sắc, đây được kỳ vọng là đối thủ xứng tầm của Starfield.'),
(104, 5, 40, 'image', 'images/game-starlight-odyssey.jpg'),

-- 2. Chrono Shift
(105, 5, 50, 'heading', '2. Chrono Shift (Ngày 12 tháng 9)'),
(106, 5, 60, 'paragraph', 'Chrono Shift là một tựa game giải đố-hành động độc đáo, nơi bạn có khả năng điều khiển thời gian. Người chơi phải kết hợp giữa kỹ năng chiến đấu và khả năng tua ngược, làm chậm hoặc tăng tốc thời gian để vượt qua các thử thách và kẻ thù. Lối chơi sáng tạo này hứa hẹn sẽ mang đến một làn gió mới cho thể loại game hành động.'),
(107, 5, 70, 'image', 'images/game-chrono-shift.jpg'),

-- 3. Project Chimera
(108, 5, 80, 'heading', '3. Project Chimera (Ngày 19 tháng 9)'),
(109, 5, 90, 'paragraph', 'Là một tựa game kinh dị sinh tồn góc nhìn thứ nhất, Project Chimera đưa người chơi vào một phòng thí nghiệm bỏ hoang, nơi một thí nghiệm di truyền đã thất bại thảm hại. Bạn phải lẩn trốn và chiến đấu với những sinh vật biến dị ghê rợn, đồng thời khám phá ra sự thật kinh hoàng đằng sau dự án Chimera. Game được đánh giá là có không khí rùng rợn và đồ họa chân thực.'),
(110, 5, 100, 'image', 'images/game-project-chimera.jpg'),

-- 4. Voidfall
(111, 5, 110, 'heading', '4. Voidfall (Ngày 26 tháng 9)'),
(112, 5, 120, 'paragraph', 'Voidfall là một game chiến thuật 4X (eXplore, eXpand, eXploit, eXterminate) lấy bối cảnh tương lai đen tối. Người chơi sẽ lãnh đạo một trong ba phe phái, chiến đấu để giành quyền kiểm soát tàn tích của một đế chế thiên hà đã sụp đổ. Game nổi bật với hệ thống chiến đấu sâu sắc và cây công nghệ phức tạp, đòi hỏi tư duy chiến lược cao.'),
(113, 5, 130, 'image', 'images/game-voidfall.jpg'),

-- Kết luận
(114, 5, 140, 'heading', 'Những tựa game đáng mong đợi khác'),
(115, 5, 150, 'paragraph', 'Ngoài những cái tên kể trên, tháng 9 còn chào đón nhiều tựa game indie hấp dẫn khác. Đây chắc chắn sẽ là một tháng bận rộn nhưng đầy phấn khích cho cộng đồng game thủ. Hãy chuẩn bị sẵn sàng và chọn cho mình tựa game yêu thích nhất!'),

-- NỘI DUNG BÀI VIẾT 7 (SAMSUNG GALAXY Z FOLD 7 - THEO CELLPHONES)
(116, 7, 10, 'heading', 'Samsung Galaxy Z Fold 7: Thiết kế mỏng hơn 25% và bền bỉ hơn'),
(117, 7, 20, 'paragraph', 'Samsung Galaxy Z Fold 7 đã tạo ra một cuộc cách mạng về thiết kế khi mỏng hơn tới 25% so với thế hệ trước. Khi gập lại, máy chỉ dày 8.9mm và khi mở ra là 4.2mm, cùng trọng lượng ấn tượng chỉ 215g. Để đạt được điều này, Samsung đã cải tiến hoàn toàn bản lề Armor FlexHinge, kết hợp với các vật liệu cao cấp như kính siêu mỏng (UTG), lưới Titan Grade 4 và khung nhôm Advanced Armor Aluminum, mang lại độ bền vượt trội và cảm giác cầm nắm chắc chắn.'),
(118, 7, 30, 'image', 'images/zfold7-thin-design.jpg'),
(119, 7, 40, 'heading', 'Màn hình hiển thị lớn hơn 11% cho trải nghiệm đắm chìm'),
(120, 7, 50, 'paragraph', 'Trải nghiệm hình ảnh trên Z Fold 7 được nâng lên một tầm cao mới với không gian hiển thị lớn hơn 11%. Màn hình chính Dynamic AMOLED 2X có kích thước lên tới 8.0 inch với độ phân giải QXGA+, trong khi màn hình phụ cũng là Dynamic AMOLED 2X, kích thước 6.0 inch FHD+. Cả hai màn hình đều mang lại màu sắc sống động, độ tương phản cao và hỗ trợ các tính năng đa nhiệm nâng cao như chia đôi màn hình một cách liền mạch.'),
(121, 7, 60, 'heading', 'Camera 200MP chuẩn Ultra và thuật toán AI ProVisual'),
(122, 7, 70, 'paragraph', 'Lần đầu tiên trên dòng Fold, Z Fold 7 được trang bị hệ thống camera chuẩn flagship với cảm biến chính lên tới 200MP. Hệ thống này còn bao gồm một camera góc siêu rộng 12MP và một camera tele 10MP với khả năng zoom quang học 3X. Nhờ thuật toán AI ProVisual mới, khả năng chụp đêm được cải thiện, sáng hơn 44% và bổ sung chế độ Chụp cận cảnh (Macro Mode) chuyên nghiệp, mang lại khả năng nhiếp ảnh di động toàn diện.'),
(123, 7, 80, 'image', 'images/zfold7-camera-200mp.jpg'),
(124, 7, 90, 'heading', 'Hiệu năng bùng nổ với chip Snapdragon 8 Elite for Galaxy'),
(125, 7, 100, 'paragraph', 'Cung cấp sức mạnh cho Z Fold 7 là con chip Snapdragon 8 Elite được tối ưu hóa riêng cho Galaxy. Vi xử lý này mang lại một bước nhảy vọt về hiệu năng, với CPU mạnh hơn 38%, GPU tăng 26% và đặc biệt là NPU (bộ xử lý AI) nhanh hơn 41%. Điều này không chỉ giúp các tác vụ hàng ngày mượt mà mà còn mang lại trải nghiệm chơi game và xử lý đồ họa đỉnh cao, không có độ trễ.'),
(126, 7, 110, 'heading', 'Pin 4.400mAh cùng công nghệ tối ưu năng lượng mDNle'),
(127, 7, 120, 'paragraph', 'Mặc dù có thân hình mỏng nhẹ, Z Fold 7 vẫn được trang bị viên pin dung lượng 4.400mAh. Điểm nhấn là công nghệ tối ưu hóa năng lượng mDNle độc quyền, giúp kéo dài thời gian sử dụng đáng kể. Theo Samsung, máy có thể phát nhạc liên tục lên đến 78 giờ và xem video trong 24 giờ, đáp ứng thoải mái một ngày dài sử dụng với cường độ cao.'),
(128, 7, 130, 'heading', 'Kết luận'),
(129, 7, 140, 'paragraph', 'Samsung Galaxy Z Fold 7 là một bản nâng cấp toàn diện, giải quyết được những điểm yếu của thế hệ trước và đặt ra một tiêu chuẩn mới cho điện thoại gập. Với thiết kế siêu mỏng, camera 200MP đột phá, hiệu năng đỉnh cao và thời lượng pin ấn tượng, đây thực sự là một thiết bị di động không đối thủ, dành cho những ai muốn trải nghiệm công nghệ đỉnh cao nhất.'),

-- NỘI DUNG BÀI VIẾT 6 (DELL XPS 13 9350 2025)
(130, 6, 10, 'paragraph', 'Dell XPS luôn là dòng laptop Windows cao cấp được ví như "MacBook của thế giới Windows" nhờ thiết kế tinh xảo và hiệu năng mạnh mẽ. Phiên bản Dell XPS 13 9350 (2025) tiếp tục kế thừa những di sản đó, đồng thời mang đến những nâng cấp đột phá với vi xử lý Intel Core Ultra, hứa hẹn định nghĩa lại chuẩn mực của một chiếc ultrabook hiện đại. Hãy cùng đi sâu vào đánh giá chi tiết siêu phẩm này.'),
(131, 6, 20, 'heading', 'Thiết kế tối giản và tương lai'),
(132, 6, 30, 'paragraph', 'Dell XPS 13 9350 (2025) mang một vẻ đẹp tối giản đến kinh ngạc. Toàn bộ thân máy được chế tác từ một khối nhôm CNC nguyên khối, tạo nên sự chắc chắn và liền lạc tuyệt đối. Viền màn hình InfinityEdge siêu mỏng ở cả bốn cạnh gần như biến mất, mang lại trải nghiệm hình ảnh tràn viền vô cùng ấn tượng. Dell đã loại bỏ hoàn toàn sự phân tách giữa bàn di chuột và khu vực chiếu nghỉ tay, thay vào đó là một tấm kính Gorilla Glass trải dài, bên dưới là bàn di chuột haptic vô hình, tạo nên một mặt phẳng hoàn hảo.'),
(133, 6, 40, 'image', 'images/xps-2025-design.jpg'),
(134, 6, 50, 'paragraph', 'Thay vì hàng phím chức năng (F1-F12) vật lý, Dell đã trang bị một dải phím cảm ứng điện dung, có thể chuyển đổi linh hoạt giữa các phím chức năng và các phím điều khiển media. Thiết kế này tuy gây tranh cãi nhưng lại góp phần tạo nên sự liền mạch và hiện đại cho tổng thể chiếc máy.'),
(135, 6, 60, 'heading', 'Màn hình OLED 3K+ sống động'),
(136, 6, 70, 'paragraph', 'Chất lượng hiển thị luôn là điểm mạnh của dòng XPS, và phiên bản 2025 của XPS 13 9350 cũng không ngoại lệ. Máy được trang bị tùy chọn màn hình OLED với độ phân giải lên tới 3K+ (2880 x 1800), mang lại màu đen sâu tuyệt đối và độ tương phản vô hạn. Màn hình này có độ phủ màu 100% DCI-P3, rất lý tưởng cho các nhà sáng tạo nội dung cần độ chính xác màu sắc cao. Độ sáng cao cùng công nghệ chống phản chiếu giúp việc sử dụng ngoài trời trở nên dễ dàng hơn bao giờ hết.'),
(137, 6, 80, 'image', 'images/xps-2025-display.jpg'),
(138, 6, 90, 'heading', 'Hiệu năng đột phá với Intel Core Ultra'),
(139, 6, 100, 'paragraph', 'Trái tim của Dell XPS 13 9350 (2025) là bộ vi xử lý Intel Core Ultra thế hệ mới nhất. Đây không chỉ là một bản nâng cấp về tốc độ CPU và GPU tích hợp Arc Graphics mạnh mẽ, mà còn là sự xuất hiện của NPU (Neural Processing Unit) - một bộ xử lý chuyên dụng cho các tác vụ trí tuệ nhân tạo (AI). NPU giúp máy xử lý hiệu quả các tính năng như làm mờ hậu cảnh và theo dõi khuôn mặt trong cuộc gọi video mà không tốn nhiều năng lượng.'),
(140, 6, 110, 'paragraph', 'Kết hợp với RAM LPDDR5x tốc độ cao và ổ cứng SSD NVMe Gen 4, Dell XPS 13 9350 (2025) có thể xử lý mượt mà mọi tác vụ từ văn phòng, duyệt web hàng chục tab, cho đến chỉnh sửa hình ảnh và dựng video nhẹ.'),
(141, 6, 120, 'heading', 'Bàn phím và Touchpad: Trải nghiệm khác biệt'),
(142, 6, 130, 'paragraph', 'Dell sử dụng bàn phím "zero-lattice" với các phím bấm lớn, tràn ra sát cạnh, không có khoảng cách giữa các phím. Điều này mang lại hành trình phím khá nông nhưng độ nảy tốt, cho cảm giác gõ êm và nhanh. Bàn di chuột haptic ẩn dưới lớp kính cho phản hồi rung chính xác, mô phỏng cảm giác bấm vật lý một cách đáng kinh ngạc.'),
(143, 6, 140, 'image', 'images/xps-2025-keyboard.jpg'),
(144, 6, 150, 'heading', 'Thời lượng pin và Cổng kết nối'),
(145, 6, 160, 'paragraph', 'Nhờ sự tối ưu của chip Intel Core Ultra, thời lượng pin trên XPS 13 9350 (2025) được cải thiện đáng kể, có thể đáp ứng một ngày làm việc văn phòng trọn vẹn. Tuy nhiên, để đổi lấy thiết kế siêu mỏng, Dell đã lược bỏ hầu hết các cổng kết nối truyền thống. Máy chỉ được trang bị hai cổng USB-C hỗ trợ Thunderbolt 4, đòi hỏi người dùng phải sử dụng dongle chuyển đổi.'),
(146, 6, 170, 'heading', 'Kết luận: Có đáng để đầu tư?'),
(147, 6, 180, 'paragraph', 'Dell XPS 13 9350 (2025) không phải là một chiếc laptop dành cho tất cả mọi người. Đây là một sản phẩm cao cấp, hướng đến những người dùng yêu thích sự hoàn mỹ trong thiết kế, cần một chiếc máy mỏng nhẹ nhưng vẫn đảm bảo hiệu năng mạnh mẽ. Nếu bạn sẵn sàng làm quen với những thay đổi về bàn phím và chấp nhận việc phải dùng dongle, thì đây chắc chắn là một trong những chiếc ultrabook Windows tốt nhất trên thị trường.'),

-- NỘI DUNG BÀI VIẾT 8 (AI TẠO SINH)
(148, 8, 10, 'paragraph', 'Trí tuệ nhân tạo tạo sinh (Generative AI) không còn là một khái niệm khoa học viễn tưởng mà đã trở thành một trong những làn sóng công nghệ mạnh mẽ nhất, định hình lại cách chúng ta làm việc, sáng tạo và tương tác. Từ việc tạo ra những tác phẩm nghệ thuật độc đáo đến viết code và soạn nhạc, AI tạo sinh đang mở ra những tiềm năng vô hạn. Bài viết này sẽ đi sâu vào những xu hướng phát triển chính của lĩnh vực đầy hứa hẹn này.'),
(149, 8, 20, 'heading', '1. Mô hình đa phương thức (Multimodal Models)'),
(150, 8, 30, 'paragraph', 'Xu hướng rõ ràng nhất hiện nay là sự trỗi dậy của các mô hình đa phương thức. Thay vì chỉ xử lý một loại dữ liệu duy nhất (văn bản hoặc hình ảnh), các mô hình như GPT-4 của OpenAI hay Gemini của Google có thể hiểu và tạo ra nội dung kết hợp nhiều định dạng: văn bản, hình ảnh, âm thanh và video. Người dùng có thể tải lên một bức ảnh và yêu cầu AI viết một câu chuyện về nó, hoặc mô tả một cảnh phim và để AI tạo ra một đoạn video ngắn. Khả năng này giúp AI trở nên linh hoạt và gần gũi hơn với cách con người giao tiếp tự nhiên.'),
(151, 8, 40, 'image', 'images/generative-ai-multimodal.jpg'),
(152, 8, 50, 'heading', '2. Cá nhân hóa và Tinh chỉnh (Personalization and Fine-tuning)'),
(153, 8, 60, 'paragraph', 'Các mô hình AI tạo sinh đang ngày càng trở nên dễ dàng tùy chỉnh hơn. Doanh nghiệp và người dùng cá nhân có thể "tinh chỉnh" (fine-tune) các mô hình nền tảng lớn trên bộ dữ liệu riêng của họ. Điều này cho phép tạo ra các chatbot có kiến thức chuyên sâu về một lĩnh vực cụ thể, các trợ lý ảo có thể bắt chước văn phong của một người, hoặc các công cụ thiết kế có thể tạo ra sản phẩm theo đúng phong cách thương hiệu. Xu hướng này đang biến AI từ một công cụ chung thành một trợ lý được cá nhân hóa sâu sắc.'),
(154, 8, 70, 'heading', '3. AI tự chủ và các Agent thông minh'),
(155, 8, 80, 'paragraph', 'Thế hệ tiếp theo của AI tạo sinh là các "agent" thông minh có khả năng tự chủ. Thay vì chỉ phản hồi các câu lệnh, các agent này có thể tự đặt ra mục tiêu, lập kế hoạch và thực hiện một chuỗi các hành động phức tạp để hoàn thành nhiệm vụ. Ví dụ, bạn có thể yêu cầu một AI agent "lên kế hoạch cho một chuyến đi đến Đà Lạt trong 3 ngày" và nó sẽ tự động tìm kiếm chuyến bay, đặt khách sạn, lên lịch trình tham quan và thậm chí đặt bàn nhà hàng. Đây là bước tiến lớn hướng tới một AI thực sự có khả năng hành động trong thế giới thực.'),
(156, 8, 90, 'image', 'images/generative-ai-agents.jpg'),
(157, 8, 100, 'heading', '4. Tích hợp sâu vào ứng dụng và quy trình làm việc'),
(158, 8, 110, 'paragraph', 'AI tạo sinh đang dần trở nên vô hình, được tích hợp liền mạch vào các công cụ mà chúng ta sử dụng hàng ngày. Microsoft Copilot trong bộ Office, Adobe Firefly trong Photoshop, hay các tính năng AI trong các nền tảng lập trình là những ví dụ điển hình. Thay vì phải truy cập một ứng dụng AI riêng biệt, người dùng có thể sử dụng sức mạnh của nó ngay trong quy trình làm việc của mình, giúp tăng năng suất và khơi nguồn sáng tạo một cách tự nhiên.'),
(159, 8, 120, 'heading', '5. Tập trung vào An toàn, Đạo đức và Trách nhiệm'),
(160, 8, 130, 'paragraph', 'Cùng với sự phát triển nhanh chóng, các vấn đề về đạo đức và an toàn của AI tạo sinh cũng ngày càng được quan tâm. Các nhà phát triển đang nỗ lực xây dựng các cơ chế để giảm thiểu việc tạo ra thông tin sai lệch (hallucination), ngăn chặn việc lạm dụng AI cho mục đích xấu, và đảm bảo tính minh bạch về nguồn gốc dữ liệu. Việc phát triển các "hàng rào bảo vệ" (guardrails) và các tiêu chuẩn về AI có trách nhiệm là một xu hướng tất yếu để công nghệ này có thể phát triển bền vững.'),
(161, 8, 140, 'heading', 'Kết luận'),
(162, 8, 150, 'paragraph', 'Trí tuệ nhân tạo tạo sinh đang ở trong giai đoạn phát triển bùng nổ. Với các mô hình ngày càng thông minh, linh hoạt và được cá nhân hóa, công nghệ này hứa hẹn sẽ không chỉ là một công cụ hỗ trợ mà còn là một đối tác sáng tạo thực thụ, thay đổi sâu sắc mọi khía cạnh của cuộc sống và công việc trong tương lai gần.'),

-- NỘI DUNG BÀI VIẾT 9 (ỨNG DỤNG QUẢN LÝ CÔNG VIỆC)
(163, 9, 10, 'paragraph', 'Trong môi trường làm việc hiện đại, việc theo dõi và quản lý công việc một cách hiệu quả là chìa khóa để tăng năng suất cho cả cá nhân và đội nhóm. May mắn là có rất nhiều ứng dụng mạnh mẽ được thiết kế để giúp chúng ta sắp xếp mọi thứ ngăn nắp. Dưới đây là danh sách 5 ứng dụng quản lý công việc được đánh giá cao và sử dụng rộng rãi nhất hiện nay.'),
(164, 9, 20, 'heading', '1. Trello: Trực quan và Linh hoạt'),
(165, 9, 30, 'paragraph', 'Trello nổi tiếng với giao diện kéo-thả trực quan dựa trên phương pháp Kanban. Bạn có thể tạo các "bảng" (boards) cho mỗi dự án, trong đó có các "danh sách" (lists) đại diện cho các giai đoạn công việc (ví dụ: Cần làm, Đang làm, Đã xong). Mỗi công việc là một "thẻ" (card) mà bạn có thể di chuyển qua lại giữa các danh sách. Trello cực kỳ phù-hợp cho các đội nhóm nhỏ, các dự án cá nhân và những ai yêu thích sự đơn giản, trực quan.'),
(166, 9, 40, 'image', 'images/app-trello-interface.jpg'),
(167, 9, 50, 'heading', '2. Asana: Quản lý dự án toàn diện'),
(168, 9, 60, 'paragraph', 'Asana là một công cụ mạnh mẽ hơn, được thiết kế cho việc quản lý dự án phức tạp với nhiều thành viên và các công việc phụ thuộc lẫn nhau. Ngoài chế độ xem bảng Kanban, Asana còn cung cấp các chế độ xem dạng danh sách, lịch và biểu đồ Gantt (timeline), giúp người quản lý có cái nhìn tổng quan về tiến độ dự án. Đây là lựa chọn lý tưởng cho các doanh nghiệp cần một giải pháp quản lý công việc bài bản và có cấu trúc.'),
(169, 9, 70, 'image', 'images/app-asana-dashboard.jpg'),
(170, 9, 80, 'heading', '3. Monday.com: Tùy biến và Tự động hóa'),
(171, 9, 90, 'paragraph', 'Điểm mạnh nhất của Monday.com là khả năng tùy biến cực kỳ cao và hệ thống tự động hóa mạnh mẽ. Bạn có thể xây dựng quy trình làm việc (workflow) cho gần như mọi loại hình phòng ban, từ marketing, kinh doanh đến nhân sự. Monday.com cho phép bạn tự động hóa các tác vụ lặp đi lặp lại, ví dụ như tự động gán việc cho người mới khi một công việc được hoàn thành, giúp tiết kiệm thời gian và giảm thiểu sai sót.'),
(172, 9, 100, 'image', 'images/app-monday-automation.jpg'),
(173, 9, 110, 'heading', '4. Todoist: Tối giản cho cá nhân'),
(174, 9, 120, 'paragraph', 'Nếu bạn đang tìm kiếm một ứng dụng quản lý công việc cá nhân đơn giản nhưng hiệu quả, Todoist là lựa chọn hàng đầu. Giao diện của Todoist sạch sẽ, tập trung vào việc tạo danh sách việc cần làm (to-do list) một cách nhanh chóng. Điểm đặc biệt của nó là khả năng nhận dạng ngôn ngữ tự nhiên, bạn chỉ cần gõ "Nộp báo cáo vào thứ Sáu tuần sau" và ứng dụng sẽ tự động tạo một nhiệm vụ với ngày hết hạn chính xác. Todoist hoàn hảo cho việc quản lý các mục tiêu và thói quen hàng ngày.'),
(175, 9, 130, 'image', 'images/app-todoist-simple.jpg'),
(176, 9, 140, 'heading', '5. Notion: Không gian làm việc tất-cả-trong-một'),
(177, 9, 150, 'paragraph', 'Notion không chỉ là một ứng dụng quản lý công việc, nó là một "không gian làm việc" (workspace) nơi bạn có thể kết hợp ghi chú, cơ sở dữ liệu, bảng Kanban, lịch và nhiều hơn nữa. Sự linh hoạt của Notion là vô tận, cho phép bạn xây dựng một hệ thống quản lý kiến thức và công việc của riêng mình từ con số không. Mặc dù cần một chút thời gian để làm quen, nhưng Notion là công cụ tối thượng cho những ai muốn tích hợp mọi thứ vào một nơi duy nhất.'),
(178, 9, 160, 'image', 'images/app-notion-workspace.jpg'),
(179, 9, 170, 'heading', 'Kết luận'),
(180, 9, 180, 'paragraph', 'Mỗi ứng dụng đều có điểm mạnh riêng và phù hợp với những nhu cầu khác nhau. Trello và Todoist tuyệt vời cho sự đơn giản và cá nhân, trong khi Asana và Monday.com mạnh mẽ hơn cho quản lý đội nhóm. Notion là lựa chọn linh hoạt nhất cho những ai muốn xây dựng một hệ thống riêng. Hãy thử nghiệm và chọn ra công cụ phù hợp nhất để giúp bạn làm việc hiệu quả hơn.'),

-- NỘI DUNG BÀI VIẾT 10 (GOOGLE PIXEL 9)
(181, 10, 10, 'paragraph', 'Dòng Google Pixel luôn nổi bật nhờ khả năng nhiếp ảnh điện toán đỉnh cao và trải nghiệm Android thuần túy, thông minh. Năm nay, Google Pixel 9 tiếp tục đẩy mạnh những thế mạnh đó với chip Tensor G5 hoàn toàn mới và những tính năng AI độc quyền, hứa hẹn mang lại một chiếc smartphone thông minh hơn bao giờ hết.'),
(182, 10, 20, 'heading', '1. Thiết kế phẳng và cụm camera "Pixel Bar" mới'),
(183, 10, 30, 'paragraph', 'Pixel 9 đánh dấu một sự thay đổi lớn về ngôn ngữ thiết kế. Google đã từ bỏ các cạnh bo tròn mềm mại để chuyển sang một khung viền phẳng, vuông vức hơn, mang lại cảm giác cầm nắm chắc chắn và hiện đại. Điểm nhấn lớn nhất là cụm camera "Pixel Bar" không còn trải dài hết mặt lưng mà được thu gọn thành một dải hình viên thuốc nổi bật, tạo nên một diện mạo mới mẻ và độc đáo cho dòng sản phẩm.'),
(184, 10, 40, 'image', 'images/pixel9-design.jpg'),
(185, 10, 50, 'heading', '2. Chip Tensor G5 và cuộc cách mạng AI trên di động'),
(186, 10, 60, 'paragraph', 'Trái tim của Pixel 9 là vi xử lý Google Tensor G5, được xây dựng để tối ưu cho các tác vụ máy học. Con chip này không chỉ mang lại hiệu năng mạnh mẽ cho các tác vụ hàng ngày mà còn mở khóa hàng loạt tính năng AI thế hệ mới. Trợ lý Google Assistant trở nên thông minh và tự nhiên hơn, có khả năng xử lý các yêu cầu phức tạp ngay trên thiết bị mà không cần kết nối mạng. Các tính năng như tóm tắt cuộc họp, dịch thuật theo thời gian thực và tạo hình nền bằng AI đều được nâng lên một tầm cao mới.'),
(187, 10, 70, 'heading', '3. Camera thông minh hơn với "Magic Editor 2.0"'),
(188, 10, 80, 'paragraph', 'Google tiếp tục khẳng định vị thế dẫn đầu về nhiếp ảnh di động. Mặc dù phần cứng camera không có những bước nhảy vọt về "số chấm", nhưng sức mạnh thực sự nằm ở phần mềm. Pixel 9 giới thiệu "Magic Editor 2.0", một phiên bản nâng cấp của công cụ chỉnh sửa ảnh AI. Giờ đây, bạn không chỉ có thể xóa vật thể mà còn có thể di chuyển, thay đổi kích thước và thậm chí là tái tạo lại các phần của bức ảnh một cách tự nhiên đến kinh ngạc. Chế độ chụp đêm và khả năng zoom điện toán cũng được cải thiện đáng kể nhờ sức mạnh của Tensor G5.'),
(189, 10, 90, 'image', 'images/pixel9-magic-editor.jpg'),
(190, 10, 100, 'heading', '4. Màn hình "Actua Display" siêu sáng'),
(191, 10, 110, 'paragraph', 'Pixel 9 được trang bị màn hình OLED mà Google gọi là "Actua Display". Tấm nền này có tần số quét 120Hz mượt mà và đặc biệt là độ sáng tối đa cực cao, có thể lên tới 2000 nits, giúp hiển thị nội dung rõ nét ngay cả dưới trời nắng gắt. Màu sắc được cân chỉnh trung thực, mang lại trải nghiệm xem phim và hình ảnh tuyệt vời.'),
(192, 10, 120, 'heading', 'Kết luận'),
(193, 10, 130, 'paragraph', 'Google Pixel 9 không chạy đua về cấu hình phần cứng khủng mà tập trung vào việc tạo ra một trải nghiệm người dùng thông minh và liền mạch. Với thiết kế mới lạ, hiệu năng AI vượt trội và hệ thống camera được tinh chỉnh đến mức hoàn hảo, đây là lựa chọn lý tưởng cho những ai yêu thích hệ điều hành Android thuần túy và muốn sở hữu một "trợ lý ảo" thực thụ trong túi quần.'),

-- NỘI DUNG BÀI VIẾT 12 (MẠNG 6G)
(194, 11, 10, 'paragraph', 'Trong khi mạng 5G vẫn đang trong giai đoạn triển khai rộng rãi, các nhà nghiên cứu trên khắp thế giới đã bắt đầu đặt nền móng cho thế hệ tiếp theo: mạng 6G. Không chỉ là một bản nâng cấp về tốc độ, 6G hứa hẹn sẽ tạo ra một cuộc cách mạng thực sự, kết nối thế giới vật lý, kỹ thuật số và sinh học làm một. Hãy cùng khám phá tương lai của mạng 6G và những ứng dụng đáng kinh ngạc mà nó có thể mang lại.'),
(195, 11, 20, 'heading', '1. Tốc độ Terabit và Độ trễ gần như bằng không'),
(196, 11, 30, 'paragraph', 'Nếu 5G nói về tốc độ gigabit mỗi giây (Gbps), thì 6G hướng tới tốc độ terabit mỗi giây (Tbps), nhanh hơn gấp 100 lần. Quan trọng hơn, độ trễ của mạng 6G được kỳ vọng sẽ giảm xuống mức micro giây (μs), gần như tức thời. Điều này sẽ cho phép các tương tác trong thời gian thực trở nên hoàn hảo, từ các cuộc gọi video голографічного (holographic) cho đến việc điều khiển robot phẫu thuật từ xa với độ chính xác tuyệt đối.'),
(197, 11, 40, 'image', 'images/6g-speed-concept.jpg'),
(198, 11, 50, 'heading', '2. Tích hợp Mạng lưới không gian và mặt đất'),
(199, 11, 60, 'paragraph', 'Một trong những tầm nhìn lớn nhất của 6G là tạo ra một mạng lưới ba chiều, tích hợp liền mạch giữa các trạm phát sóng mặt đất, các vật thể bay không người lái và các vệ tinh quỹ đạo thấp (LEO). Điều này sẽ mang lại vùng phủ sóng toàn cầu thực sự, cung cấp kết nối tốc độ cao đến cả những vùng sâu vùng xa, hải đảo hay trên các chuyến bay, xóa bỏ mọi rào cản về không gian địa lý.'),
(200, 11, 70, 'heading', '3. Giao tiếp Holographic và Internet của các giác quan'),
(201, 11, 80, 'paragraph', 'Với băng thông khổng lồ và độ trễ siêu thấp, 6G sẽ biến giao tiếp голографічного (holographic) từ khoa học viễn tưởng thành hiện thực. Bạn có thể "gặp gỡ" và tương tác với hình ảnh 3D của người khác trong thời gian thực. Xa hơn nữa là khái niệm "Internet của các giác quan" (Internet of Senses), nơi chúng ta có thể truyền tải không chỉ hình ảnh, âm thanh mà còn cả xúc giác, vị giác và khứu giác qua mạng, tạo ra những trải nghiệm thực tế ảo (VR) và tăng cường (AR) sống động chưa từng có.'),
(202, 11, 90, 'image', 'images/6g-holographic-communication.jpg'),
(203, 11, 100, 'heading', '4. Xe tự hành và Giao thông thông minh'),
(204, 11, 110, 'paragraph', '6G sẽ là yếu tố then chốt để xe tự hành cấp độ 5 (hoàn toàn tự động) trở nên phổ biến. Mạng lưới cho phép hàng triệu phương tiện giao tiếp với nhau và với cơ sở hạ tầng (V2X - Vehicle-to-Everything) gần như tức thời, chia sẻ dữ liệu về tình trạng giao thông, chướng ngại vật và điều kiện thời tiết. Điều này giúp tối ưu hóa luồng giao thông, giảm thiểu tai nạn và tắc nghẽn một cách hiệu quả.'),
(205, 11, 120, 'heading', 'Kết luận'),
(206, 11, 130, 'paragraph', 'Tương lai của mạng 6G không chỉ là về việc lướt web nhanh hơn. Đó là về việc tạo ra một thế giới thông minh hơn, kết nối sâu sắc hơn, nơi ranh giới giữa thực và ảo dần bị xóa nhòa. Dù còn nhiều thách thức phía trước, những ứng dụng tiềm năng của 6G chắc chắn sẽ thay đổi cách chúng ta sống, làm việc và giải trí một cách sâu sắc.'),

-- NỘI DUNG BÀI VIẾT 15 (MICROSOFT SURFACE PRO 11)
(207, 12, 10, 'paragraph', 'Dòng Surface Pro của Microsoft luôn là tiên phong trong việc xóa nhòa ranh giới giữa laptop và máy tính bảng. Với Surface Pro 11, Microsoft đã thực hiện một bước nhảy vọt táo bạo bằng việc trang bị chip ARM Snapdragon X Elite, hứa hẹn một kỷ nguyên mới về hiệu năng, tính di động và thời lượng pin vượt trội cho các thiết bị Windows.'),
(208, 12, 20, 'heading', '1. Cuộc cách mạng hiệu năng với chip ARM'),
(209, 12, 30, 'paragraph', 'Điểm nhấn lớn nhất trên Surface Pro 11 chính là sự từ bỏ kiến trúc x86 truyền thống để chuyển sang chip Snapdragon X Elite dựa trên ARM. Đây không chỉ là một thay đổi đơn thuần, mà là một cuộc cách mạng. Con chip này mang lại hiệu năng đa luồng cực kỳ mạnh mẽ, có thể cạnh tranh sòng phẳng với các chip Core Ultra của Intel, trong khi tiêu thụ điện năng ít hơn đáng kể. Bộ xử lý thần kinh (NPU) tích hợp cũng tăng tốc vượt trội cho các tác vụ AI, mở đường cho các tính năng Copilot+ PC độc quyền.'),
(210, 12, 40, 'image', 'images/surface-pro-11-arm-chip.jpg'),
(211, 12, 50, 'heading', '2. Thời lượng pin kéo dài nhiều ngày'),
(212, 12, 60, 'paragraph', 'Ưu điểm lớn nhất của kiến trúc ARM chính là hiệu quả năng lượng. Surface Pro 11 đã biến điều này thành hiện thực với thời lượng pin đáng kinh ngạc. Trong các tác vụ thông thường như duyệt web, làm việc văn phòng và xem video, máy có thể hoạt động liên tục lên tới 18-20 giờ. Điều này có nghĩa là bạn có thể tự tin rời nhà mà không cần mang theo bộ sạc, thậm chí sử dụng qua hai ngày làm việc chỉ với một lần sạc đầy.'),
(213, 12, 70, 'heading', '3. Thiết kế di động tinh túy'),
(214, 12, 80, 'paragraph', 'Surface Pro 11 vẫn giữ nguyên DNA thiết kế đã làm nên thương hiệu: một thiết bị siêu mỏng nhẹ, được hoàn thiện từ hợp kim magie cao cấp, đi kèm chân đế kickstand linh hoạt có thể điều chỉnh ở mọi góc độ. Khi kết hợp với bàn phím Surface Pro Flex Keyboard mới (có thể sử dụng không dây), nó ngay lập tức biến thành một chiếc laptop siêu di động, sẵn sàng cho mọi công việc.'),
(215, 12, 90, 'image', 'images/surface-pro-11-kickstand.jpg'),
(216, 12, 100, 'heading', '4. Màn hình OLED và Trải nghiệm Windows on ARM'),
(217, 12, 110, 'paragraph', 'Lần đầu tiên, Surface Pro được trang bị tùy chọn màn hình OLED cảm ứng, mang lại màu đen sâu tuyệt đối, độ tương phản vô hạn và màu sắc sống động rực rỡ. Về phần mềm, trải nghiệm Windows 11 trên nền tảng ARM đã được cải thiện vượt bậc. Trình giả lập Prism mạnh mẽ giúp chạy mượt mà hầu hết các ứng dụng x86 cũ, trong khi ngày càng có nhiều ứng dụng được xây dựng gốc cho ARM để phát huy tối đa hiệu năng.'),
(218, 12, 120, 'heading', 'Kết luận'),
(219, 12, 130, 'paragraph', 'Microsoft Surface Pro 11 không chỉ là một bản cập nhật, nó là một tuyên ngôn về tương lai của máy tính cá nhân. Bằng cách kết hợp sức mạnh và hiệu quả của chip ARM với thiết kế lai linh hoạt, Microsoft đã tạo ra một thiết bị "tất-cả-trong-một" gần như hoàn hảo, đáp ứng nhu cầu của những người dùng năng động, cần một cỗ máy mạnh mẽ với thời lượng pin không đối thủ.');

-- --------------------------------------------------------

--
-- Table structure for table `linhvuc`
--

CREATE TABLE `linhvuc` (
  `id` int(11) NOT NULL,
  `ten_linhvuc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta` text COLLATE utf8mb4_unicode_ci,
  `ngay_tao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `linhvuc`
--

INSERT INTO `linhvuc` (`id`, `ten_linhvuc`, `mo_ta`, `ngay_tao`) VALUES
(1, 'Công nghệ', 'Tin tức và xu hướng công nghệ', '2025-09-24 12:36:50'),
(2, 'Điện thoại', 'Các sản phẩm smartphone mới nhất', '2025-09-24 12:36:50'),
(3, 'Máy tính', 'Laptop, PC, phần cứng và phần mềm', '2025-09-24 12:36:50'),
(4, 'Ứng dụng', 'App di động và phần mềm hữu ích', '2025-09-24 12:36:50');

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
(1, 1, NULL, 'Chi tiết iPhone 17 Pro Max: Chip A19, camera nâng cấp, hỗ trợ sạc nhanh.'),
(2, 2, NULL, 'Alienware 2025: CPU Intel Gen mới, GPU RTX 5090, màn hình 240Hz.'),
(3, 3, NULL, 'Meta VR 2025: Kính thực tế ảo với cảm biến 3D, hỗ trợ nhiều ứng dụng.'),
(4, 4, NULL, 'Top 10 ứng dụng AI miễn phí giúp học tập, lập trình và nghiên cứu hiệu quả.'),
(5, 5, NULL, 'Danh sách game hot tháng 9 cùng đánh giá chi tiết.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_linhvuc` (`id_linhvuc`);

--
-- Indexes for table `baiviet_hot`
--
ALTER TABLE `baiviet_hot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_baiviet` (`id_baiviet`);

--
-- Indexes for table `content_blocks`
--
ALTER TABLE `content_blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_baiviet` (`id_baiviet`);

--
-- Indexes for table `linhvuc`
--
ALTER TABLE `linhvuc`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `baiviet_hot`
--
ALTER TABLE `baiviet_hot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `content_blocks`
--
ALTER TABLE `content_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `linhvuc`
--
ALTER TABLE `linhvuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `baiviet_ibfk_1` FOREIGN KEY (`id_linhvuc`) REFERENCES `linhvuc` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `baiviet_hot`
--
ALTER TABLE `baiviet_hot`
  ADD CONSTRAINT `baiviet_hot_ibfk_1` FOREIGN KEY (`id_baiviet`) REFERENCES `baiviet` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `content_blocks`
--
ALTER TABLE `content_blocks`
  ADD CONSTRAINT `content_blocks_ibfk_1` FOREIGN KEY (`id_baiviet`) REFERENCES `baiviet` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `noidung`
--
ALTER TABLE `noidung`
  ADD CONSTRAINT `noidung_ibfk_1` FOREIGN KEY (`id_baiviet`) REFERENCES `baiviet` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
