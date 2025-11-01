<?php
include 'functions.php';


// Menu lĩnh vực
$menu_items = getMenuItems($conn); // Dùng hàm mới

// Tin nổi bật (2 lớn + 4 nhỏ)
$featured = fetchAll($conn, "
    SELECT b.id, b.tieu_de, b.mo_ta_ngan, b.hinh_anh, l.ten_linhvuc
    FROM baiviet b
    LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
    ORDER BY b.ngay_dang DESC
    LIMIT 6
");
$featured_large = array_slice($featured, 0, 2);
$featured_grid = array_slice($featured, 2);
$exclude_ids = array_column($featured, 'id');
$exclude_str = $exclude_ids ? implode(',', $exclude_ids) : '0';

// Sidebar
$sidebar_posts = fetchAll($conn, "
    SELECT b.id, b.tieu_de, b.hinh_anh, l.ten_linhvuc
    FROM baiviet b
    LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
    ORDER BY b.ngay_dang DESC
    LIMIT 5
");

$categories = fetchAll($conn, "SELECT id, ten_linhvuc FROM linhvuc ORDER BY id ASC LIMIT 5");
?>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tech-News | Tin công nghệ mới nhất Việt Nam</title>
  <link rel="icon" href="favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

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
        <li><a href="index.php" class="active">Trang chủ</a></li>
        <?php foreach ($menu_items as $item): ?>
            <li><a href="category.php?id=<?= $item['id'] ?>"><?= htmlspecialchars($item['ten_linhvuc']) ?></a></li>
        <?php endforeach; ?>
        <li><a href="#">Đánh giá</a></li>
        <li><a href="#">Thủ thuật</a></li>
      </ul>
    </nav>
  </div>
</header>

<main>
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

    <section class="center-content">
        <h2 class="section-title">Tin mới</h2>

        <div class="featured-news">
          <?= isset($featured_large[0]) ? renderNewsCard($featured_large[0], 'large') : '' ?>
          <?= isset($featured_large[1]) ? renderNewsCard($featured_large[1], 'small') : '' ?>
        </div>
  
        <div class="news-grid">
          <?php foreach ($featured_grid as $post) echo renderNewsCard($post); ?>
        </div>
  
        <?php foreach ($categories as $cat): ?>
          <h2 class="section-title" style="margin-top:30px">Tin <?= htmlspecialchars($cat['ten_linhvuc']) ?></h2>
          <?php
            $posts = fetchAll($conn, "
                SELECT b.id, b.tieu_de, b.mo_ta_ngan, b.hinh_anh, l.ten_linhvuc
                FROM baiviet b
                LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
                WHERE b.id_linhvuc = ? AND b.id NOT IN ($exclude_str)
                ORDER BY b.ngay_dang DESC LIMIT 4
            ", 'i', [$cat['id']]);
          ?>
          <div class="news-grid">
            <?php if ($posts): ?>
                <?php foreach ($posts as $p) echo renderNewsCard($p); ?>
            <?php else: ?>
                <p style="text-align:center;width:100%">Không có tin tức nào trong lĩnh vực này.</p>
            <?php endif; ?>
          </div>
        <?php endforeach; ?>
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

<section class="contact-section" id="contact">
    <div class="container">
    <h2 class="section-title">Liên hệ</h2>
    <div class="contact-content">
      <div class="contact-info">
        <ul>
          <li><i class="fas fa-map-marker-alt"></i> Tòa nhà League, Âu Lạc, Thăng Long</li>
          <li><i class="fas fa-envelope"></i> info@technews.vn</li>
          <li><i class="fas fa-phone-alt"></i> Hotline: 0123-456-789</li>
          <li><i class="fas fa-clock"></i> Thứ 2 - Thứ 7: 8h - 21h</li>
          <li><i class="fas fa-calendar-times"></i> Chủ nhật: Nghỉ</li>
        </ul>
      </div>

      <div class="contact-form">
        <form action="send_contact.php" method="post">
          <input type="text" name="name" placeholder="Họ tên của bạn" required>
          <input type="email" name="email" placeholder="Email của bạn" required>
          <textarea name="message" placeholder="Nội dung liên hệ..." required></textarea>
          <button type="submit" class="submit-button">Gửi liên hệ</button>
        </form>
      </div>
    </div>
  </div>
</section>

<footer class="footer">
    <div class="container">
    <div class="footer-content">
      <div class="footer-section">
        <h4>Về chúng tôi</h4>
        <p>TinCôngNghệ - Trang tin công nghệ hàng đầu Việt Nam, cập nhật tin tức mới nhất về công nghệ, điện tử, phần mềm và game.</p>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="javascript.js"></script>

</body>
</html>