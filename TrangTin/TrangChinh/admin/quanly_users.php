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
    $username = trim($_POST['username']);
    $ho_ten = trim($_POST['ho_ten']);
    $email = trim($_POST['email']);
    $role = (int)$_POST['role'];
    $password = $_POST['password']; // Mật khẩu mới (nếu có)

    if (empty($username) || empty($ho_ten) || empty($email)) {
        $message = '<div class="notice error">Tên đăng nhập, Họ tên, Email là bắt buộc.</div>';
        $item = $_POST; // Giữ lại dữ liệu đã nhập
    } else {
        if ($id > 0) { // Cập nhật
            if (!empty($password)) { // Nếu có nhập mật khẩu mới
                $hashed_pass = password_hash($password, PASSWORD_DEFAULT);
                $stmt = $conn->prepare("UPDATE users SET username = ?, ho_ten = ?, email = ?, role = ?, password = ? WHERE id = ?");
                $stmt->bind_param("sssisi", $username, $ho_ten, $email, $role, $hashed_pass, $id);
            } else { // Không cập nhật mật khẩu
                $stmt = $conn->prepare("UPDATE users SET username = ?, ho_ten = ?, email = ?, role = ? WHERE id = ?");
                $stmt->bind_param("sssii", $username, $ho_ten, $email, $role, $id);
            }
        } else { // Thêm mới
            if (empty($password)) {
                $message = '<div class="notice error">Mật khẩu là bắt buộc khi thêm mới.</div>';
                $item = $_POST;
            } else {
                $hashed_pass = password_hash($password, PASSWORD_DEFAULT);
                $stmt = $conn->prepare("INSERT INTO users (username, ho_ten, email, role, password) VALUES (?, ?, ?, ?, ?)");
                $stmt->bind_param("sssis", $username, $ho_ten, $email, $role, $hashed_pass);
            }
        }

        if (isset($stmt) && $stmt->execute()) {
            $stmt->close();
            header('Location: quanly_users.php?success=1');
            exit;
        } else if (empty($message)) {
            $message = '<div class="notice error">Lỗi: Tên đăng nhập hoặc Email có thể đã tồn tại.</div>';
            $item = $_POST;
        }
    }
    // Nếu có lỗi, ở lại form
    $action = ($id > 0) ? 'edit' : 'add';
}

// Xử lý XÓA
if ($action === 'delete' && $id > 0) {
    if ($id == $CURRENT_USER_ID) {
        header('Location: quanly_users.php?error=1'); // Không cho tự xóa mình
        exit;
    }
    
    // Bài viết của user bị xóa sẽ set id_tacgia = NULL (do CSDL)
    $stmt = $conn->prepare("DELETE FROM users WHERE id = ?");
    $stmt->bind_param('i', $id);
    $stmt->execute();
    $stmt->close();
    header('Location: quanly_users.php?success=2');
    exit;
}

// Lấy dữ liệu để SỬA
if ($action === 'edit' && $id > 0) {
    $data = fetchAll($conn, "SELECT id, username, ho_ten, email, role FROM users WHERE id = ?", 'i', [$id]);
    $item = $data[0] ?? null;
}

// Lấy danh sách để LIỆT KÊ
$items = fetchAll($conn, "SELECT id, username, ho_ten, email, role, ngay_tao FROM users ORDER BY ho_ten ASC");

if (isset($_GET['success'])) {
    $message = '<div class="notice success">' . ($_GET['success'] == 1 ? 'Lưu thành công!' : 'Xóa thành công!') . '</div>';
}
if (isset($_GET['error'])) {
    $message = '<div class="notice error">Không thể tự xóa chính mình!</div>';
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Người dùng</title>
    <link rel="stylesheet" href="css/admin_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="admin-wrapper">
    <?php include 'sidebar.php'; ?>
    <main class="main-content">
        <header class="admin-header">
            <div class="page-header"><h1>Quản lý Người dùng</h1></div>
            <div class="admin-user">
                <span>Chào, <strong><?= htmlspecialchars($_SESSION['user_name']) ?></strong>!</span>
                <a href="logout.php" class="logout-btn">Đăng xuất</a>
            </div>
        </header>
        
        <div class="form-container">
            <?= $message ?>
            <h2><?= ($action === 'edit' && $item) ? 'Sửa người dùng' : 'Thêm người dùng mới' ?></h2></br>
            <form action="quanly_users.php?action=save" method="POST">
                <input type="hidden" name="id" value="<?= $item['id'] ?? 0 ?>">
                <div class="form-group">
                    <label for="ho_ten">Họ và tên</label>
                    <input type="text" id="ho_ten" name="ho_ten" value="<?= htmlspecialchars($item['ho_ten'] ?? '') ?>" required>
                </div>
                <div class="form-group">
                    <label for="username">Tên đăng nhập</label>
                    <input type="text" id="username" name="username" value="<?= htmlspecialchars($item['username'] ?? '') ?>" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="<?= htmlspecialchars($item['email'] ?? '') ?>" required>
                </div>
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" id="password" name="password" placeholder="<?= ($id > 0) ? 'Bỏ trống nếu không muốn đổi' : 'Bắt buộc khi thêm mới' ?>" <?= ($id > 0) ? '' : 'required' ?>>
                </div>
                <div class="form-group">
                    <label for="role">Quyền</label>
                    <select id="role" name="role">
                        <option value="0" <?= (isset($item['role']) && $item['role'] == 0) ? 'selected' : '' ?>>Tác giả</option>
                        <option value="1" <?= (isset($item['role']) && $item['role'] == 1) ? 'selected' : '' ?>>Admin</option>
                    </select>
                </div>
                <button type="submit" class="btn-save"><i class="fas fa-save"></i> Lưu</button>
                <?php if ($action === 'edit'): ?>
                <a href="quanly_users.php" class="btn-cancel">Hủy</a>
                <?php endif; ?>
            </form>
        </div>

        <div class="recent-posts" style="margin: 20px;">
            <h2>Danh sách Người dùng (<?= count($items) ?>)</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Họ tên</th>
                        <th>Tên đăng nhập</th>
                        <th>Email</th>
                        <th>Quyền</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($items as $user): ?>
                    <tr>
                        <td><?= $user['id'] ?></td>
                        <td><?= htmlspecialchars($user['ho_ten']) ?></td>
                        <td><?= htmlspecialchars($user['username']) ?></td>
                        <td><?= htmlspecialchars($user['email']) ?></td>
                        <td><?= ($user['role'] == 1) ? '<strong><i class="fas fa-user-shield"></i> Admin</strong>' : '<i class="fas fa-user-edit"></i> Tác giả' ?></td>
                        <td class="actions">
                            <a href="quanly_users.php?action=edit&id=<?= $user['id'] ?>" class="btn-edit"><i class="fas fa-edit"></i> Sửa</a>
                            <?php if ($user['id'] != $CURRENT_USER_ID): // Không cho tự xóa mình ?>
                            <a href="quanly_users.php?action=delete&id=<?= $user['id'] ?>" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này?');"><i class="fas fa-trash"></i> Xóa</a>
                            <?php endif; ?>
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