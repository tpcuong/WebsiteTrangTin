<?php
include 'functions.php';

// --- (LOGIC PHP LẤY BÀI VIẾT KIỂU GENK) ---
$menu_items = getMenuItems($conn);
$hot_posts = fetchAll($conn, "
    SELECT b.id, b.tieu_de, b.mo_ta_ngan, b.hinh_anh, l.ten_linhvuc
    FROM baiviet b LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
    ORDER BY b.ngay_dang DESC LIMIT 5
");
$hero_post = array_slice($hot_posts, 0, 1)[0] ?? null;
$hot_grid_posts = array_slice($hot_posts, 1);
$exclude_ids = array_column($hot_posts, 'id');
$exclude_str = $exclude_ids ? implode(',', $exclude_ids) : '0';
$main_feed_posts = fetchAll($conn, "
    SELECT b.id, b.tieu_de, b.mo_ta_ngan, b.hinh_anh, l.ten_linhvuc
    FROM baiviet b LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
    WHERE b.id NOT IN ($exclude_str)
    ORDER BY b.ngay_dang DESC LIMIT 10
");
$sidebar_posts = fetchAll($conn, "
    SELECT b.id, b.tieu_de, b.hinh_anh, l.ten_linhvuc
    FROM baiviet b LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
    ORDER BY b.ngay_dang DESC LIMIT 5
");
?>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tech-News | Tin công nghệ mới nhất Việt Nam</title>
  <link rel="icon" href="favicon.ico" type="image/x-icon">
  
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<header class="header">
  <div class="container">
    <div class="header-top">
      <div class="logo">
        <a href="index.php"><div class="logo"><h1 style="font-size: 65px; font-family: fantasy">Y2K <span style="font-size:17px; ">TECH NEWS EVERYDAYS</span></h1></div></a>
    </div>
      
      <div class="admin-link">
        <?php if (isset($_SESSION['user_id'])): ?>
            <a href="admin/index.php" class="login-button admin-dash-button">
                <i class="fas fa-user-cog"></i> Chào, <?= htmlspecialchars(explode(' ', $_SESSION['user_name'])[0]) ?>
            </a>
            <a href="admin/logout.php" class="login-button logout-button">
                <i class="fas fa-sign-out-alt"></i> Đăng xuất
            </a>
        <?php else: ?>
            <a href="admin/login.php" class="login-button" id="show-login-modal">
                <i class="fas fa-user-lock"></i> 
                Đăng nhập
            </a>
        <?php endif; ?>
      </div>
    </div>
    <nav class="main-menu">
        <ul>
            <li class="menu-slider"></li>
            <li><a href="index.php" class="active">Trang chủ</a></li>
            <?php foreach ($menu_items as $item): ?>
                <li><a href="category.php?id=<?= $item['id'] ?>"><?= htmlspecialchars($item['ten_linhvuc']) ?></a></li>
            <?php endforeach; ?>
            <li><a href="#">Đánh giá</a></li>
            <li><a href="#">Thủ thuật</a></li>
            <li style="position: absolute; right:0;">
              <form class="search-box" action="search.php" method="GET">
              <input type="text" name="q" placeholder="Tìm kiếm tin tức...">
              <button type="submit" class="text-btn" style="display:none">Tìm kiếm</button>
            </form>
            </li>
        </ul>
    </nav>
  </div>
</header>

<main>
  <div class="main-content genk-layout">

    <section class="center-content">
        
        <?php if ($hero_post): ?>
        <section class="featured-box">
            <div class="hero-post">
                <a href="chitiet.php?id=<?= $hero_post['id'] ?>">
                    <img src="<?= htmlspecialchars($hero_post['hinh_anh']) ?>" alt="<?= htmlspecialchars($hero_post['tieu_de']) ?>">
                </a>
                <div class="hero-info">
                    <span class="news-meta"><?= htmlspecialchars($hero_post['ten_linhvuc']) ?></span>
                    <h2 class="hero-title">
                        <a href="chitiet.php?id=<?= $hero_post['id'] ?>"><?= htmlspecialchars($hero_post['tieu_de']) ?></a>
                    </h2>
                </div>
            </div>
            
            <div class="hot-grid">
                <?php foreach ($hot_grid_posts as $post): ?>
                <div class="hot-grid-item">
                    <a href="chitiet.php?id=<?= $post['id'] ?>">
                        <img src="<?= htmlspecialchars($post['hinh_anh']) ?>" alt="<?= htmlspecialchars($post['tieu_de']) ?>">
                    </a>
                    <h3 class="hot-grid-title">
                        <a href="chitiet.php?id=<?= $post['id'] ?>"><?= htmlspecialchars($post['tieu_de']) ?></a>
                    </h3>
                </div>
                <?php endforeach; ?>
            </div>
        </section>
        <?php endif; ?>

        <h2 class="section-title">Tin tức mới nhất</h2>
        <section class="main-feed">
            <?php if (empty($main_feed_posts)): ?>
                <p>Không có tin tức nào để hiển thị.</p>
            <?php else: ?>
                <?php foreach ($main_feed_posts as $post): ?>
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
            <?php endif; ?>
        </section>
        
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
              <span class="news-meta"><?= htmlspecialchars($row['ten_linhvuc']) ?></span>
            </div>
          </div>
        <?php endforeach; ?>
    </aside>

  </div>
</main>
<footer class="footer">
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
        </ul>
      </div>
      <div class="footer-section">
        <h4>Theo dõi chúng tôi</h4>
        <div class="social-links">
          <a href="#" aria-label="Facebook" title="Facebook"><i class="fab fa-facebook-f"></i></a>
          <a href="#" aria-label="Twitter" title="Twitter"><i class="fab fa-twitter"></i></a>
          <a href="#" aria-label="Instagram" title="Instagram"><i class="fab fa-instagram"></i></a>
          <a href="#" aria-label="YouTube" title="YouTube"><i class="fab fa-youtube"></i></a>
        </div>
      </div>
    </div>
    <div class="footer-bottom">
      <p>&copy; <?= date('Y') ?> TinCôngNghệ. All rights reserved.</p>
    </div>
  </div>
</footer>


<div class="modal-overlay" id="login-modal-overlay">
    <div class="login-modal-content">
        <button class="close-button" id="close-login-modal">&times;</button>
        <h2>Đăng nhập</h2>
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

</body>
</html>