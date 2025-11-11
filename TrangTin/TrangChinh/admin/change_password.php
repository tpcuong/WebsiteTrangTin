<?php
// Gác cổng: Phải đăng nhập mới vào được
include_once 'check_auth.php'; 
// Dùng functions để có $conn (đã được check_auth include_once)
include_once '../functions.php'; 

$error_message = '';
$success_message = '';
$is_forced_change = isset($_GET['force']); // Kiểm tra xem có bị ép đổi pass không

// Lấy pass hash hiện tại của user
$stmt_current = $conn->prepare("SELECT password FROM users WHERE id = ?");
$stmt_current->bind_param("i", $CURRENT_USER_ID);
$stmt_current->execute();
$result_current = $stmt_current->get_result();
$user_data = $result_current->fetch_assoc();
$stmt_current->close();

$is_default_password = password_verify('12345', $user_data['password']);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $old_password = $_POST['old_password'];
    $new_password = $_POST['new_password'];
    $new_password_confirm = $_POST['new_password_confirm'];

    // 1. Kiểm tra mật khẩu cũ (nếu KHÔNG PHẢI là bị ép đổi)
    if (!$is_default_password && !password_verify($old_password, $user_data['password'])) {
        $error_message = "Mật khẩu cũ không đúng.";
    }
    // 2. Kiểm tra mật khẩu mới
    elseif (empty($new_password) || strlen($new_password) < 6) {
        $error_message = "Mật khẩu mới phải có ít nhất 6 ký tự.";
    } elseif ($new_password != $new_password_confirm) {
        $error_message = "Mật khẩu mới nhập lại không khớp.";
    } elseif ($new_password == '12345') {
        $error_message = "Bạn không thể đặt mật khẩu mới là '12345'.";
    } else {
        // 3. Cập nhật mật khẩu
        $new_password_hashed = password_hash($new_password, PASSWORD_DEFAULT);
        $stmt_update = $conn->prepare("UPDATE users SET password = ? WHERE id = ?");
        $stmt_update->bind_param("si", $new_password_hashed, $CURRENT_USER_ID);
        
        if ($stmt_update->execute()) {
            $success_message = "Đổi mật khẩu thành công! Bạn sẽ được chuyển hướng sau 3 giây...";
            // Chuyển hướng về Dashboard
            header("refresh:3;url=index.php");
        } else {
            $error_message = "Đã có lỗi xảy ra. Vui lòng thử lại.";
        }
        $stmt_update->close();
    }
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đổi mật khẩu</title>
    <link rel="stylesheet" href="css/admin_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="admin-wrapper">
    
    <?php include 'sidebar.php'; // Nhúng menu sidebar ?>
    
    <main class="main-content">
        <header class="admin-header">
            <h1>Đổi mật khẩu</h1>
            <div class="admin-user">
                <span>Chào, <strong><?= htmlspecialchars($_SESSION['user_name']) ?></strong>!</span>
                <a href="logout.php" class="logout-btn">Đăng xuất</a>
            </div>
        </header>
        
        <div class="form-container">
            <?php if ($is_forced_change && empty($success_message)): ?>
                <div class="notice error">
                    <strong>Bắt buộc:</strong> Mật khẩu của bạn đã được reset về '12345'. Vui lòng đổi mật khẩu mới để tiếp tục.
                </div>
            <?php endif; ?>

            <?php if (!empty($error_message)): ?>
                <div class="notice error"><?= $error_message ?></div>
            <?php endif; ?>
            <?php if (!empty($success_message)): ?>
                <div class="notice success"><?= $success_message ?></div>
            <?php endif; ?>

            <?php if (empty($success_message)): // Ẩn form nếu thành công ?>
            <form action="change_password.php<?= $is_forced_change ? '?force=1' : '' ?>" method="POST">
                
                <?php if (!$is_default_password): // Nếu pass KHÔNG phải 12345, mới yêu cầu pass cũ ?>
                <div class="form-group">
                    <label for="old_password">Mật khẩu cũ:</label>
                    <input type="password" id="old_password" name="old_password" required>
                </div>
                <?php endif; ?>

                <div class="form-group">
                    <label for="new_password">Mật khẩu mới (ít nhất 6 ký tự):</label>
                    <input type="password" id="new_password" name="new_password" required>
                </div>
                <div class="form-group">
                    <label for="new_password_confirm">Nhập lại mật khẩu mới:</label>
                    <input type="password" id="new_password_confirm" name="new_password_confirm" required>
                </div>
                <button type="submit" class="btn-save"><i class="fas fa-save"></i> Lưu mật khẩu</button>
            </form>
            <?php endif; ?>
        </div>
    </main>
</div>
<?php $conn->close(); ?>
</body>
</html>