<?php
// 1. GỌI "GÁC CỔNG" VÀ FUNCTIONS
include 'check_auth.php'; 
include '../functions.php'; 

// Xử lý các thông báo (ví dụ: ?success=1, ?error=2)
$message = '';
if (isset($_GET['success'])) {
    $messages = [
        '1' => 'Tạo bài viết mới thành công! Bạn có thể bắt đầu thêm nội dung.',
        '2' => 'Cập nhật thông tin bài viết thành công!',
        '3' => 'Xóa bài viết thành công!',
    ];
    $message = '<div class="notice success">' . $messages[$_GET['success']] . '</div>';
}
if (isset($_GET['error'])) {
    $errors = [
        '1' => 'Hành động không được phép! Bạn không phải tác giả của bài viết này.',
        '2' => 'Không tìm thấy bài viết.',
        '3' => 'Có lỗi xảy ra, vui lòng thử lại.',
        '4' => 'Lỗi upload hình ảnh. Chỉ chấp nhận file JPG, PNG, JPEG, GIF.',
        '5' => 'Dữ liệu không hợp lệ. Vui lòng nhập Tiêu đề và Lĩnh vực.',
    ];
    $message = '<div class="notice error">' . $errors[$_GET['error']] . '</div>';
}

$action = $_GET['action'] ?? 'list'; // Mặc định là 'list'
$post_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$post = null; // Biến giữ thông tin bài viết khi edit

// 2. XỬ LÝ LƯU (THÊM MỚI HOẶC CẬP NHẬT)
if ($action === 'save' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int)$_POST['id'];
    $tieu_de = trim($_POST['tieu_de']);
    $mo_ta_ngan = trim($_POST['mo_ta_ngan']);
    $id_linhvuc = (int)$_POST['id_linhvuc'];
    $current_image = $_POST['current_image'];
    $hinh_anh = $current_image; // Mặc định giữ ảnh cũ
    
    // Kiểm tra dữ liệu
    if (empty($tieu_de) || $id_linhvuc <= 0) {
        $error_action = $id ? 'edit&id='.$id : 'add';
        header('Location: quanly_baiviet.php?action=' . $error_action . '&error=5');
        exit;
    }

    // Xử lý upload ảnh mới
    if (isset($_FILES['hinh_anh']) && $_FILES['hinh_anh']['error'] == 0) {
        $target_dir = "../images/"; // Thư mục images ở ngoài TrangChinh
        $file_name = uniqid() . '-' . basename($_FILES["hinh_anh"]["name"]); // Thêm uniqid để tránh trùng tên file
        $target_file = $target_dir . $file_name;
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

        // Kiểm tra file ảnh
        $check = @getimagesize($_FILES["hinh_anh"]["tmp_name"]);
        if($check !== false && in_array($imageFileType, ['jpg', 'png', 'jpeg', 'gif'])) {
            if (move_uploaded_file($_FILES["hinh_anh"]["tmp_name"], $target_file)) {
                $hinh_anh = 'images/' . $file_name;
            } else {
                $error_action = $id ? 'edit&id='.$id : 'add';
                header('Location: quanly_baiviet.php?action=' . $error_action . '&error=4');
                exit;
            }
        } else {
            $error_action = $id ? 'edit&id='.$id : 'add';
            header('Location: quanly_baiviet.php?action=' . $error_action . '&error=4');
            exit;
        }
    }

    if ($id > 0) {
        // --- CẬP NHẬT BÀI VIẾT ---
        $sql = "UPDATE baiviet SET tieu_de = ?, mo_ta_ngan = ?, hinh_anh = ?, id_linhvuc = ? WHERE id = ?";
        $params = [$tieu_de, $mo_ta_ngan, $hinh_anh, $id_linhvuc, $id];
        $types = "sssii";
        
        // Kiểm tra quyền: Admin hoặc Tác giả sở hữu
        if ($IS_AUTHOR) {
            $check_owner = fetchAll($conn, "SELECT id_tacgia FROM baiviet WHERE id = ?", 'i', [$id]);
            if (!$check_owner || $check_owner[0]['id_tacgia'] != $CURRENT_USER_ID) {
                header('Location: quanly_baiviet.php?error=1'); // Không có quyền
                exit;
            }
        }
        
        $stmt = $conn->prepare($sql);
        $stmt->bind_param($types, ...$params);
        $stmt->execute();
        $stmt->close();
        
        header('Location: quanly_baiviet.php?success=2');
    } else {
        // --- THÊM MỚI BÀI VIẾT ---
        $sql = "INSERT INTO baiviet (tieu_de, mo_ta_ngan, hinh_anh, id_linhvuc, id_tacgia) VALUES (?, ?, ?, ?, ?)";
        $params = [$tieu_de, $mo_ta_ngan, $hinh_anh, $id_linhvuc, $CURRENT_USER_ID]; // Gán ID tác giả
        $types = "sssii";
        
        $stmt = $conn->prepare($sql);
        $stmt->bind_param($types, ...$params);
        $stmt->execute();
        $new_post_id = $stmt->insert_id; // Lấy ID của bài vừa tạo
        $stmt->close();
        
        // Chuyển hướng thẳng đến trang soạn thảo nội dung
        header('Location: quanly_noidung.php?post_id=' . $new_post_id . '&success=1');
    }
    exit;
}

