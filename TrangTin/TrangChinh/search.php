<?php
<<<<<<< HEAD
include 'config.php';

function renderNewsCard(array $post, string $class = ''): string {
    $id = (int)$post['id'];
    $title = htmlspecialchars($post['tieu_de']);
    $excerpt = htmlspecialchars($post['mo_ta_ngan']);
    $image = htmlspecialchars($post['hinh_anh']);
    $category = htmlspecialchars($post['ten_linhvuc'] ?? 'Chưa phân loại');
    $class = $class ? ' ' . $class : '';

    return <<<HTML
    <article class="news-card{$class}">
        <a href="chitiet.php?id={$id}">
            <img src="{$image}" alt="{$title}">
        </a>
        <div class="news-info">
            <span class="news-meta">{$category}</span>
            <h3 class="news-title"><a href="chitiet.php?id={$id}">{$title}</a></h3>
            <p class="news-excerpt">{$excerpt}</p>
        </div>
    </article>
HTML;
}

/**
 * Hàm truy vấn dữ liệu ngắn gọn.
 */
function fetchAll(mysqli $conn, string $sql, string $types = '', array $params = []): array {
    $stmt = $conn->prepare($sql);
    if ($types && $params) $stmt->bind_param($types, ...$params);
    $stmt->execute();
    $result = $stmt->get_result();
    return $result ? $result->fetch_all(MYSQLI_ASSOC) : [];
}

$menu_items = fetchAll($conn, "SELECT id, ten_linhvuc FROM linhvuc ORDER BY id ASC LIMIT 5");


$menu_items = fetchAll($conn, "SELECT id, ten_linhvuc FROM linhvuc ORDER BY id ASC LIMIT 5");

