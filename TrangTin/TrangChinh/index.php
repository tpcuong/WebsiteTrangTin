<?php
include 'config.php';
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tin Công Nghệ - Trang tin công nghệ hàng đầu Việt Nam</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <header class="header">
        <div class="container">
            <div class="header-top">
                <div class="logo"><h1>Tech-News</h1></div>
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

    <!-- MAIN CONTENT -->
    <main>
        <div class="main-content">
    <!-- Banner trái -->
    <div class="left-banner">
        <p>Quảng cáo</p>
        <img src="ads.jpg" alt="Banner" style="width:100%; border-radius:8px;">
    </div>

    <!-- Tin tức bên trái (2 bài / hàng) -->
    <div class="latest-news-left">
        <div class="news-card">
            <img src="thumb1.jpg" class="news-image" alt="">
            <div class="news-content">
                <div class="news-meta">Kiến tạo Đất nước - Tin ICT</div>
                <h2 class="news-title">Tiêu đề bài viết 1</h2>
                <p class="news-excerpt">Mô tả ngắn...</p>
                <div class="news-time">2 giờ trước</div>
            </div>
        </div>

        <div class="news-card">
            <img src="thumb2.jpg" class="news-image" alt="">
            <div class="news-content">
                <div class="news-meta">Trà đá công nghệ</div>
                <h2 class="news-title">Tiêu đề bài viết 2</h2>
                <p class="news-excerpt">Mô tả ngắn...</p>
                <div class="news-time">3 giờ trước</div>
            </div>
        </div>

        <!-- Thêm tin khác... -->
    </div>

    <!-- Cột phải -->
    <div class="latest-news-right">
        <div class="category-box">
            <h3>Mobile</h3>
            <div class="category-main">
                <img src="mobile1.jpg" alt="">
                <div>
                    <h4>Smartphone này có camera cực dị</h4>
                </div>
            </div>
            <div class="category-list">
                <a href="#">vivo sắp ra mắt flagship mới...</a>
                <a href="#">Apple phát hành iOS 26.1 beta...</a>
            </div>
        </div>
        
        <div class="category-box">
            <h3>AI</h3>
            <div class="category-main">
                <img src="ai1.jpg" alt="">
                <div>
                    <h4>Cloudflare: Trên không gian mạng...</h4>
                </div>
            </div>
            <div class="category-list">
                <a href="#">Chatbot AI có 'ngôn điên'?</a>
                <a href="#">FPT đầu tư chiến lược...</a>
            </div>
        </div>
    </div>
</div>

    </main>

   <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h4>Về chúng tôi</h4>
                    <p>TinCôngNghệ - Trang tin công nghệ hàng đầu Việt Nam, cập nhật những tin tức mới nhất về công nghệ, điện tử, phần mềm và game.</p>
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
                <p>&copy; <?= date('Y') ?> TinCôngNghệ. All rights reserved.</p>
            </div>
        </div>
    </footer>


</body>
</html>
