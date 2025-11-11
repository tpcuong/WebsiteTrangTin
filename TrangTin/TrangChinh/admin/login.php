<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
include_once '../config.php'; 

// Nếu đã đăng nhập, chuyển thẳng vào dashboard
if (isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit;
}

$error_message = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if (empty($username) || empty($password)) {
        $error_message = "Vui lòng nhập cả tên đăng nhập và mật khẩu.";
    } else {
        $sql = "SELECT id, username, password, ho_ten, role FROM users WHERE username = ? LIMIT 1";
        
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();

        if ($user && password_verify($password, $user['password'])) {
            session_regenerate_id(true); 
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['user_name'] = $user['ho_ten'];
            $_SESSION['user_role'] = $user['role']; 
            header("Location: index.php");
            exit;
        } else {
            $error_message = "Tên đăng nhập hoặc mật khẩu không đúng.";
        }
        $stmt->close();
    }
}
$conn->close();
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập Admin</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f2f5; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .login-box { background: #fff; padding: 30px 40px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); width: 360px; text-align: center; }
        h1 { color: #333; margin-top: 0; margin-bottom: 25px; font-size: 1.8rem; }
        .input-group { margin-bottom: 20px; text-align: left; }
        .input-group label { display: block; margin-bottom: 8px; font-weight: bold; }
        .input-group input { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; font-size: 16px; }
        button { width: 100%; padding: 12px; background: #e74c3c; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; font-weight: bold; transition: background 0.3s; }
        button:hover { background: #c0392b; }
        .error { color: red; margin-bottom: 15px; font-size: 14px; }
        
        .login-links { 
            margin-top: 20px; 
            font-size: 14px; 
            display: flex; 
            justify-content: space-between;
        }
        .login-links a { 
            color: #007bff; 
            text-decoration: none; 
        }
        .login-links a:hover { text-decoration: underline; }

        /* ============================================== */
        /* == 📍 CSS MỚI CHO NÚT "KHÁCH" == */
        /* ============================================== */
        .guest-login {
            display: block;
            margin-top: 15px;
            padding: 10px;
            background: #f0f2f5;
            color: #555;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 500;
            transition: background 0.3s;
        }
        .guest-login:hover {
            background: #e9ecef;
            color: #000;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h1>Admin Dashboard - Y2K TECK</h1>
        
        <?php if (!empty($error_message)): ?>
            <p class="error"><?= $error_message ?></p>
        <?php endif; ?>

        <form action="login.php" method="POST">
            <div class="input-group">
                <label for="username">Tên đăng nhập:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Đăng nhập</button>
        </form>

        <div class="login-links">
            <a href="forgot_password.php">Quên mật khẩu?</a>
            <a href="register.php">Đăng ký Tác giả</a>
        </div>

        <a href="../index.php" class="guest-login">
            &#8592; Quay lại (Đăng nhập với tư cách Khách)
        </a>

    </div>
</body>
</html>