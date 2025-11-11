<?php
include 'check_auth.php'; 
include '../functions.php'; 

// CHẶN QUYỀN: Chỉ Admin được vào trang này
if (!$IS_ADMIN) {
    die("Bạn không có quyền truy cập trang này. <a href='index.php'>Quay lại</a>");
}

$action = $_GET['action'] ?? null;
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$message = '';

// --- XỬ LÝ HÀNH ĐỘNG XÓA ---
if ($id > 0 && $action === 'delete') {
    // XÓA: Xóa vĩnh viễn bình luận
    $stmt = $conn->prepare("DELETE FROM binhluan WHERE id = ?");
    $stmt->bind_param('i', $id);
    $stmt->execute();
    $stmt->close();
    $message = '<div class="notice success">Đã xóa bình luận thành công!</div>';
}

// --- LẤY DANH SÁCH BÌNH LUẬN ---
// Sắp xếp theo ngày mới nhất để dễ quản lý
$sql = "
    SELECT bl.id, bl.noi_dung, bl.ten_tac_gia, bl.ngay_gui, b.tieu_de as ten_baiviet, b.id as id_baiviet
    FROM binhluan bl
    LEFT JOIN baiviet b ON bl.id_baiviet = b.id
    ORDER BY bl.ngay_gui DESC
";
$comments = fetchAll($conn, $sql);

?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Bình luận</title>
    <link rel="stylesheet" href="css/admin_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="admin-wrapper">
    
    <?php include 'sidebar.php'; // Nhúng menu sidebar ?>
    
    <main class="main-content">
        <header class="admin-header">
            <h1>Quản lý Bình luận (<?= count($comments) ?>)</h1>
            <div class="admin-user">
                <span>Chào, <strong><?= htmlspecialchars($_SESSION['user_name']) ?></strong>!</span>
                <a href="logout.php" class="logout-btn">Đăng xuất</a>
            </div>
        </header>
        
        <div class="recent-posts" style="margin: 20px;">
            <p>Đây là nơi xem và xóa các bình luận (spam) từ người dùng. Các bình luận được hiển thị công khai ngay lập tức.</p>
            <?= $message // Hiển thị thông báo (nếu có) ?>
            
            <table>
                <thead>
                    <tr>
                        <th style="width: 50%;">Nội dung bình luận</th>
                        <th style="width: 30%;">Thông tin</th>
                        <th style="width: 20%;">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($comments): ?>
                        <?php foreach ($comments as $comment): ?>
                            <tr>
                                <td>
                                    <div class="comment-content">
                                        <?= nl2br(htmlspecialchars($comment['noi_dung'])) ?>
                                    </div>
                                    <a href="../chitiet.php?id=<?= $comment['id_baiviet'] ?>#comment-section" target="_blank" class="comment-post-link">
                                        (Xem bài viết: "<?= htmlspecialchars($comment['ten_baiviet']) ?>")
                                    </a>
                                </td>
                                
                                <td>
                                    <div class="comment-meta">
                                        bởi: <strong><?= htmlspecialchars($comment['ten_tac_gia']) ?></strong>
                                        <br>
                                        lúc: <?= date('d/m/Y H:i', strtotime($comment['ngay_gui'])) ?>
                                    </div>
                                </td>
                                
                                <td class="actions">
                                    <a href="quanly_binhluan.php?action=delete&id=<?= $comment['id'] ?>" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn XÓA vĩnh viễn bình luận này?');">
                                        <i class="fas fa-trash"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr><td colspan="3" style="text-align: center;">Chưa có bình luận nào.</td></tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </main>
</div>
<?php $conn->close(); ?>
</body>
</html>