// 3. XỬ LÝ XÓA BÀI VIẾT
if ($action === 'delete' && $post_id > 0) {
    // Kiểm tra quyền: Admin hoặc Tác giả sở hữu
    if ($IS_AUTHOR) {
        $check_owner = fetchAll($conn, "SELECT id_tacgia FROM baiviet WHERE id = ?", 'i', [$post_id]);
        if (!$check_owner || $check_owner[0]['id_tacgia'] != $CURRENT_USER_ID) {
            header('Location: quanly_baiviet.php?error=1'); // Không có quyền
            exit;
        }
    }
    
    $stmt = $conn->prepare("DELETE FROM baiviet WHERE id = ?");
    $stmt->bind_param('i', $post_id);
    $stmt->execute();
    $stmt->close();
    
    header('Location: quanly_baiviet.php?success=3');
    exit;
}

// 4. HIỂN THỊ FORM THÊM/SỬA
if ($action === 'add' || $action === 'edit') {
    if ($action === 'edit' && $post_id > 0) {
        // Lấy thông tin bài viết để edit
        $post_data = fetchAll($conn, "SELECT * FROM baiviet WHERE id = ?", 'i', [$post_id]);
        if (!$post_data) {
            header('Location: quanly_baiviet.php?error=2');
            exit;
        }
        $post = $post_data[0];
        
        // Kiểm tra quyền Tác giả
        if ($IS_AUTHOR && $post['id_tacgia'] != $CURRENT_USER_ID) {
            header('Location: quanly_baiviet.php?error=1');
            exit;
        }
    }
    
    // Lấy danh sách lĩnh vực cho dropdown
    $categories = fetchAll($conn, "SELECT id, ten_linhvuc FROM linhvuc ORDER BY ten_linhvuc ASC");
    
    // Hiển thị HTML của Form
    ?>
    <!DOCTYPE html>
    <html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title><?= $action === 'add' ? 'Thêm bài viết mới' : 'Sửa thông tin bài viết' ?></title>
        <link rel="stylesheet" href="css/admin_style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body>
    <div class="admin-wrapper">
        <?php include 'sidebar.php'; // Nhúng menu sidebar ?>
        <main class="main-content">
            <header class="admin-header">
                <div class="page-header"> 
                    <h1><?= $action === 'add' ? 'Bước 1: Tạo bài viết mới' : 'Sửa thông tin bài viết' ?></h1>
                    <?php if ($action === 'edit' && $post): ?>
                        <a href="quanly_noidung.php?post_id=<?= $post['id'] ?>" class="btn-add-new" style="background-color: #3498db;">
                            <i class="fas fa-file-alt"></i> Soạn thảo nội dung chi tiết
                        </a>
                    <?php endif; ?>
                </div>
                <div class="admin-user">
                    <span>Chào, <strong><?= htmlspecialchars($_SESSION['user_name']) ?></strong>!</span>
                    <a href="logout.php" class="logout-btn">Đăng xuất</a>
                </div>
            </header>
            
            <div class="form-container">
                <?= $message // Hiển thị thông báo lỗi nếu có ?>
                
                <form action="quanly_baiviet.php?action=save" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="<?= $post['id'] ?? 0 ?>">
                    <input type="hidden" name="current_image" value="<?= htmlspecialchars($post['hinh_anh'] ?? '') ?>">
                    
                    <div class="form-group">
                        <label for="tieu_de">Tiêu đề (Bắt buộc)</label>
                        <input type="text" id="tieu_de" name="tieu_de" value="<?= htmlspecialchars($post['tieu_de'] ?? '') ?>" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="id_linhvuc">Lĩnh vực (Bắt buộc)</label>
                        <select id="id_linhvuc" name="id_linhvuc" required>
                            <option value="">-- Chọn lĩnh vực --</option>
                            <?php foreach ($categories as $cat): ?>
                                <option value="<?= $cat['id'] ?>" <?= (isset($post['id_linhvuc']) && $post['id_linhvuc'] == $cat['id']) ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($cat['ten_linhvuc']) ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="mo_ta_ngan">Mô tả ngắn (Sapo)</label>
                        <textarea id="mo_ta_ngan" name="mo_ta_ngan" rows="5"><?= htmlspecialchars($post['mo_ta_ngan'] ?? '') ?></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label for="hinh_anh">Ảnh đại diện (<?= $action == 'add' ? 'Bắt buộc' : 'Để trống nếu không muốn đổi' ?>)</label>
                        <input type="file" id="hinh_anh" name="hinh_anh" accept="image/*" <?= $action == 'add' ? 'required' : '' ?>>
                        <?php if (!empty($post['hinh_anh'])): ?>
                            <p style="margin-top:10px;">Ảnh hiện tại:</p>
                            <img src="../<?= htmlspecialchars($post['hinh_anh']) ?>" alt="Ảnh hiện tại">
                        <?php endif; ?>
                    </div>
                    
                    <button type="submit" class="btn-save"><i class="fas fa-save"></i> <?= $action === 'add' ? 'Tạo bài và Tiếp tục' : 'Lưu thay đổi' ?></button>
                    <a href="quanly_baiviet.php" class="btn-cancel">Hủy</a>
                </form>
            </div>
        </main>
    </div>
    </body>
    </html>
    <?php
    exit; // Dừng tại đây sau khi hiển thị form
}

