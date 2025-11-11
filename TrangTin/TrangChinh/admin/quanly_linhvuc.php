<?php
include 'check_auth.php'; 
include '../functions.php'; 

// CHẶN QUYỀN: Chỉ Admin được vào trang này
if (!$IS_ADMIN) {
    die("Bạn không có quyền truy cập trang này. <a href='index.php'>Quay lại</a>");
}

$action = $_GET['action'] ?? 'list';
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$item = null;
$message = '';

// Xử lý LƯU (Thêm/Sửa)
if ($action === 'save' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int)$_POST['id'];
    $ten_linhvuc = trim($_POST['ten_linhvuc']);
    $mo_ta = trim($_POST['mo_ta']);

    if (!empty($ten_linhvuc)) {
        if ($id > 0) { // Cập nhật
            $stmt = $conn->prepare("UPDATE linhvuc SET ten_linhvuc = ?, mo_ta = ? WHERE id = ?");
            $stmt->bind_param("ssi", $ten_linhvuc, $mo_ta, $id);
        } else { // Thêm mới
            $stmt = $conn->prepare("INSERT INTO linhvuc (ten_linhvuc, mo_ta) VALUES (?, ?)");
            $stmt->bind_param("ss", $ten_linhvuc, $mo_ta);
        }
        $stmt->execute();
        $stmt->close();
        header('Location: quanly_linhvuc.php?success=1');
        exit;
    } else {
        $message = '<div class="notice error">Tên lĩnh vực không được để trống.</div>';
        $item = $_POST; // Giữ lại dữ liệu đã nhập
    }
}

// Xử lý XÓA
if ($action === 'delete' && $id > 0) {
    // Xóa lĩnh vực sẽ set id_linhvuc của bài viết thành NULL (do CSDL)
    $stmt = $conn->prepare("DELETE FROM linhvuc WHERE id = ?");
    $stmt->bind_param('i', $id);
    $stmt->execute();
    $stmt->close();
    header('Location: quanly_linhvuc.php?success=2');
    exit;
}

// Lấy dữ liệu để SỬA
if ($action === 'edit' && $id > 0) {
    $data = fetchAll($conn, "SELECT * FROM linhvuc WHERE id = ?", 'i', [$id]);
    $item = $data[0] ?? null;
}

// Lấy danh sách để LIỆT KÊ
$items = fetchAll($conn, "SELECT * FROM linhvuc ORDER BY ten_linhvuc ASC");

if (isset($_GET['success'])) {
    $message = '<div class="notice success">' . ($_GET['success'] == 1 ? 'Lưu thành công!' : 'Xóa thành công!') . '</div>';
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Lĩnh vực</title>
    <link rel="stylesheet" href="css/admin_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="admin-wrapper">
    <?php include 'sidebar.php'; ?>
    <main class="main-content">
        <header class="admin-header">
            <div class="page-header"><h1>Quản lý Lĩnh vực</h1></div>
            <div class="admin-user">
                <span>Chào, <strong><?= htmlspecialchars($_SESSION['user_name']) ?></strong>!</span>
                <a href="logout.php" class="logout-btn">Đăng xuất</a>
            </div>
        </header>
        
        <div class="form-container">
            <?= $message ?>
            <h2><?= ($action === 'edit' && $item) ? 'Sửa lĩnh vực' : 'Thêm lĩnh vực mới' ?></h2></br>
            <form action="quanly_linhvuc.php?action=save" method="POST">
                <input type="hidden" name="id" value="<?= $item['id'] ?? 0 ?>">
                <div class="form-group">
                    <label for="ten_linhvuc">Tên lĩnh vực</label>
                    <input type="text" id="ten_linhvuc" name="ten_linhvuc" value="<?= htmlspecialchars($item['ten_linhvuc'] ?? '') ?>" required>
                </div>
                <div class="form-group">
                    <label for="mo_ta">Mô tả</label>
                    <textarea id="mo_ta" name="mo_ta" rows="3"><?= htmlspecialchars($item['mo_ta'] ?? '') ?></textarea>
                </div>
                <button type="submit" class="btn-save"><i class="fas fa-save"></i> Lưu</button>
                <?php if ($action === 'edit'): ?>
                <a href="quanly_linhvuc.php" class="btn-cancel">Hủy</a>
                <?php endif; ?>
            </form>
        </div>

        <div class="recent-posts" style="margin: 20px;">
            <h2>Danh sách Lĩnh vực (<?= count($items) ?>)</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên lĩnh vực</th>
                        <th>Mô tả</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($items as $cat): ?>
                    <tr>
                        <td><?= $cat['id'] ?></td>
                        <td><?= htmlspecialchars($cat['ten_linhvuc']) ?></td>
                        <td><?= htmlspecialchars($cat['mo_ta']) ?></td>
                        <td class="actions">
                            <a href="quanly_linhvuc.php?action=edit&id=<?= $cat['id'] ?>" class="btn-edit"><i class="fas fa-edit"></i> Sửa</a>
                            <a href="quanly_linhvuc.php?action=delete&id=<?= $cat['id'] ?>" class="btn-delete" onclick="return confirm('Xóa lĩnh vực này sẽ gỡ nó khỏi tất cả bài viết liên quan. Bạn có chắc?');"><i class="fas fa-trash"></i> Xóa</a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </main>
</div>
<?php $conn->close(); ?>
</body>
</html>