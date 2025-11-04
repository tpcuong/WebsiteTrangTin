<?php
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
    $sql = "
        SELECT b.id, b.tieu_de, b.mo_ta_ngan, b.hinh_anh, l.ten_linhvuc
        FROM baiviet b
        LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
        WHERE b.tieu_de LIKE ? OR b.mo_ta_ngan LIKE ?
        ORDER BY b.ngay_dang DESC
    ";
    
    // 'ss' nghĩa là 2 tham số đều là string
    $results = fetchAll($conn, $sql, 'ss', [$search_term, $search_term]);
    $total_results = count($results);
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Kết quả tìm kiếm cho "<?= htmlspecialchars($query) ?>" | Tech-News</title>
  
  <link rel="stylesheet" href="style.css"> 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<header class="header">
  <div class="container">
    <div class="header-top">
      <div class="logo"><h1>Tech-News</h1></div>
      <form class="search-box" action="search.php" method="GET">
        <input type="text" name="q" value="<?= htmlspecialchars($query) ?>" placeholder="Tìm kiếm tin tức...">
        <button type="submit">Tìm kiếm</button>
      </form>
    </div>

    <nav class="main-menu">
      <ul>
        <li><a href="index.php">Trang chủ</a></li>
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
      
        <?php if (!empty($query)): ?>
            <h2 class="search-results-title">
                Tìm thấy <?= $total_results ?> kết quả cho: "<?= htmlspecialchars($query) ?>"
            </h2>
            
            <?php if ($total_results > 0): ?>
                <div class="search-results-grid">
                    <?php foreach ($results as $post) echo renderNewsCard($post); ?>
                </div>
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

<script src="javascript.js"></script>

</body>
</html>