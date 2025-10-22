<?php
include 'config.php';
?>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tech-News | Tin công nghệ mới nhất Việt Nam</title>
  <meta name="description" content="Tech-News - Trang tin công nghệ hàng đầu Việt Nam. Cập nhật tin tức mới nhất về điện thoại, máy tính, phần mềm và game.">
  <meta name="keywords" content="tin công nghệ, điện thoại, máy tính, phần mềm, game, đánh giá, thủ thuật">
  <meta name="author" content="Tech-News Team">
  <link rel="icon" href="favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    html { scroll-behavior: smooth; }
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

    <aside class="left-banner">
      <p>Quảng cáo</p>
      <div class="ad-video">
        <iframe width="170" height="300"
          src="https://www.youtube.com/embed/dQw4w9WgXcQ?autoplay=1&mute=1&loop=1&playlist=dQw4w9WgXcQ"
          title="YouTube video quảng cáo"
          frameborder="0"
          loading="lazy"
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
          allowfullscreen>
        </iframe>
      </div>
    </aside>

    <section class="center-content">
      <h2 class="section-title">Tin mới</h2>

      <?php
      $sql = "SELECT b.id, b.tieu_de, b.mo_ta_ngan, b.hinh_anh, l.ten_linhvuc 
              FROM baiviet b 
              LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
              ORDER BY b.ngay_dang DESC LIMIT 2";
      $result = $conn->query($sql);

      if ($result && $result->num_rows > 0) {
          $i = 0;
          echo '<div class="featured-news">';
          while ($row = $result->fetch_assoc()) {
              $cardClass = ($i == 0) ? 'large' : 'small';
              echo '<article class="news-card '.$cardClass.'">
                      <a href="chitiet.php?id='.$row['id'].'">
                        <img src="'.$row['hinh_anh'].'" alt="'.$row['tieu_de'].'">
                      </a>
                      <div class="news-info">
                        <span class="news-meta">'.$row['ten_linhvuc'].'</span>
                        <h3 class="news-title"><a href="chitiet.php?id='.$row['id'].'">'.$row['tieu_de'].'</a></h3>
                        <p class="news-excerpt">'.$row['mo_ta_ngan'].'</p>
                      </div>
                    </article>';
              $i++;
          }
          echo '</div>';
      }
      ?>

      <div class="news-grid">
        <?php
        $sql = "SELECT b.id, b.tieu_de, b.mo_ta_ngan, b.hinh_anh, l.ten_linhvuc 
                FROM baiviet b 
                LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
                ORDER BY b.ngay_dang DESC LIMIT 2,4";
        $result = $conn->query($sql);

        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo '<article class="news-card">
                        <a href="chitiet.php?id='.$row['id'].'">
                          <img src="'.$row['hinh_anh'].'" alt="'.$row['tieu_de'].'">
                        </a>
                        <div class="news-info">
                          <span class="news-meta">'.$row['ten_linhvuc'].'</span>
                          <h3 class="news-title"><a href="chitiet.php?id='.$row['id'].'">'.$row['tieu_de'].'</a></h3>
                          <p class="news-excerpt">'.$row['mo_ta_ngan'].'</p>
                        </div>
                      </article>';
            }
        }
        ?>
      </div>

      <h2 class="section-title" style="margin-top: 30px; width: 100%;">Các tin khác</h2>
      <div class="news-grid">
          <?php
          // --- Bước 1: Lấy ID của 6 bài viết đã hiển thị để loại trừ ---
          $exclude_ids = [];
          $sql_exclude = "SELECT id FROM baiviet ORDER BY ngay_dang DESC LIMIT 6";
          $result_exclude = $conn->query($sql_exclude);

          if ($result_exclude && $result_exclude->num_rows > 0) {
              while ($row_exclude = $result_exclude->fetch_assoc()) {
                  $exclude_ids[] = $row_exclude['id'];
              }
          }

          // --- Bước 2: Lấy tất cả các bài viết còn lại ---
          $sql_others = "SELECT b.id, b.tieu_de, b.mo_ta_ngan, b.hinh_anh, l.ten_linhvuc 
                         FROM baiviet b 
                         LEFT JOIN linhvuc l ON b.id_linhvuc = l.id";

          if (!empty($exclude_ids)) {
              $id_string = implode(',', $exclude_ids);
              $sql_others .= " WHERE b.id NOT IN ($id_string)";
          }

          $sql_others .= " ORDER BY b.ngay_dang DESC";

          $result_others = $conn->query($sql_others);

          if ($result_others && $result_others->num_rows > 0) {
              while ($row = $result_others->fetch_assoc()) {
                  echo '<article class="news-card">
                          <a href="chitiet.php?id='.$row['id'].'">
                            <img src="'.$row['hinh_anh'].'" alt="'.$row['tieu_de'].'">
                          </a>
                          <div class="news-info">
                            <span class="news-meta">'.$row['ten_linhvuc'].'</span>
                            <h3 class="news-title"><a href="chitiet.php?id='.$row['id'].'">'.$row['tieu_de'].'</a></h3>
                            <p class="news-excerpt">'.$row['mo_ta_ngan'].'</p>
                          </div>
                        </article>';
              }
          } else {
              echo '<p style="width: 100%; text-align: center;">Không có tin tức nào khác để hiển thị.</p>';
          }
          ?>
      </div>
      </section>

    <aside class="right-sidebar">
      <h2 class="section-title">Tin theo ngày</h2>
      <?php
      $sql = "SELECT b.id, b.tieu_de, b.hinh_anh, l.ten_linhvuc 
              FROM baiviet b 
              LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
              ORDER BY b.ngay_dang DESC LIMIT 5";
      $result = $conn->query($sql);

      if ($result && $result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
              echo '<div class="hot-item">
                      <a href="chitiet.php?id='.$row['id'].'">
                        <img src="'.$row['hinh_anh'].'" alt="'.$row['tieu_de'].'" class="hot-thumb">
                      </a>
                      <div class="hot-info">
                        <h4><a href="chitiet.php?id='.$row['id'].'">'.$row['tieu_de'].'</a></h4>
                        <span class="news-meta">'.$row['ten_linhvuc'].'</span>
                      </div>
                    </div>';
          }
      }
      ?>
    </aside>

  </div>
</main>

<section class="contact-section" id="contact">
  <div class="container">
    <h2 class="section-title">Liên Hệ</h2>
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