$sidebar_posts = fetchAll($conn, "
    SELECT b.id, b.tieu_de, b.hinh_anh, l.ten_linhvuc
    FROM baiviet b
    LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
    ORDER BY b.ngay_dang DESC
    LIMIT 5
");
// ===================================

// --- LOGIC TÌM KIẾM ---
$query = '';

if (isset($_GET['q']) && !empty(trim($_GET['q']))) {
    $query = trim($_GET['q']);

    $search_term = "%{$query}%";
=======
include 'functions.php'; 

$query = '';
$results = [];
$total_results = 0;

if (isset($_GET['q']) && !empty(trim($_GET['q']))) {
    $query = trim($_GET['q']);
    $search_term = "%{$query}%";

>>>>>>> 97656b2 (Fix Code and update admin)
    $sql = "
        SELECT b.id, b.tieu_de, b.mo_ta_ngan, b.hinh_anh, l.ten_linhvuc
        FROM baiviet b
        LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
        WHERE b.tieu_de LIKE ? OR b.mo_ta_ngan LIKE ?
        ORDER BY b.ngay_dang DESC
    ";
    
<<<<<<< HEAD
    // 'ss' nghĩa là 2 tham số đều là string
    $results = fetchAll($conn, $sql, 'ss', [$search_term, $search_term]);
    $total_results = count($results);
}
=======
    $results = fetchAll($conn, $sql, 'ss', [$search_term, $search_term]);
    $total_results = count($results);
}

$menu_items = getMenuItems($conn);
$sidebar_posts = fetchAll($conn, "
    SELECT b.id, b.tieu_de, b.hinh_anh, l.ten_linhvuc
    FROM baiviet b
    LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
    ORDER BY b.ngay_dang DESC
    LIMIT 5
");
>>>>>>> 97656b2 (Fix Code and update admin)
?>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Kết quả tìm kiếm cho "<?= htmlspecialchars($query) ?>" | Tech-News</title>
  
<<<<<<< HEAD
=======
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  
>>>>>>> 97656b2 (Fix Code and update admin)
  <link rel="stylesheet" href="style.css"> 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<header class="header">
  <div class="container">
    <div class="header-top">
<<<<<<< HEAD
      <div class="logo"><h1>Tech-News</h1></div>
      <form class="search-box" action="search.php" method="GET">
        <input type="text" name="q" value="<?= htmlspecialchars($query) ?>" placeholder="Tìm kiếm tin tức...">
        <button type="submit">Tìm kiếm</button>
      </form>
=======
      <a href="index.php"><div class="logo"><h1 style="font-size: 65px; font-family: fantasy">Y2K <span style="font-size:17px; ">TECH NEWS EVERYDAYS</span></h1></div></a>

      <div class="admin-link">
        <?php if (isset($_SESSION['user_id'])): ?>
        <a href="admin/index.php" class="login-button admin-dash-button">
            <i class="fas fa-user-cog"></i> 
            Chào, <?= htmlspecialchars(explode(' ', $_SESSION['user_name'])[0]) ?>
        </a>
        <a href="admin/logout.php" class="login-button logout-button" id="ajax-logout-button">
            <i class="fas fa-sign-out-alt"></i> Đăng xuất
        </a>
        <?php else: ?>
        <a href="admin/login.php" class="login-button" id="show-login-modal">
            <i class="fas fa-user-lock"></i> 
            Đăng nhập
        </a>
        <?php endif; ?>
      </div>

>>>>>>> 97656b2 (Fix Code and update admin)
    </div>

    <nav class="main-menu">
      <ul>
<<<<<<< HEAD
=======
        <li class="menu-slider"></li>
>>>>>>> 97656b2 (Fix Code and update admin)
        <li><a href="index.php">Trang chủ</a></li>
        <?php foreach ($menu_items as $item): ?>
            <li><a href="category.php?id=<?= $item['id'] ?>"><?= htmlspecialchars($item['ten_linhvuc']) ?></a></li>
        <?php endforeach; ?>
        <li><a href="#">Đánh giá</a></li>
        <li><a href="#">Thủ thuật</a></li>
<<<<<<< HEAD
=======
                    <li style="position: absolute; right:0;">
              <form class="search-box" action="search.php" method="GET">
              <input type="text" name="q" placeholder="Tìm kiếm tin tức...">
              <button type="submit" class="text-btn" style="display:none">Tìm kiếm</button>
            </form>
            </li>
>>>>>>> 97656b2 (Fix Code and update admin)
      </ul>
    </nav>
  </div>
</header>

<main>
<<<<<<< HEAD
  <div class="main-content">

    <aside class="left-banner">
      <p>Quảng cáo</p>
      <div class="ad-video">
        <iframe width="170" height="300"
          src="https://www.youtube.com/embed/dQw4w9WgXcQ?autoplay=1&mute=1&loop=1&playlist=dQw4w9WgXcQ"
          title="YouTube quảng cáo" frameborder="0" loading="lazy"
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
          allowfullscreen></iframe>
      </div>
    </aside>
=======
  <div class="main-content genk-layout">
>>>>>>> 97656b2 (Fix Code and update admin)

    <section class="center-content">
      
        <?php if (!empty($query)): ?>
            <h2 class="search-results-title">
                Tìm thấy <?= $total_results ?> kết quả cho: "<?= htmlspecialchars($query) ?>"
            </h2>
            
            <?php if ($total_results > 0): ?>
<<<<<<< HEAD
                <div class="search-results-grid">
                    <?php foreach ($results as $post) echo renderNewsCard($post); ?>
                </div>
=======
                <section class="main-feed">
                    <?php foreach ($results as $post): ?>
                    <article class="feed-card">
                        <a href="chitiet.php?id=<?= $post['id'] ?>" class="feed-card-image">
                            <img src="<?= htmlspecialchars($post['hinh_anh']) ?>" alt="<?= htmlspecialchars($post['tieu_de']) ?>">
                        </a>
                        <div class="feed-card-info">
                            <span class="news-meta"><?= htmlspecialchars($post['ten_linhvuc']) ?></span>
                            <h3 class="feed-card-title">
                                <a href="chitiet.php?id=<?= $post['id'] ?>"><?= htmlspecialchars($post['tieu_de']) ?></a>
                            </h3>
                            <p class="feed-card-excerpt"><?= htmlspecialchars($post['mo_ta_ngan']) ?></p>
                        </div>
                    </article>
                    <?php endforeach; ?>
                </section>
>>>>>>> 97656b2 (Fix Code and update admin)
            <?php else: ?>
                <p class="no-results">Không tìm thấy bài viết nào phù hợp với từ khóa của bạn.</p>
            <?php endif; ?>

        <?php else: ?>
            <h2 class="search-results-title">Vui lòng nhập từ khóa để tìm kiếm</h2>
        <?php endif; ?>

    </section>

    <aside class="right-sidebar">
      <h2 class="section-title">Tin theo ngày</h2>
      <?php foreach ($sidebar_posts as $row): ?>
        <div class="hot-item">
          <a href="chitiet.php?id=<?= $row['id'] ?>">
            <img src="<?= htmlspecialchars($row['hinh_anh']) ?>" alt="<?= htmlspecialchars($row['tieu_de']) ?>" class="hot-thumb">
          </a>
          <div class="hot-info">
            <h4><a href="chitiet.php?id=<?= $row['id'] ?>"><?= htmlspecialchars($row['tieu_de']) ?></a></h4>
            <span class="news-meta"><?= htmlspecialchars($row['ten_linhvuc'] ?? 'Chưa phân loại') ?></span>
          </div>
        </div>
      <?php endforeach; ?>
    </aside>

  </div>
</main>

<footer class="footer">
<<<<<<< HEAD
  <div class="container">
    <div class="footer-content">
      <div class="footer-section">
        <h4>Về chúng tôi</h4>
        <p>TinCôngNghệ - Trang tin công nghệ hàng đầu Việt Nam...</p>
      </div>
      <div class="footer-section">
        <h4>Liên kết nhanh</h4>
        <ul>
          <li><a href="#">Trang chủ</a></li>
          <li><a href="#">Giới thiệu</a></li>
=======
    <div class="container">
    <div class="footer-content">
    <div class="footer-section">
        <h4>Thông tin liên hệ</h4>
        <ul class="footer-contact-info">
          <li><i class="fas fa-map-marker-alt"></i> Tòa nhà League, Âu Lạc, Thăng Long</li>
          <li><i class="fas fa-phone-alt"></i> Hotline: 0123-456-789</li>
          <li><i class="fas fa-envelope"></i> info@technews.vn</li>
        </ul>
      </div>
      <div class="footer-section">
        <h4>Liên kết nhanh</h4>
        <ul class="footer-quick-links">
          <li><a href="index.php"><i class="fas fa-chevron-right"></i> Trang chủ</a></li>
          <li><a href="#"><i class="fas fa-chevron-right"></i> Giới thiệu</a></li>
          <li><a href="#contact"><i class="fas fa-chevron-right"></i> Liên hệ</a></li>
          <li><a href="#"><i class="fas fa-chevron-right"></i> Chính sách bảo mật</a></li>
>>>>>>> 97656b2 (Fix Code and update admin)
        </ul>
      </div>
      <div class="footer-section">
        <h4>Theo dõi chúng tôi</h4>
        <div class="social-links">
<<<<<<< HEAD
          <a href="#">Facebook</a>
          <a href="#">Twitter</a>
=======
          <a href="#" aria-label="Facebook" title="Facebook"><i class="fab fa-facebook-f"></i></a>
          <a href="#" aria-label="Twitter" title="Twitter"><i class="fab fa-twitter"></i></a>
          <a href="#" aria-label="Instagram" title="Instagram"><i class="fab fa-instagram"></i></a>
          <a href="#" aria-label="YouTube" title="YouTube"><i class="fab fa-youtube"></i></a>
>>>>>>> 97656b2 (Fix Code and update admin)
        </div>
      </div>
    </div>
    <div class="footer-bottom">
      <p>&copy; <?= date('Y') ?> TinCôngNghệ. All rights reserved.</p>
    </div>
  </div>
</footer>

<<<<<<< HEAD
<script src="javascript.js"></script>

=======
<div class="modal-overlay" id="login-modal-overlay">
    <div class="login-modal-content">
        <button class="close-button" id="close-login-modal">&times;</button>
        <h2>Admin Đăng nhập</h2>
        <p id="login-error-message" class="login-error"></p>
        <form id="login-modal-form" action="admin/ajax_login.php" method="POST">
            <div class="input-group">
                <label for="modal-username">Tên đăng nhập:</label>
                <input type="text" id="modal-username" name="username" required>
            </div>
            <div class="input-group">
                <label for="modal-password">Mật khẩu:</label>
                <input type="password" id="modal-password" name="password" required>
            </div>
            <button type="submit" class="submit-button">Đăng nhập</button>
            <div class="modal-links">
                <a href="admin/forgot_password.php">Quên mật khẩu?</a>
                <a href="admin/register.php">Đăng ký Tác giả</a>
            </div>
        </form>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="javascript.js"></script>
<?php $conn->close(); ?>
>>>>>>> 97656b2 (Fix Code and update admin)
</body>
</html>