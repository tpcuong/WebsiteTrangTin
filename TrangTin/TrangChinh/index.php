<?php
include 'config.php';
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tin Công Nghệ - Trang tin công nghệ hàng đầu Việt Nam</title>
    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
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

<main>
  <div class="main-content">
    
    <!-- Banner trái -->
    <aside class="left-banner">
    <p>Quảng cáo</p>
    <div class="ad-video">
        <iframe width="170" height="300"
        src="https://www.youtube.com/embed/dQw4w9WgXcQ?autoplay=1&mute=1&loop=1&playlist=M1pA9YPbHd4"
        title="YouTube video quảng cáo"
        frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen>
        </iframe>
    </div>
    </aside>

 <!-- Nội dung chính -->
  <section class="center-content">
    <h2 class="section-title">Tin mới</h2>

    <?php
    // Lấy 1 tin lớn + 1 tin nhỏ bên phải
    $sql = "SELECT b.id, b.tieu_de, b.mo_ta_ngan, b.hinh_anh, l.ten_linhvuc 
            FROM baiviet b 
            LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
            ORDER BY b.ngay_dang DESC LIMIT 2";
    $result = $conn->query($sql);

    if ($result && $result->num_rows > 0) {
        $i = 0;
        echo '<div class="featured-news">';
        while ($row = $result->fetch_assoc()) {
            if ($i == 0) {
                // Tin lớn
                echo '<article class="news-card large">
                        <a href="chitiet.php?id='.$row['id'].'">
                          <img src="'.$row['hinh_anh'].'" alt="'.$row['tieu_de'].'">
                        </a>
                        <div class="news-info">
                          <span class="news-meta">'.$row['ten_linhvuc'].'</span>
                          <h3 class="news-title"><a href="chitiet.php?id='.$row['id'].'">'.$row['tieu_de'].'</a></h3>
                          <p class="news-excerpt">'.$row['mo_ta_ngan'].'</p>
                        </div>
                      </article>';
            } else {
                // Tin nhỏ
                echo '<article class="news-card small">
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
            $i++;
        }
        echo '</div>';
    }
    ?>

    <!-- Grid tin nhỏ -->
    <div class="news-grid">
      <?php
      $sql = "SELECT b.id, b.tieu_de,b.mo_ta_ngan, b.hinh_anh, l.ten_linhvuc 
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
  </section>

  <!-- Sidebar phải -->
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
