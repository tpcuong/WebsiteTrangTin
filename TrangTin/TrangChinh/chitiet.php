<?php
include 'functions.php'; 

// Lấy id bài viết từ URL một cách an toàn
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
if ($id <= 0) {
    header('Location: index.php');
    exit;
}

$menu_items = getMenuItems($conn);

$sql = "SELECT b.id, b.tieu_de, b.mo_ta_ngan, b.hinh_anh, b.ngay_dang, b.id_linhvuc, l.ten_linhvuc 
        FROM baiviet b
        LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
        WHERE b.id = ?
        LIMIT 1";
$baiviet_rows = fetchAll($conn, $sql, 'i', [$id]);
$baiviet = $baiviet_rows[0] ?? null; 

if (!$baiviet) { 
    header('Location: index.php'); 
    exit; 
}
$sql_blocks = "SELECT id, block_type, block_content FROM content_blocks WHERE id_baiviet = ? ORDER BY block_order ASC";
$blocks = fetchAll($conn, $sql_blocks, 'i', [$id]);

$quick_nav_items = [];
foreach ($blocks as $index => $block) {
    if ($block['block_type'] === 'heading') {
        $quick_nav_items[] = ['title' => $block['block_content'], 'anchor' => '#section-' . $index];
    }
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($baiviet['tieu_de']) ?> | Tech-News</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="style_ct.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body <?php 
    if (isset($_SESSION['flash_message'])) {
        echo 'data-flash-message="' . htmlspecialchars($_SESSION['flash_message'], ENT_QUOTES) . '"';
        unset($_SESSION['flash_message']); 
    } 
?>>

<header class="header">
    <div class="container">
        <div class="header-top">
            <div class="logo"><h1>Tech-News</h1></div>
            <form class="search-box" action="search.php" method="GET">
                <input type="text" name="q" placeholder="Tìm kiếm tin tức...">
                <button type="submit">Tìm kiếm</button>
            </form>
        </div>
        <nav class="main-menu">
            <ul>
                <li><a href="index.php">Trang chủ</a></li>
                <?php foreach ($menu_items as $item): ?>
                    <?php 
                        $active_class = ($item['id'] == $baiviet['id_linhvuc']) ? ' class="active"' : ''; 
                    ?>
                    <li><a href="category.php?id=<?= $item['id'] ?>"<?= $active_class ?>><?= htmlspecialchars($item['ten_linhvuc']) ?></a></li>
                <?php endforeach; ?>
                <li><a href="#">Đánh giá</a></li>
                <li><a href="#">Thủ thuật</a></li>
            </ul>
        </nav>
    </div>
</header>

<main class="main-wrapper">

    <section class="post-detail">
        <a href="index.php" class="back-link">← Quay lại trang chủ</a>
        <h1 class="post-title"><?= htmlspecialchars($baiviet['tieu_de']) ?></h1>
        <div class="post-meta">
            <span class="category"><?= htmlspecialchars($baiviet['ten_linhvuc'] ?? 'Chưa phân loại') ?></span> | 
            <span class="date"><?= date("d/m/Y H:i", strtotime($baiviet['ngay_dang'])) ?></span>
        </div>

        <?php if (!empty($baiviet['hinh_anh'])): ?>
            <img src="<?= htmlspecialchars($baiviet['hinh_anh']) ?>" alt="<?= htmlspecialchars($baiviet['tieu_de']) ?>" class="post-image">
        <?php endif; ?>

        <?php if (!empty($baiviet['mo_ta_ngan'])): ?>
            <p class="excerpt"><?= nl2br(htmlspecialchars($baiviet['mo_ta_ngan'])) ?></p>
        <?php endif; ?>
        
        <?php if (!empty($quick_nav_items)): ?>
        <div class="quick-nav">
            <h3>Xem nhanh [Ẩn / Hiện]</h3>
            <ul>
                <?php foreach ($quick_nav_items as $item): ?>
                    <li><a href="<?= $item['anchor'] ?>"><?= htmlspecialchars($item['title']) ?></a></li>
                <?php endforeach; ?>
            </ul>
        </div>
        <?php endif; ?>

        <div class="post-content">
            <?php
            // (Nội dung switch case giữ nguyên)
            if (!empty($blocks)) {
                foreach ($blocks as $index => $block) {
                    $anchor_id = ($block['block_type'] === 'heading') ? 'id="section-' . $index . '"' : '';
                    switch ($block['block_type']) {
                        case 'heading':
                            echo "<h2 {$anchor_id}>" . htmlspecialchars($block['block_content']) . '</h2>';
                            break;
                        case 'paragraph':
                            echo '<p>' . nl2br(strip_tags($block['block_content'], '<strong><br><b><i><u>')) . '</p>';
                            break;
                        case 'image':
                            echo '<div class="image-block"><img src="' . htmlspecialchars($block['block_content']) . '" alt="" class="content-img"></div>';
                            break;
                        
                        case 'tip':
                            echo '<div class="tip-box">
                                <p><strong>💡 TIP:</strong> ' . nl2br(htmlspecialchars($block['block_content'])) . '</p>
                            </div>';
                            break;
                        
                        case 'chart':
                            $chartData = json_decode($block['block_content'], true);
                            $chartId = 'chart-' . $block['id'];
                            echo '
                            <div class="chart-container">
                                <h3>' . htmlspecialchars($chartData['title']) . '</h3>
                                <p>' . htmlspecialchars($chartData['subtitle']) . '</p>
                                <p><strong>' . htmlspecialchars($chartData['game']) . '</strong></p>
                                <canvas 
                                    id="' . $chartId . '" 
                                    class="js-chart" 
                                    data-labels="' . htmlspecialchars(json_encode($chartData['labels']), ENT_QUOTES, 'UTF-8') . '"
                                    data-datasets="' . htmlspecialchars(json_encode($chartData['datasets']), ENT_QUOTES, 'UTF-8') . '"
                                ></canvas>
                            </div>
                            ';
                            break;
                    }
                }
            }
            ?>
        </div>

        <?php
        // 4. Truy vấn bài viết liên quan (Giữ nguyên)
        $related_posts = [];
        if (!empty($baiviet['id_linhvuc'])) {
            $sql_related = "SELECT id, tieu_de, hinh_anh FROM baiviet 
                            WHERE id_linhvuc = ? AND id <> ? 
                            ORDER BY ngay_dang DESC LIMIT 4";
            // Dùng fetchAll cho ngắn gọn
            $related_posts = fetchAll($conn, $sql_related, 'ii', [$baiviet['id_linhvuc'], $id]);
        }
        ?>

        <?php if (!empty($related_posts)): ?>
        <div class="related-posts">
            <h2 class="section-title">Bài viết liên quan</h2>
            <div class="related-grid">
                <?php foreach ($related_posts as $post): ?>
                <div class="related-item">
                    <a href="chitiet.php?id=<?= $post['id'] ?>">
                        <img src="<?= htmlspecialchars($post['hinh_anh']) ?>" alt="<?= htmlspecialchars($post['tieu_de']) ?>" class="related-thumb">
                        <h4><?= htmlspecialchars($post['tieu_de']) ?></h4>
                    </a>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
        <?php endif; ?>

        <div class="discussion-form">
            <h2 class="section-title">Thảo luận về bài viết</h2>
            <form action="submit-comment.php" method="POST">
                <p>Bình luận của bạn sẽ được duyệt trước khi hiển thị.</p>
                <textarea name="comment_content" placeholder="Viết bình luận của bạn tại đây..." rows="6" required></textarea>
                <div class="user-info">
                    <input type="text" name="author_name" placeholder="Họ và tên (bắt buộc)" required>
                    <input type="text" name="author_phone" placeholder="Số điện thoại (không bắt buộc)">
                </div>
                <input type="hidden" name="post_id" value="<?= $id ?>">
                <button type="submit">Gửi bình luận</button>
            </form>
        </div>

    </section> 

    <aside class="right-sidebar">
        <h2 class="section-title">Bài viết khác</h2>
        <?php
        $sql_other = "SELECT id, tieu_de, hinh_anh FROM baiviet WHERE id <> ? ORDER BY ngay_dang DESC LIMIT 5";
        $other_posts = fetchAll($conn, $sql_other, 'i', [$id]);

        if ($other_posts) {
            foreach ($other_posts as $post) {
                echo '<div class="hot-item">
                        <a href="chitiet.php?id='.$post['id'].'">
                            <img src="'.htmlspecialchars($post['hinh_anh']).'" alt="'.htmlspecialchars($post['tieu_de']).'" class="hot-thumb">
                        </a>
                        <div class="hot-info">
                            <h4><a href="chitiet.php?id='.$post['id'].'">'.htmlspecialchars($post['tieu_de']).'</a></h4>
                        </div>
                    </div>';
            }
        }
        $conn->close(); // Đóng kết nối ở cuối trang
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="javascript.js"></script>

</body>
</html>