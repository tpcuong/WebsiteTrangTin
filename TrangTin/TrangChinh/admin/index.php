<?php
// 1. GỌI "GÁC CỔNG" (Tự động session_start() và kiểm tra đăng nhập)
include 'check_auth.php'; 

// 2. KẾT NỐI CSDL VÀ FUNCTIONS (ĐÃ SỬA ĐƯỜNG DẪN)
include '../functions.php'; 

// --- THỰC HIỆN CÁC TRUY VẤN CHO DASHBOARD ---

// 3. Đếm Bài viết (Admin thấy tất cả, Tác giả chỉ thấy của mình)
$sql_total_articles = "SELECT COUNT(*) as total_articles FROM baiviet";
$params_total = [];
$types_total = '';
if ($IS_AUTHOR) { // $IS_AUTHOR từ check_auth.php
    $sql_total_articles .= " WHERE id_tacgia = ?";
    $params_total[] = $CURRENT_USER_ID; // $CURRENT_USER_ID từ check_auth.php
    $types_total = 'i';
}
$result_articles = fetchAll($conn, $sql_total_articles, $types_total, $params_total);
$total_articles = $result_articles[0]['total_articles'] ?? 0;


// 4. ĐẾM CÁC MỤC KHÁC (Chỉ Admin mới cần)
$total_categories = 0;
$total_comments = 0;
$total_users = 0;

if ($IS_ADMIN) {
    // Đếm Lĩnh vực
    $result_categories = fetchAll($conn, "SELECT COUNT(*) as total_categories FROM linhvuc");
    $total_categories = $result_categories[0]['total_categories'] ?? 0;

    // Đếm Bình luận
    $result_comments = fetchAll($conn, "SELECT COUNT(*) as total_comments FROM binhluan");
    $total_comments = $result_comments[0]['total_comments'] ?? 0;

    // Đếm Người dùng
    $result_users = fetchAll($conn, "SELECT COUNT(*) as total_users FROM users");
    $total_users = $result_users[0]['total_users'] ?? 0;
}

// 5. Lấy 10 bài viết mới nhất
$sql_recent_posts = "
    SELECT b.id, b.tieu_de, l.ten_linhvuc, b.ngay_dang
    FROM baiviet b
    LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
";
$params_recent = [];
$types_recent = '';
if ($IS_AUTHOR) {
    $sql_recent_posts .= " WHERE b.id_tacgia = ? ";
    $params_recent[] = $CURRENT_USER_ID;
    $types_recent = 'i';
}
$sql_recent_posts .= " ORDER BY b.ngay_dang DESC LIMIT 10";
$recent_posts = fetchAll($conn, $sql_recent_posts, $types_recent, $params_recent);

?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Tech-News</title>
    <link rel="stylesheet" href="css/admin_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<div class="admin-wrapper">

    <?php include 'sidebar.php'; // Nhúng menu sidebar ?>

    <main class="main-content">
        <header class="admin-header">
            <h1>Bảng điều khiển</h1>
            <div class="admin-user">
                <span>Chào, <strong><?= htmlspecialchars($_SESSION['user_name']) ?></strong>!</span>
                <a href="logout.php" class="logout-btn">Đăng xuất</a>
            </div>
        </header>
        
        <section class="statistics">
        
            <div class="stat-card">
                <i class="fas fa-newspaper" style="color: #3498db;"></i>
                <div class="stat-info">
                    <h3><?= $IS_AUTHOR ? 'Bài viết của bạn' : 'Tổng số bài viết' ?></h3>
                    <p><?= $total_articles ?></p>
                </div>
                <a href="quanly_baiviet.php" class="card-link">Quản lý &rarr;</a>
            </div>
            
            <div class="stat-card add-post">
                <i class="fas fa-plus-circle" style="color: #2ecc71;"></i>
                <div class="stat-info">
                    <h3>Thêm bài mới</h3>
                    <p style="font-size: 1.1rem; font-weight: 500;">
                        <a href="quanly_baiviet.php?action=add" class="btn-add">Viết bài</a>
                    </p>
                </div>
            </div>

            <?php if ($IS_ADMIN): ?>
            
            <div class="stat-card">
                <i class="fas fa-comments" style="color: #f39c12;"></i>
                <div class="stat-info">
                    <h3>Tổng số bình luận</h3>
                    <p><?= $total_comments ?></p>
                </div>
                <a href="quanly_binhluan.php" class="card-link">Quản lý &rarr;</a>
            </div>
            
            <div class="stat-card">
                <i class="fas fa-tags" style="color: #9b59b6;"></i>
                <div class="stat-info">
                    <h3>Tổng số lĩnh vực</h3>
                    <p><?= $total_categories ?></p>
                </div>
                <a href="quanly_linhvuc.php" class="card-link">Quản lý &rarr;</a>
            </div>
            
            <div class="stat-card">
                <i class="fas fa-users" style="color: #e74c3c;"></i>
                <div class="stat-info">
                    <h3>Tổng số người dùng</h3>
                    <p><?= $total_users ?></p>
                </div>
                <a href="quanly_users.php" class="card-link">Quản lý &rarr;</a>
            </div>

            <?php endif; ?>
        </section>

        <section class="recent-posts">
            <h2>Bài viết mới nhất <?php if($IS_AUTHOR) echo "của bạn"; ?></h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tiêu đề</th>
                        <th>Lĩnh vực</th>
                        <th>Ngày đăng</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($recent_posts): ?>
                        <?php foreach ($recent_posts as $post): ?>
                        <tr>
                            <td><?= $post['id'] ?></td>
                            <td><?= htmlspecialchars($post['tieu_de']) ?></td>
                            <td><?= htmlspecialchars($post['ten_linhvuc'] ?? 'N/A') ?></td>
                            <td><?= date('d-m-Y', strtotime($post['ngay_dang'])) ?></td>
                            <td class="actions">
                                <a href="quanly_baiviet.php?action=edit&id=<?= $post['id'] ?>" class="btn-edit" title="Sửa thông tin"><i class="fas fa-info-circle"></i> Sửa TT</a>
                                <a href="quanly_noidung.php?post_id=<?= $post['id'] ?>" class="btn-edit" style="background-color: #3498db;" title="Soạn thảo nội dung">
                                    <i class="fas fa-file-alt"></i> Nội dung
                                </a>
                                <a href="quanly_baiviet.php?action=delete&id=<?= $post['id'] ?>" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa?');"><i class="fas fa-trash"></i> Xóa</a>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="5" style="text-align: center;">Chưa có bài viết nào.</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </section>
    </main>
</div>
<?php $conn->close(); ?>
</body>
</html>