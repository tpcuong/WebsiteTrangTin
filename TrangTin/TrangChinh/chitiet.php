<?php
include 'config.php';

// Lấy id bài viết từ URL
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
if ($id <= 0) {
    die("Bài viết không hợp lệ");
}

// Truy vấn bài viết + lĩnh vực
$sql = "SELECT b.id, b.tieu_de, b.mo_ta_ngan, b.hinh_anh, b.ngay_dang, l.ten_linhvuc 
        FROM baiviet b
        LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
        WHERE b.id = $id";
$result = $conn->query($sql);

if (!$result || $result->num_rows == 0) {
    die("Không tìm thấy bài viết");
}

$row = $result->fetch_assoc();

// Truy vấn nội dung chi tiết từ bảng noidung
$sql_noidung = "SELECT hinh_anh, noi_dung 
                FROM noidung 
                WHERE id_baiviet = $id 
                ORDER BY id ASC";
$res_noidung = $conn->query($sql_noidung);
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($row['tieu_de']) ?> | Tech-News</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="style_ct.css">
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
                <li><a href="index.php">Trang chủ</a></li>
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

<main class="main-wrapper">
    <!-- Nội dung bài viết -->
    <section class="post-detail">
        <a href="index.php" class="back-link">← Quay lại trang chủ</a>
        <h1 class="post-title"><?= htmlspecialchars($row['tieu_de']) ?></h1>
        <div class="post-meta">
            <span class="category"><?= htmlspecialchars($row['ten_linhvuc']) ?></span> | 
            <span class="date"><?= date("d/m/Y H:i", strtotime($row['ngay_dang'])) ?></span>
        </div>

        <?php if (!empty($row['hinh_anh'])): ?>
            <img src="<?= htmlspecialchars($row['hinh_anh']) ?>" 
                 alt="<?= htmlspecialchars($row['tieu_de']) ?>" 
                 class="post-image">
        <?php endif; ?>

        <?php if (!empty($row['mo_ta_ngan'])): ?>
            <p class="excerpt"><?= nl2br(htmlspecialchars($row['mo_ta_ngan'])) ?></p>
        <?php endif; ?>

        <div class="post-content">
            <?php 
            if ($res_noidung && $res_noidung->num_rows > 0) {
                while ($nd = $res_noidung->fetch_assoc()) {
                    echo "<p>".nl2br(htmlspecialchars($nd['noi_dung']))."</p>";
                    if (!empty($nd['hinh_anh'])) {
                        echo "<img src='".htmlspecialchars($nd['hinh_anh'])."' alt='' class='content-img'>";
                    }
                }
            }
            ?>
        </div>
    </section>

    <!-- Sidebar bên phải -->
    <aside class="right-sidebar">
        <h2 class="section-title">Bài viết khác</h2>
        <?php
        $sql2 = "SELECT id, tieu_de, hinh_anh 
                 FROM baiviet 
                 WHERE id <> $id 
                 ORDER BY ngay_dang DESC 
                 LIMIT 5";
        $res2 = $conn->query($sql2);

        if ($res2 && $res2->num_rows > 0) {
            while ($r = $res2->fetch_assoc()) {
                echo '<div class="hot-item">
                        <a href="chitiet.php?id='.$r['id'].'">
                          <img src="'.$r['hinh_anh'].'" alt="'.$r['tieu_de'].'" class="hot-thumb">
                        </a>
                        <div class="hot-info">
                          <h4><a href="chitiet.php?id='.$r['id'].'">'.$r['tieu_de'].'</a></h4>
                        </div>
                      </div>';
            }
        }
        ?>
    </aside>
</main>

<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-section">
                <h4>Về chúng tôi</h4>
                <p>TinCôngNghệ - Trang tin công nghệ hàng đầu Việt Nam.</p>
            </div>
            <div class="footer-section">
                <h4>Liên kết nhanh</h4>
                <ul>
                    <li><a href="index.php">Trang chủ</a></li>
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
