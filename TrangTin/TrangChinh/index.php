<?php include 'config.php'; ?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tin Công Nghệ - Trang tin công nghệ hàng đầu Việt Nam</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <div class="header-top">
                <div class="logo">
                    <h1>TinCôngNghệ</h1>
                </div>
                <div class="search-box">
                    <input type="text" placeholder="Tìm kiếm tin tức...">
                    <button>Tìm kiếm</button>
                </div>
            </div>
            <nav class="main-menu">
                <ul>
                    <li><a href="#">Trang chủ</a></li>
                    <li><a href="#">Công nghệ</a></li>
                    <li><a href="#">Điện thoại</a></li>
                    <li><a href="#">Máy tính</a></li>
                    <li><a href="#">Ứng dụng</a></li>
                    <li><a href="#">Game</a></li>
                    <li><a href="#">Đánh giá</a></li>
                    <li><a href="#">Thủ thuật</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main-content">
        <div class="container">
            <!-- Featured Article -->
            <section class="featured-article">
                <article class="featured-post">
                    <img src="https://placeholder-image-service.onrender.com/image/800x400?prompt=Công nghệ AI hiện đại với robot và trí tuệ nhân tạo&id=genk-featured-1"
                        alt="Công nghệ AI hiện đại với robot và trí tuệ nhân tạo">
                    <div class="featured-content">
                        <h2>AI sẽ thay đổi hoàn toàn cách chúng ta làm việc trong 5 năm tới</h2>
                        <p>Các chuyên gia dự đoán trí tuệ nhân tạo sẽ tạo ra bước đột phá lớn trong mọi lĩnh vực, từ y
                            tế đến giáo dục và sản xuất.</p>
                        <div class="post-meta">
                            <span class="author">Minh Tuấn</span>
                            <span class="date">12 giờ trước</span>
                            <span class="comments">42 bình luận</span>
                        </div>
                    </div>
                </article>
            </section>

            <!-- Latest News -->
            <section class="latest-news">
                <h2 class="section-title">Tin mới nhất</h2>
                <div class="news-grid">
                    <?php
                    $stmt = $pdo->query("SELECT * FROM baiviet ORDER BY publish_date DESC LIMIT 4");
                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        echo '
                        <article class="news-card">
                            <img src="' . $row['image'] . '" alt="' . $row['title'] . '">
                            <div class="news-content">
                                <h3>' . $row['title'] . '</h3>
                                <p>' . substr($row['content'], 0, 100) . '...</p>
                                <div class="post-meta">
                                    <span class="date">' . date('H:i d/m', strtotime($row['publish_date'])) . ' trước</span>
                                    <span class="comments">' . $row['comments_count'] . ' bình luận</span>
                                </div>
                            </div>
                        </article>';
                    }
                    ?>
                </div>
            </section>
        </div>
    </main>

    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="container">
            <div class="sidebar-section">
                <h3>Tin hot</h3>
                <ul class="hot-news">
                    <li>
                        <span class="hot-number">1</span>
                        <a href="#">iPhone 16 sẽ có thiết kế hoàn toàn mới</a>
                    </li>
                    <li>
                        <span class="hot-number">2</span>
                        <a href="#">Windows 12 dự kiến ra mắt vào cuối năm</a>
                    </li>
                    <li>
                        <span class="hot-number">3</span>
                        <a href="#">Tesla chuẩn bị ra mắt ô tô điện giá rẻ</a>
                    </li>
                    <li>
                        <span class="hot-number">4</span>
                        <a href="#">Google thử nghiệm tính năng AI trong Gmail</a>
                    </li>
                    <li>
                        <span class="hot-number">5</span>
                        <a href="#">Meta công bố kính thực tế ảo mới</a>
                    </li>
                </ul>
            </div>

            <div class="sidebar-section">
                <h3>Đọc nhiều nhất</h3>
                <div class="popular-posts">
                    <div class="popular-post">
                        <img src="https://placeholder-image-service.onrender.com/image/100x70?prompt=Robot công nghiệp trong nhà máy&id=genk-popular-1"
                            alt="Robot công nghiệp trong nhà máy">
                        <div class="popular-content">
                            <h4>Cách robot đang thay thế con người trong sản xuất</h4>
                            <span class="views">12K lượt xem</span>
                        </div>
                    </div>
                    <div class="popular-post">
                        <img src="https://placeholder-image-service.onrender.com/image/100x70?prompt=Thiết bị điện tử thông minh trong nhà&id=genk-popular-2"
                            alt="Thiết bị điện tử thông minh trong nhà">
                        <div class="popular-content">
                            <h4>10 thiết bị smart home đáng mua nhất 2024</h4>
                            <span class="views">9.5K lượt xem</span>
                        </div>
                    </div>
                    <div class="popular-post">
                        <img src="https://placeholder-image-service.onrender.com/image/100x70?prompt=Máy ảnh kỹ thuật số chuyên nghiệp&id=genk-popular-3"
                            alt="Máy ảnh kỹ thuật số chuyên nghiệp">
                        <div class="popular-content">
                            <h4>Đánh giá Canon EOS R5: Có đáng tiền?</h4>
                            <span class="views">8.2K lượt xem</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </aside>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h4>Về chúng tôi</h4>
                    <p>TinCôngNghệ - Trang tin công nghệ hàng đầu Việt Nam, cập nhật những tin tức mới nhất về công
                        nghệ, điện tử, phần mềm và game.</p>
                </div>
                <div class="footer-section">
                    <h4>Liên kết nhanh</h4>
                    <ul>
                        <li><a href="#">Trang chủ</a></li>
                        <li><a href="#">Giới thiệu</a></li>
                        <li><a href="#">Liên hệ</a></li>
                        <li><a href="#">Chính sách bảo mật</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h4>Theo dõi chúng tôi</h4>
                    <div class="social-links">
                        <a href="#">Facebook</a>
                        <a href="#">Twitter</a>
                        <a href="#">Instagram</a>
                        <a href="#">YouTube</a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 TinCôngNghệ. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>

</html>