// 5. HIỂN THỊ DANH SÁCH BÀI VIẾT (MẶC ĐỊNH)
$sql_list = "
    SELECT b.id, b.tieu_de, l.ten_linhvuc, u.ho_ten as ten_tacgia, b.ngay_dang
    FROM baiviet b
    LEFT JOIN linhvuc l ON b.id_linhvuc = l.id
    LEFT JOIN users u ON b.id_tacgia = u.id
";
$params_list = [];
$types_list = '';

if ($IS_AUTHOR) {
    $sql_list .= " WHERE b.id_tacgia = ? ";
    $params_list[] = $CURRENT_USER_ID;
    $types_list = 'i';
}
$sql_list .= " ORDER BY b.ngay_dang DESC";
$posts = fetchAll($conn, $sql_list, $types_list, $params_list);

?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Bài viết</title>
    <link rel="stylesheet" href="css/admin_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="admin-wrapper">
    <?php include 'sidebar.php'; // Nhúng menu sidebar ?>
    <main class="main-content">
        <header class="admin-header">
            <div class="page-header">
                <h1>Quản lý Bài viết (<?= count($posts) ?>)</h1>
                <a href="quanly_baiviet.php?action=add" class="btn-add-new"><i class="fas fa-plus"></i> Thêm bài mới</a>
            </div>
            <div class="admin-user">
                <span>Chào, <strong><?= htmlspecialchars($_SESSION['user_name']) ?></strong>!</span>
                <a href="logout.php" class="logout-btn">Đăng xuất</a>
            </div>
        </header>
        
        <div class="recent-posts" style="margin: 20px;">
            <?= $message // Hiển thị thông báo thành công/lỗi ?>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tiêu đề</th>
                        <th>Lĩnh vực</th>
                        <?php if ($IS_ADMIN) echo '<th>Tác giả</th>'; ?>
                        <th>Ngày đăng</th>
                        <th>Hành động</th> </tr>
                </thead>
                <tbody>
                    <?php if ($posts): ?>
                        <?php foreach ($posts as $post): ?>
                        <tr>
                            <td><?= $post['id'] ?></td>
                            <td><?= htmlspecialchars($post['tieu_de']) ?></td>
                            <td><?= htmlspecialchars($post['ten_linhvuc'] ?? 'N/A') ?></td>
                            <?php if ($IS_ADMIN) echo '<td>' . htmlspecialchars($post['ten_tacgia'] ?? 'N/A') . '</td>'; ?>
                            <td><?= date('d-m-Y', strtotime($post['ngay_dang'])) ?></td>
                            <td class="actions">
                                <a href="quanly_baiviet.php?action=edit&id=<?= $post['id'] ?>" class="btn-edit" title="Sửa thông tin"><i class="fas fa-info-circle"></i> Sửa TT</a>
                                <a href="quanly_noidung.php?post_id=<?= $post['id'] ?>" class="btn-edit" style="background-color: #3498db;" title="Soạn thảo nội dung">
                                    <i class="fas fa-file-alt"></i> Nội dung
                                </a>
                                <a href="quanly_baiviet.php?action=delete&id=<?= $post['id'] ?>" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa bài viết này? Mọi dữ liệu liên quan (nội dung, bình luận) sẽ bị xóa vĩnh viễn.');"><i class="fas fa-trash"></i> Xóa</a>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="<?= $IS_ADMIN ? 6 : 5 ?>" style="text-align: center;">Không có bài viết nào.</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </main>
</div>
<?php $conn->close(); ?>
</body>
</html>