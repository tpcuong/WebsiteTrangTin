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
    <style>
        /* Layout cơ bản */
        .main-content { display: flex; gap: 20px; margin: 20px; }
        .left-banner { width: 200px; }
        .latest-news-left { flex: 2; display: flex; flex-wrap: wrap; gap: 15px; }
        .news-card { width: calc(50% - 7.5px); border: 1px solid #ddd; border-radius: 6px; overflow: hidden; }
        .news-image { width: 100%; height: 150px; object-fit: cover; }
        .news-content { padding: 10px; }
        .news-meta { font-size: 12px; color: #888; }
        .news-title { font-size: 16px; margin: 5px 0; }
        .news-excerpt { font-size: 14px; color: #555; }
        .news-time { font-size: 12px; color: #aaa; }

        .latest-news-right { flex: 1; display: flex; flex-direction: column; gap: 20px; }
        .category-box { border: 1px solid #ddd; border-radius: 6px; overflow: hidden; }
        .category-box h3 { background: #f4f4f4; margin: 0; padding: 8px; font-size: 14px; }
        .category-main { display: flex; gap: 10px; padding: 10px; }
        .category-main img { width: 80px; height: 60px; object-fit: cover; }
        .category-main h4 { font-size: 14px; margin: 0; }
    </style>
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

<main>
    <div class="main-content">
        <!-- Banner trái -->
        <div class="left-banner">
            <p>Quảng cáo</p>
            <img src="ads.jpg" alt="Banner">
        </div>

        <!-- Cột trái: bài viết mới -->
        <div class="latest-news-left">
            <?php
            $sql = "SELECT b.*, d.ten_danhmuc 
                    FROM baiviet b
                    LEFT JOIN danhmuc d ON b.id_danhmuc = d.id
                    ORDER BY b.ngay_dang DESC
                    LIMIT 6";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            $baiviets = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if ($baiviets) {
                foreach ($baiviets as $row) {
                    echo '<div class="news-card">';
						echo '<a href="detail.php?id='.$row['id'].'">';
							echo '<img src="'.$row['hinh_anh'].'" class="news-image" alt="">';
								echo '</a>';
									echo '<div class="news-content">';
										echo '<div class="news-meta">'.$row['ten_danhmuc'].'</div>';
											echo '<h2 class="news-title"><a href="detail.php?id='.$row['id'].'">'.$row['tieu_de'].'</a></h2>';
												echo '<p class="news-excerpt">'.$row['mo_ta_ngan'].'</p>';
													echo '<div class="news-time">'.date('H:i d/m/Y', strtotime($row['ngay_dang'])).'</div>';
														echo '</div></div>';

                }
            } else {
                echo "<p>Không có dữ liệu bài viết</p>";
            }
            ?>
        </div>

        <!-- Cột phải: bài hot -->
        <!-- Cột phải: bài hot -->
<div class="latest-news-right">
    <?php
    $sql_hot = "SELECT bh.vi_tri, b.id, b.tieu_de, b.hinh_anh, d.ten_danhmuc
                FROM baiviet_hot bh
                JOIN baiviet b ON bh.id_baiviet = b.id
                LEFT JOIN danhmuc d ON b.id_danhmuc = d.id
                ORDER BY bh.vi_tri ASC";
    $stmt_hot = $pdo->prepare($sql_hot);
    $stmt_hot->execute();
    $hot_news = $stmt_hot->fetchAll(PDO::FETCH_ASSOC);

    if ($hot_news) {
        foreach ($hot_news as $row) {
            echo '<div class="category-main">';
                echo '<a href="detail.php?id='.$row['id'].'">';
                    echo '<img src="'.$row['hinh_anh'].'" alt="">';
                echo '</a>';
                echo '<div>';
                    echo '<h4><a href="detail.php?id='.$row['id'].'">'.$row['tieu_de'].'</a></h4>';
                    if (!empty($row['ten_danhmuc'])) {
                        echo '<div class="news-meta">'.$row['ten_danhmuc'].'</div>';
                    }
                echo '</div>';
            echo '</div>';
        }
    } else {
        echo "<p>Không có bài hot</p>";
    }
    ?>
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
