<?php
// Bắt đầu session nếu chưa có
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// 1. Kiểm tra xem user_id có tồn tại trong session không
if (!isset($_SESSION['user_id'])) {
    // Nếu không có session (chưa đăng nhập), chuyển hướng về trang đăng nhập
    header("Location: login.php");
    exit;
}

// =======================================================
// == 📍 BẮT ĐẦU LOGIC MỚI: ÉP ĐỔI MẬT KHẨU ==
// =======================================================
include_once '../config.php'; // Cần $conn, dùng include_once

// Lấy tên file .php hiện tại (ví dụ: 'index.php')
$current_page = basename($_SERVER['PHP_SELF']);

// Những trang được phép truy cập ngay cả khi mật khẩu là '12345'
$allowed_pages = ['change_password.php', 'logout.php'];

// Nếu user đang ở trang KHÔNG ĐƯỢC PHÉP
if (!in_array($current_page, $allowed_pages)) {
    
    // Kiểm tra mật khẩu của user
    $stmt_check = $conn->prepare("SELECT password FROM users WHERE id = ?");
    $stmt_check->bind_param("i", $_SESSION['user_id']);
    $stmt_check->execute();
    $result_check = $stmt_check->get_result();
    $user_pass_data = $result_check->fetch_assoc();
    $stmt_check->close();

    if ($user_pass_data && password_verify('12345', $user_pass_data['password'])) {
        // Nếu mật khẩu là '12345', BẮT BUỘC chuyển hướng
        // sang trang đổi mật khẩu
        header("Location: change_password.php?force=1");
        exit;
    }
}
// =======================================================
// == KẾT THÚC LOGIC MỚI ==
// =======================================================

// 3. Tạo các biến tiện ích (giữ nguyên)
$IS_ADMIN = ($_SESSION['user_role'] == 1);
$IS_AUTHOR = ($_SESSION['user_role'] == 0);
$CURRENT_USER_ID = $_SESSION['user_id'];
?>