<?php
// Đặt file này vào thư mục admin/ và gọi là tao_admin_moi.php
// CHẠY 1 LẦN RỒI XÓA NGAY!

include '../config.php'; // Đảm bảo file config.php ở đúng đường dẫn

// --- Thông tin admin bạn muốn tạo ---
$username = "admin2";
$password_chua_hash = "admin12345"; // Mật khẩu là "admin"
$ho_ten = "Admin";
$email = "admin1@example.com"; // <-- NẾU EMAIL NÀY ĐÃ TỒN TẠI, HÃY ĐỔI NÓ
$role = 1; // 1 = Admin
// ---------------------------------

// Hash mật khẩu
$password_hashed = password_hash($password_chua_hash, PASSWORD_DEFAULT);

// Kiểm tra xem username hoặc email đã tồn tại chưa
$stmt_check = $conn->prepare("SELECT id FROM users WHERE username = ? OR email = ?");
$stmt_check->bind_param("ss", $username, $email);
$stmt_check->execute();
$result_check = $stmt_check->get_result();

if ($result_check->num_rows > 0) {
    echo "<h1>LỖI!</h1>";
    echo "<p>Tên đăng nhập <strong>'".htmlspecialchars($username)."'</strong> hoặc Email <strong>'".htmlspecialchars($email)."'</strong> đã tồn tại.</p>";
    echo "<p>Vui lòng xóa user cũ trong phpMyAdmin hoặc đổi Tên đăng nhập/Email trong file này.</p>";
} else {
    // Chuẩn bị câu lệnh
    $sql = "INSERT INTO users (username, password, ho_ten, email, role) 
            VALUES (?, ?, ?, ?, ?)";

    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        die("Lỗi prepare: " . $conn->error);
    }

    $stmt->bind_param("ssssi", $username, $password_hashed, $ho_ten, $email, $role);

    if ($stmt->execute()) {
        echo "<h1>TẠO TÀI KHOẢN ADMIN THÀNH CÔNG!</h1>";
        echo "<p>Tên đăng nhập: <strong>" . htmlspecialchars($username) . "</strong></p>";
        echo "<p>Mật khẩu: <strong>" . htmlspecialchars($password_chua_hash) . "</strong></p>";
        echo "<h2 style='color:red;'>VUI LÒNG XÓA FILE NÀY NGAY LẬP TỨC VÌ LÝ DO BẢO MẬT!</h2>";
    } else {
        echo "LỖI KHI TẠO ADMIN: " . $stmt->error;
    }
    $stmt->close();
}
$stmt_check->close();
$conn->close();
?>