<?php
// File: admin/ajax_login.php

// SỬA: Phải có session_start() ở ĐẦU TIÊN
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
// SỬA: Đường dẫn phải là '../config.php' để đi lùi ra
include_once '../config.php';

// Thiết lập header để trả về JSON
header('Content-Type: application/json');

// Kiểm tra xem có phải là POST request không
if ($_SERVER["REQUEST_METHOD"] != "POST") {
    echo json_encode(['success' => false, 'message' => 'Yêu cầu không hợp lệ.']);
    exit;
}

$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

if (empty($username) || empty($password)) {
    echo json_encode(['success' => false, 'message' => 'Vui lòng nhập tên đăng nhập và mật khẩu.']);
    exit;
}

// Lấy thông tin user từ CSDL
$sql = "SELECT id, username, password, ho_ten, role FROM users WHERE username = ? LIMIT 1";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
$stmt->close();
$conn->close();

// Kiểm tra mật khẩu
if ($user && password_verify($password, $user['password'])) {
    // Đăng nhập thành công!
    
    // Lưu thông tin vào Session
    session_regenerate_id(true); 
    $_SESSION['user_id'] = $user['id'];
    $_SESSION['user_name'] = $user['ho_ten'];
    $_SESSION['user_role'] = $user['role']; 

    // Trả về kết quả thành công
    echo json_encode(['success' => true]);
} else {
    // Đăng nhập thất bại
    echo json_encode(['success' => false, 'message' => 'Tên đăng nhập hoặc mật khẩu không đúng.']);
}
exit;
?>