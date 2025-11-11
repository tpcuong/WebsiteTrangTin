<?php
// Bắt đầu session để có thể dùng cho các thông báo
session_start();

// 1. Kết nối đến cơ sở dữ liệu
include 'config.php';

// 2. Chỉ chấp nhận phương thức POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // 3. Lấy và kiểm tra dữ liệu từ form
    $post_id = isset($_POST['post_id']) ? (int)$_POST['post_id'] : 0;
    
    $content = isset($_POST['comment_content']) ? trim($_POST['comment_content']) : '';
    $name = isset($_POST['author_name']) ? trim($_POST['author_name']) : '';
    $phone = isset($_POST['author_phone']) ? trim($_POST['author_phone']) : ''; // SĐT là tùy chọn

    // 4. Kiểm tra dữ liệu bắt buộc
    if ($post_id <= 0 || empty($content) || empty($name)) {
        header('Location: chitiet.php?id=' . $post_id . '&comment=error');
        exit;
    }

    // 5. Chuẩn bị câu lệnh SQL
    // =======================================================
    // == 📍 SỬA TẠI ĐÂY: Đổi giá trị '0' thành '1' (Tự động duyệt) ==
    $sql = "INSERT INTO binhluan (id_baiviet, ten_tac_gia, sdt_tac_gia, noi_dung, trang_thai) 
            VALUES (?, ?, ?, ?, 1)";
    // =======================================================


    $stmt = $conn->prepare($sql);

    if ($stmt === false) {
        die("Lỗi chuẩn bị SQL: " . $conn->error);
    }

    // 6. Gán biến vào câu lệnh (i = integer, s = string)
    $stmt->bind_param("isss", $post_id, $name, $phone, $content);

    // 7. Thực thi câu lệnh và chuyển hướng
    if ($stmt->execute()) {
        // =======================================================
        // == 📍 SỬA TẠI ĐÂY: Thay đổi câu thông báo ==
        $_SESSION['flash_message'] = "Gửi bình luận thành công!";
        // =======================================================
        
        // Chuyển hướng về bài viết (và thêm #comment-section để cuộn xuống)
        header('Location: chitiet.php?id=' . $post_id . '#comment-section');
    } else {
        header('Location: chitiet.php?id=' . $post_id . '&comment=error');
    }

    // 8. Đóng kết nối
    $stmt->close();
    $conn->close();

} else {
    // Nếu ai đó cố gắng truy cập file này trực tiếp
    header('Location: index.php');
}

exit; // Luôn exit sau khi chuyển hướng
?>