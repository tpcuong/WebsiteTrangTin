<?php
// File: admin/logout.php
// Nhiệm vụ: Hủy session và CHUYỂN HƯỚNG về trang login.php

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Xóa tất cả các biến session
$_SESSION = array();

// Nếu có cookie session, cũng xóa nó đi
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

// Hủy session
session_destroy();

// Chuyển hướng về trang đăng nhập
header("Location: ../index.php");
exit;
?>