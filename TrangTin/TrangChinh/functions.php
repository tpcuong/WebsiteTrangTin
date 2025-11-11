<?php
// SỬA: Chỉ khởi động session NẾU CHƯA TỒN TẠI
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
include 'config.php'; 

// --- (Toàn bộ các hàm renderNewsCard, fetchAll, getMenuItems giữ nguyên) ---

function renderNewsCard(array $post, string $class = ''): string {
    // Hàm này được dùng bởi trang search.php và category.php
    // (Trang index.php kiểu GenK không dùng hàm này)
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

function fetchAll(mysqli $conn, string $sql, string $types = '', array $params = []): array {
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        error_log("Lỗi SQL prepare: " . $conn->error);
        return []; 
    }
    
    if ($types && $params) {
        $stmt->bind_param($types, ...$params);
    }
    
    $stmt->execute();
    $result = $stmt->get_result();
    $stmt->close();
    
    return $result ? $result->fetch_all(MYSQLI_ASSOC) : [];
}

function getMenuItems(mysqli $conn): array {
    return fetchAll($conn, "SELECT id, ten_linhvuc FROM linhvuc ORDER BY id ASC LIMIT 5");
}
?>