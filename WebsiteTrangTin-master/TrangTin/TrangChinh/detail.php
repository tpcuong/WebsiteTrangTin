<?php
include 'config.php';

// Lấy id an toàn
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
if ($id <= 0) {
    header('Location: index.php');
    exit;
}

// Lấy thông tin bài viết từ baiviet + tên danh mục
$sql = "SELECT b.id, b.tieu_de, b.mo_ta_ngan, b.hinh_anh, b.ngay_dang, d.ten_danhmuc
        FROM baiviet b
        LEFT JOIN danhmuc d ON b.id_danhmuc = d.id
        WHERE b.id = :id
        LIMIT 1";
$stmt = $pdo->prepare($sql);
$stmt->execute(['id' => $id]);
$baiviet = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$baiviet) {
    // nếu không tìm thấy bài viết, chuyển về trang chủ
    header('Location: index.php');
    exit;
}

// Lấy nội dung chi tiết từ bảng noidung (có thể nhiều đoạn)
$sql2 = "SELECT hinh_anh, noi_dung FROM noidung WHERE id_baiviet = :id ORDER BY id ASC";
$stmt2 = $pdo->prepare($sql2);
$stmt2->execute(['id' => $id]);
$noidungs = $stmt2->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title><?= htmlspecialchars($baiviet['tieu_de']) ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
    <style>
        .detail-container { max-width: 900px; margin: 24px auto; padding: 20px; }
        .detail-title { font-size: 28px; margin-bottom: 8px; }
        .detail-meta { color: #777; margin-bottom: 16px; }
        .detail-cover { width:100%; height:auto; border-radius:8px; margin-bottom:16px; object-fit:cover; }
        .detail-content { font-size:16px; line-height:1.7; color:#333; }
        .content-image { max-width:100%; height:auto; margin:12px 0; border-radius:6px; }
        .back-link { display:inline-block; margin-top:20px; color:#333; text-decoration:none; }
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
                <li><a href="index.php">Trang chủ</a></li>
                <li><a href="#">Công nghệ</a></li>
                <li><a href="#">Điện thoại</a></li>
                <li><a href="#">Máy tính</a></li>
                <li><a href="#">Ứng dụng</a></li>
                <li><a href="#">Game</a></li>
            </ul>
        </nav>
    </div>
</header>

<main>
    <div class="detail-container">
        <h1 class="detail-title"><?= htmlspecialchars($baiviet['tieu_de']) ?></h1>
        <div class="detail-meta">
            <?= htmlspecialchars($baiviet['ten_danhmuc'] ?? 'Chưa phân loại') ?> |
            <?= date('H:i d/m/Y', strtotime($baiviet['ngay_dang'])) ?>
        </div>

        <?php if (!empty($baiviet['hinh_anh'])): ?>
            <img src="<?= htmlspecialchars($baiviet['hinh_anh']) ?>" alt="<?= htmlspecialchars($baiviet['tieu_de']) ?>" class="detail-cover">
        <?php endif; ?>

        <div class="detail-content">
            <!-- Hiển thị nội dung chi tiết (bảng noidung) nếu có -->
            <?php
            if (!empty($noidungs)) {
                foreach ($noidungs as $nd) {
                    if (!empty($nd['hinh_anh'])) {
                        echo '<img src="'.htmlspecialchars($nd['hinh_anh']).'" alt="" class="content-image">';
                    }
                    if (!empty($nd['noi_dung'])) {
                        // Hiển thị an toàn: escape + nl2br
                        echo '<div>'.nl2br(htmlspecialchars($nd['noi_dung'])).'</div>';
                    }
                }
            } else {
                // Fallback: hiển thị mô tả ngắn nếu không có noidung
                echo '<div><em>'.nl2br(htmlspecialchars($baiviet['mo_ta_ngan'] ?? 'Đang cập nhật nội dung...')).'</em></div>';
            }
            ?>
        </div>

        <a href="index.php" class="back-link">← Quay lại trang chủ</a>
    </div>
</main>

<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-section">
                <h4>Về chúng tôi</h4>
                <p>TinCôngNghệ - Trang tin công nghệ, cập nhật tin tức công nghệ, phần mềm và game.</p>
            </div>
            <div class="footer-section">
                <h4>Liên kết nhanh</h4>
                <ul>
                    <li><a href="index.php">Trang chủ</a></li>
                    <li><a href="#">Giới thiệu</a></li>
                    <li><a href="#">Liên hệ</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Theo dõi chúng tôi</h4>
                <div class="social-links">
                    <a href="#">Facebook</a>
                    <a href="#">Twitter</a>
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
