<?php
$servername = "localhost";
$username = "root";
$password = "vertrigo";  // Rỗng mặc định
$dbname = "tincongnghe_db";

try {
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Kết nối thành công!";  // Test, xóa sau
} catch(PDOException $e) {
    die("Lỗi kết nối: " . $e->getMessage());
}
?>
