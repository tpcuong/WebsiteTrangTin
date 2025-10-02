<?php
include 'config.php'; // Sử dụng kết nối mysqli từ file này

// Lấy id bài viết từ URL một cách an toàn
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
if ($id <= 0) {
    header('Location: index.php');
    exit;
}

// 1. Truy vấn bài viết chính
$sql = "SELECT b.id, b.tieu_de, b.mo_ta_ngan, b.hinh_anh, b.ngay_dang, l.ten_linhvuc 
        FROM baiviet b
        LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
        WHERE b.id = ?
        LIMIT 1";
$stmt = $conn->prepare($sql);
if ($stmt === false) { die("Lỗi SQL: " . $conn->error); }
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$baiviet = $result->fetch_assoc();
if (!$baiviet) { header('Location: index.php'); exit; }

// 2. Truy vấn tất cả các content block của bài viết
$sql_blocks = "SELECT id, block_type, block_content FROM content_blocks WHERE id_baiviet = ? ORDER BY block_order ASC";
$stmt_blocks = $conn->prepare($sql_blocks);
$stmt_blocks->bind_param("i", $id);
$stmt_blocks->execute();
$result_blocks = $stmt_blocks->get_result();
$blocks = $result_blocks->fetch_all(MYSQLI_ASSOC);

// 3. Tạo dữ liệu cho mục lục "Xem nhanh"
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
    <style>
        .quick-nav { background: #f1f3f5; padding: 20px; border-radius: 8px; margin: 25px 0; border-left: 4px solid #ff6600; }
        .quick-nav h3 { margin: 0 0 10px; font-size: 18px; cursor: pointer; }
        .quick-nav ul { list-style: none; padding: 0; margin: 0; }
        .quick-nav ul li a { padding: 5px 0; display: block; color: #007bff; text-decoration: none; }
        .quick-nav ul li a:hover { text-decoration: underline; }

        .post-content .image-block { clear: both; margin: 30px 0; text-align: center; }
        .post-content .content-img { width: 100%; height: 450px; object-fit: cover; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        
        /* CSS CHO BIỂU ĐỒ */
        .chart-container { background-color: #f0f2f5; padding: 20px; border-radius: 8px; margin: 30px 0; }
        .chart-container h3 { font-size: 22px; margin-bottom: 5px; }
        .chart-container p { font-size: 15px; color: #555; margin-bottom: 15px; }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
            if (!empty($blocks)) {
                foreach ($blocks as $index => $block) {
                    $anchor_id = ($block['block_type'] === 'heading') ? 'id="section-' . $index . '"' : '';
                    switch ($block['block_type']) {
                        case 'heading':
                            echo "<h2 {$anchor_id}>" . htmlspecialchars($block['block_content']) . '</h2>';
                            break;
                        case 'paragraph':
						// Xóa htmlspecialchars để thẻ <strong> và <br> có thể hoạt động (tô đâm chữ)
						echo '<p>' . nl2br($block['block_content']) . '</p>';
						break;
                        case 'image':
                            echo '<div class="image-block"><img src="' . htmlspecialchars($block['block_content']) . '" alt="" class="content-img"></div>';
                            break;
						
						case 'tip':
        echo '<div class="tip-box">
                <p><strong>💡 TIP:</strong> ' . nl2br(htmlspecialchars($block['block_content'])) . '</p>
              </div>';
        break;

                        
                        // THÊM CASE MỚI ĐỂ XỬ LÝ BIỂU ĐỒ
                        case 'chart':
                            $chartData = json_decode($block['block_content'], true);
                            $chartId = 'chart-' . $block['id'];
                            echo '
                            <div class="chart-container">
                                <h3>' . htmlspecialchars($chartData['title']) . '</h3>
                                <p>' . htmlspecialchars($chartData['subtitle']) . '</p>
                                <p><strong>' . htmlspecialchars($chartData['game']) . '</strong></p>
                                <canvas id="' . $chartId . '"></canvas>
                            </div>
                            
                            <script>
                            document.addEventListener("DOMContentLoaded", function() {
                                const ctx = document.getElementById("' . $chartId . '").getContext("2d");
                                new Chart(ctx, {
                                    type: "bar",
                                    data: {
                                        labels: ' . json_encode($chartData['labels']) . ',
                                        datasets: ' . json_encode($chartData['datasets']) . '
                                    },
                                    options: {
                                        indexAxis: "y",
                                        responsive: true,
                                        plugins: { legend: { position: "top" } },
                                        scales: {
                                            x: { beginAtZero: true }
                                        }
                                    }
                                });
                            });
                            </script>
                            ';
                            break;
                    }
                }
            }
            ?>
        </div>
    </section>

    <aside class="right-sidebar">
        <h2 class="section-title">Bài viết khác</h2>
        <?php
        $sql_other = "SELECT id, tieu_de, hinh_anh FROM baiviet WHERE id <> ? ORDER BY ngay_dang DESC LIMIT 5";
        $stmt_other = $conn->prepare($sql_other);
        $stmt_other->bind_param("i", $id);
        $stmt_other->execute();
        $result_other = $stmt_other->get_result();
        $other_posts = $result_other->fetch_all(MYSQLI_ASSOC);

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
        $stmt->close();
        $stmt_blocks->close();
        $stmt_other->close();
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
<script>
$(document).ready(function(){
    // Chức năng Ẩn/Hiện mục lục
    $('.quick-nav h3').on('click', function(){ $(this).next('ul').slideToggle(); });

    // Chức năng cuộn mượt khi bấm vào link
    $('.quick-nav ul li a').on('click', function(event) {
        event.preventDefault();
        var targetId = $(this).attr('href');
        var targetElement = $(targetId);
        if (targetElement.length) {
            var headerHeight = $('.header').outerHeight() || 0;
            $('html, body').animate({ scrollTop: targetElement.offset().top - headerHeight - 15 }, 800);
        }
    });
});
</script>

</body>
</html>