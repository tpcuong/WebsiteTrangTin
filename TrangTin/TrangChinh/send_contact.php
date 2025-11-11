<?php
/* Tệp: send_contact.php */
include 'functions.php'; // Dùng lại session_start() và config.php

// 1. Kiểm tra xem form đã được gửi chưa
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // 2. Lấy dữ liệu an toàn
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $message = trim($_POST['message']);

    // 3. Xác thực dữ liệu cơ bản
    if (!empty($name) && !empty($email) && !empty($message) && filter_var($email, FILTER_VALIDATE_EMAIL)) {

        /* * LỰA CHỌN B: LƯU VÀO DATABASE (Dễ hơn, được khuyến nghị)
         * --------------------------------------------------
         * (Bạn cần tạo bảng 'lienhe' trong database trước)
         */
        
        $sql = "INSERT INTO lienhe (ten_nguoi_gui, email, noi_dung) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sss", $name, $email, $message);
        
        if ($stmt->execute()) {
            $_SESSION['flash_message'] = "Cảm ơn bạn đã liên hệ! Chúng tôi sẽ phản hồi sớm.";
        } else {
            $_SESSION['flash_message'] = "Lỗi: Không thể gửi tin nhắn. Vui lòng thử lại sau.";
        }
        $stmt->close();

    } else {
        // Nếu dữ liệu không hợp lệ
        $_SESSION['flash_message'] = "Lỗi: Vui lòng điền đầy đủ và đúng định dạng thông tin.";
    }

    // 4. Quay lại trang chủ (vị trí có form liên hệ)
    header("Location: index.php#contact");
    exit;

} else {
    header("Location: index.php");
    exit;
}
?>