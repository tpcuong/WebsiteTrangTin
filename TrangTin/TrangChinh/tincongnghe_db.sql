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
(115, 5, 150, 'paragraph', 'Ngoài những cái tên kể trên, tháng 9 còn chào đón nhiều tựa game indie hấp dẫn khác. Đây chắc chắn sẽ là một tháng bận rộn nhưng đầy phấn khích cho cộng đồng game thủ. Hãy chuẩn bị sẵn sàng và chọn cho mình tựa game yêu thích nhất!');










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
