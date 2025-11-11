<?php
session_start();
include_once '../config.php'; // Dùng include_once để tránh lỗi

// Nếu đã đăng nhập, không cho đăng ký
if (isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit;
}

$error_message = '';
$success_message = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $ho_ten = trim($_POST['ho_ten']);
    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = $_POST['password'];
    $password_confirm = $_POST['password_confirm'];

    if (empty($ho_ten) || empty($username) || empty($email) || empty($password)) {
        $error_message = "Vui lòng điền đầy đủ các trường bắt buộc.";
    } elseif ($password != $password_confirm) {
        $error_message = "Mật khẩu nhập lại không khớp.";
    } elseif (strlen($password) < 6) {
        $error_message = "Mật khẩu phải có ít nhất 6 ký tự.";
    } else {
        // Kiểm tra xem username hoặc email đã tồn tại chưa
        $stmt_check = $conn->prepare("SELECT id FROM users WHERE username = ? OR email = ?");
        $stmt_check->bind_param("ss", $username, $email);
        $stmt_check->execute();
        $result_check = $stmt_check->get_result();

        if ($result_check->num_rows > 0) {
            $error_message = "Tên đăng nhập hoặc Email đã tồn tại.";
        } else {
            // Hash mật khẩu
            $password_hashed = password_hash($password, PASSWORD_DEFAULT);
            $default_role = 0; // 0 = Tác giả

            // Thêm user mới
            $stmt_insert = $conn->prepare("INSERT INTO users (ho_ten, username, email, password, role) VALUES (?, ?, ?, ?, ?)");
            $stmt_insert->bind_param("ssssi", $ho_ten, $username, $email, $password_hashed, $default_role);
            
            if ($stmt_insert->execute()) {
                $success_message = "Đăng ký thành công! Bạn có thể đăng nhập ngay bây giờ.";
            } else {
                $error_message = "Đã có lỗi xảy ra. Vui lòng thử lại.";
            }
            $stmt_insert->close();
        }
        $stmt_check->close();
    }
}
$conn->close();
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký tài khoản</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f2f5; display: flex; justify-content: center; align-items: center; min-height: 100vh; padding: 20px 0; }
        .login-box { background: #fff; padding: 30px 40px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); width: 360px; text-align: center; }
        h1 { color: #333; margin-top: 0; margin-bottom: 25px; font-size: 1.8rem; }
        .input-group { margin-bottom: 20px; text-align: left; }
        .input-group label { display: block; margin-bottom: 8px; font-weight: bold; }
        .input-group input { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; font-size: 16px; }
        button { width: 100%; padding: 12px; background: #2ecc71; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; font-weight: bold; transition: background 0.3s; }
        button:hover { background: #27ae60; }
        .error { color: red; margin-bottom: 15px; font-size: 14px; }
        .success { color: green; margin-bottom: 15px; font-size: 14px; }
        .login-links { margin-top: 20px; font-size: 14px; }
        .login-links a { color: #007bff; text-decoration: none; }
        .login-links a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="login-box">
        <h1>Đăng ký Tác giả</h1>
        
        <?php if (!empty($error_message)): ?>
            <p class="error"><?= $error_message ?></p>
        <?php endif; ?>
        <?php if (!empty($success_message)): ?>
            <p class="success"><?= $success_message ?></p>
        <?php endif; ?>

        <?php if (empty($success_message)): // Ẩn form nếu đăng ký thành công ?>
        <form action="register.php" method="POST">
            <div class="input-group">
                <label for="ho_ten">Họ và tên:</label>
                <input type="text" id="ho_ten" name="ho_ten" required>
            </div>
            <div class="input-group">
                <label for="username">Tên đăng nhập:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="input-group">
                <label for="password">Mật khẩu (ít nhất 6 ký tự):</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="input-group">
                <label for="password_confirm">Nhập lại mật khẩu:</label>
                <input type="password" id="password_confirm" name="password_confirm" required>
            </div>
            <button type="submit">Đăng ký</button>
        </form>
        <?php endif; ?>

        <div class="login-links">
            <a href="login.php">Quay lại trang Đăng nhập</a>
        </div>
    </div>
</body>
</html>