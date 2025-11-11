<?php
include_once '../config.php'; 

$error_message = '';
$success_message = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $email = trim($_POST['email']);

    if (empty($username) || empty($email)) {
        $error_message = "Vui lòng nhập Tên đăng nhập và Email.";
    } else {
        // Tìm user có cả username VÀ email khớp
        $stmt_check = $conn->prepare("SELECT id FROM users WHERE username = ? AND email = ?");
        $stmt_check->bind_param("ss", $username, $email);
        $stmt_check->execute();
        $result_check = $stmt_check->get_result();

        if ($result_check->num_rows == 1) {
            $user = $result_check->fetch_assoc();
            $user_id = $user['id'];
            
            // Reset mật khẩu về '12345'
            $new_password_hashed = password_hash('12345', PASSWORD_DEFAULT);
            
            $stmt_update = $conn->prepare("UPDATE users SET password = ? WHERE id = ?");
            $stmt_update->bind_param("si", $new_password_hashed, $user_id);
            
            if ($stmt_update->execute()) {
                $success_message = "Mật khẩu của bạn đã được reset thành <b>12345</b>. Vui lòng đăng nhập và đổi mật khẩu ngay lập tức.";
            } else {
                $error_message = "Không thể reset mật khẩu. Vui lòng thử lại.";
            }
            $stmt_update->close();
        } else {
            $error_message = "Tên đăng nhập hoặc Email không đúng.";
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
    <title>Quên mật khẩu</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f2f5; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .login-box { background: #fff; padding: 30px 40px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); width: 360px; text-align: center; }
        h1 { color: #333; margin-top: 0; margin-bottom: 10px; font-size: 1.8rem; }
        p.desc { font-size: 14px; color: #555; margin-bottom: 25px; }
        .input-group { margin-bottom: 20px; text-align: left; }
        .input-group label { display: block; margin-bottom: 8px; font-weight: bold; }
        .input-group input { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; font-size: 16px; }
        button { width: 100%; padding: 12px; background: #e74c3c; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; font-weight: bold; transition: background 0.3s; }
        button:hover { background: #c0392b; }
        .error { color: red; margin-bottom: 15px; font-size: 14px; }
        .success { color: green; margin-bottom: 15px; font-size: 14px; line-height: 1.5; }
        .login-links { margin-top: 20px; font-size: 14px; }
        .login-links a { color: #007bff; text-decoration: none; }
        .login-links a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="login-box">
        <h1>Quên mật khẩu</h1>
        <p class="desc">Nhập Tên đăng nhập và Email của bạn. Mật khẩu sẽ được reset về <b>12345</b>.</p>

        <?php if (!empty($error_message)): ?>
            <p class="error"><?= $error_message ?></p>
        <?php endif; ?>
        <?php if (!empty($success_message)): ?>
            <p class="success"><?= $success_message ?></p>
        <?php endif; ?>

        <?php if (empty($success_message)): // Ẩn form nếu thành công ?>
        <form action="forgot_password.php" method="POST">
            <div class="input-group">
                <label for="username">Tên đăng nhập:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <button type="submit">Reset mật khẩu</button>
        </form>
        <?php endif; ?>
        
        <div class="login-links">
            <a href="login.php">Quay lại trang Đăng nhập</a>
        </div>
    </div>
</body>
</html>