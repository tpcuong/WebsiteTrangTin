<?php
include 'check_auth.php'; 
include '../functions.php'; 

$message = '';
$post_id = isset($_GET['post_id']) ? (int)$_GET['post_id'] : 0;
if ($post_id <= 0) { 
    header('Location: quanly_baiviet.php'); 
    exit; 
}

// 1. LẤY THÔNG TIN BÀI VIẾT & KIỂM TRA QUYỀN
$post_data = fetchAll($conn, "SELECT tieu_de, id_tacgia FROM baiviet WHERE id = ?", 'i', [$post_id]);
if (!$post_data) {
    header('Location: quanly_baiviet.php?error=2'); // Không tìm thấy bài
    exit;
}
$post = $post_data[0];

// KIỂM TRA QUYỀN: Admin hoặc Tác giả sở hữu
if ($IS_AUTHOR && $post['id_tacgia'] != $CURRENT_USER_ID) {
    header('Location: quanly_baiviet.php?error=1'); // Không có quyền
    exit;
}

$action = $_GET['action'] ?? 'list';
$block_id = isset($_GET['block_id']) ? (int)$_GET['block_id'] : 0;

// 2. XỬ LÝ LƯU/CẬP NHẬT KHỐI (Khi form được POST)
if ($action === 'save_block' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $block_type = $_POST['block_type'];
    $block_content = $_POST['block_content'] ?? '';
    $existing_block_id = (int)($_POST['block_id'] ?? 0);

    // Xử lý upload ảnh
    if ($block_type === 'image' && isset($_FILES['image_file']) && $_FILES['image_file']['error'] == 0) {
        $target_dir = "../images/";
        $file_name = uniqid() . '-' . basename($_FILES["image_file"]["name"]);
        $target_file = $target_dir . $file_name;
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        
        $check = @getimagesize($_FILES["image_file"]["tmp_name"]);
        if($check !== false && in_array($imageFileType, ['jpg', 'png', 'jpeg', 'gif'])) {
            if (move_uploaded_file($_FILES["image_file"]["tmp_name"], $target_file)) {
                $block_content = 'images/' . $file_name;
            } else { $message = '<div class="notice error">Lỗi khi upload file.</div>'; }
        } else { $message = '<div class="notice error">File không phải ảnh (chấp nhận JPG, PNG, JPEG, GIF).</div>'; }
    
    } elseif ($block_type === 'image' && $existing_block_id > 0) {
         // Giữ ảnh cũ nếu không upload ảnh mới khi đang sửa
         $block_content = $_POST['current_image'] ?? $block_content;
    }

    // Lưu vào CSDL
    if (empty($message)) {
        if ($existing_block_id > 0) {
            // CẬP NHẬT KHỐI ĐÃ CÓ
            $stmt = $conn->prepare("UPDATE content_blocks SET block_type = ?, block_content = ? WHERE id = ? AND id_baiviet = ?");
            $stmt->bind_param("ssii", $block_type, $block_content, $existing_block_id, $post_id);
        } else {
            // THÊM KHỐI MỚI
            // Lấy block_order lớn nhất và cộng thêm 10
            $max_order_result = fetchAll($conn, "SELECT MAX(block_order) as max_o FROM content_blocks WHERE id_baiviet = ?", 'i', [$post_id]);
            $new_order = ($max_order_result[0]['max_o'] ?? 0) + 10;
            
            $stmt = $conn->prepare("INSERT INTO content_blocks (id_baiviet, block_order, block_type, block_content) VALUES (?, ?, ?, ?)");
            $stmt->bind_param("iiss", $post_id, $new_order, $block_type, $block_content);
        }
        
        if ($stmt->execute()) {
            $message = '<div class="notice success">Lưu khối nội dung thành công!</div>';
        } else {
            $message = '<div class="notice error">Lỗi CSDL: ' . $stmt->error . '</div>';
        }
        $stmt->close();
    }
    $action = 'list'; // Quay về danh sách sau khi lưu
}

// 3. XỬ LÝ XÓA KHỐI
if ($action === 'delete' && $block_id > 0) {
    $stmt = $conn->prepare("DELETE FROM content_blocks WHERE id = ? AND id_baiviet = ?");
    $stmt->bind_param("ii", $block_id, $post_id);
    $stmt->execute();
    $stmt->close();
    $message = '<div class="notice success">Đã xóa khối.</div>';
    $action = 'list';
}

// 4. XỬ LÝ DI CHUYỂN KHỐI (LÊN/XUỐNG)
if ($action === 'move' && $block_id > 0) {
    $dir = $_GET['dir'] ?? 'down';
    
    // Lấy block_order hiện tại
    $current_block_q = fetchAll($conn, "SELECT block_order FROM content_blocks WHERE id = ?", 'i', [$block_id]);
    if($current_block_q) {
        $current_order = $current_block_q[0]['block_order'];

        if ($dir == 'up') {
            // Tìm khối ở TRƯỚC nó
            $prev_block_q = fetchAll($conn, "SELECT id, block_order FROM content_blocks WHERE id_baiviet = ? AND block_order < ? ORDER BY block_order DESC LIMIT 1", 'ii', [$post_id, $current_order]);
            if($prev_block_q) {
                $prev_block = $prev_block_q[0];
                // Hoán đổi block_order
                $conn->query("UPDATE content_blocks SET block_order = {$prev_block['block_order']} WHERE id = {$block_id}");
                $conn->query("UPDATE content_blocks SET block_order = {$current_order} WHERE id = {$prev_block['id']}");
            }
        } else { // dir == 'down'
            // Tìm khối ở SAU nó
            $next_block_q = fetchAll($conn, "SELECT id, block_order FROM content_blocks WHERE id_baiviet = ? AND block_order > ? ORDER BY block_order ASC LIMIT 1", 'ii', [$post_id, $current_order]);
            if($next_block_q) {
                $next_block = $next_block_q[0];
                // Hoán đổi block_order
                $conn->query("UPDATE content_blocks SET block_order = {$next_block['block_order']} WHERE id = {$block_id}");
                $conn->query("UPDATE content_blocks SET block_order = {$current_order} WHERE id = {$next_block['id']}");
            }
        }
    }
    $message = '<div class="notice success">Đã di chuyển khối.</div>';
    $action = 'list';
}

// 5. LẤY DỮ LIỆU ĐỂ HIỂN THỊ
// Lấy tất cả các khối của bài viết
$blocks = fetchAll($conn, "SELECT * FROM content_blocks WHERE id_baiviet = ? ORDER BY block_order ASC", 'i', [$post_id]);

// Lấy 1 khối cụ thể để SỬA
$edit_block = null;
if ($action === 'edit' && $block_id > 0) {
    $edit_block_data = fetchAll($conn, "SELECT * FROM content_blocks WHERE id = ? AND id_baiviet = ?", 'ii', [$block_id, $post_id]);
    if($edit_block_data) $edit_block = $edit_block_data[0];
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Nội dung</title>
    <link rel="stylesheet" href="css/admin_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .page-header h1 { font-size: 1.5rem; }
        .page-header a { font-size: 1rem; }
        .block-preview img { max-width: 150px; height: auto; border-radius: 4px; }
        .block-preview code { 
            display: block; 
            background: #eee; 
            padding: 5px; 
            border-radius: 4px; 
            white-space: nowrap; 
            overflow: hidden; 
            text-overflow: ellipsis; 
            max-width: 400px;
        }
        .form-group.hidden { display: none; }
    </style>
</head>
<body>
<div class="admin-wrapper">
    <?php include 'sidebar.php'; ?>
    <main class="main-content">
        <header class="admin-header">
            <div class="page-header">
                <h1>Soạn thảo: <?= htmlspecialchars($post['tieu_de']) ?></h1>
                <a href="quanly_baiviet.php" class="btn-cancel" style="padding: 10px 15px; margin: 0;">&larr; Quay lại danh sách</a>
            </div>
            <div class="admin-user">
                <span>Chào, <strong><?= htmlspecialchars($_SESSION['user_name']) ?></strong>!</span>
                <a href="logout.php" class="logout-btn">Đăng xuất</a>
            </div>
        </header>
        
        <div class="recent-posts" style="margin: 20px;">
            <?= $message // Hiển thị thông báo (nếu có) ?>
            <h2>Nội dung hiện tại</h2>
            <table>
                <thead>
                    <tr>
                        <th style="width:10%">Thứ tự</th>
                        <th style="width:15%">Loại khối</th>
                        <th>Nội dung (xem trước)</th>
                        <th style="width:20%">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (empty($blocks)): ?>
                        <tr><td colspan="4" style="text-align: center;">Chưa có nội dung. Hãy thêm khối ở bên dưới.</td></tr>
                    <?php else: ?>
                        <?php foreach ($blocks as $block): ?>
                            <tr>
                                <td><?= $block['block_order'] ?></td>
                                <td><strong><?= htmlspecialchars(ucfirst($block['block_type'])) ?></strong></td>
                                <td class="block-preview">
                                    <?php if ($block['block_type'] == 'image'): ?>
                                        <img src="../<?= htmlspecialchars($block['block_content']) ?>" alt="Ảnh">
                                    <?php else: ?>
                                        <code><?= htmlspecialchars(substr($block['block_content'], 0, 100)) . '...' ?></code>
                                    <?php endif; ?>
                                </td>
                                <td class="actions">
                                    <a href="quanly_noidung.php?post_id=<?= $post_id ?>&action=move&block_id=<?= $block['id'] ?>&dir=up" class="btn-edit" title="Di chuyển lên"><i class="fas fa-arrow-up"></i></a>
                                    <a href="quanly_noidung.php?post_id=<?= $post_id ?>&action=move&block_id=<?= $block['id'] ?>&dir=down" class="btn-edit" title="Di chuyển xuống"><i class="fas fa-arrow-down"></i></a>
                                    <a href="quanly_noidung.php?post_id=<?= $post_id ?>&action=edit&block_id=<?= $block['id'] ?>#form-content" class="btn-edit" title="Sửa"><i class="fas fa-edit"></i></a>
                                    <a href="quanly_noidung.php?post_id=<?= $post_id ?>&action=delete&block_id=<?= $block['id'] ?>" class="btn-delete" onclick="return confirm('Bạn có chắc muốn xóa khối này?');" title="Xóa"><i class="fas fa-trash"></i></a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>

        <div class="form-container" id="form-content">
            <h2><?= $edit_block ? 'Sửa khối nội dung' : 'Thêm khối nội dung mới' ?></h2>
            
            <form action="quanly_noidung.php?post_id=<?= $post_id ?>&action=save_block" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="block_id" value="<?= $edit_block['id'] ?? 0 ?>">
                
                <div class="form-group">
                    <label for="block_type">Loại khối</label>
                    <select id="block_type" name="block_type" required>
                        <option value="heading" <?= ($edit_block['block_type'] ?? '') == 'heading' ? 'selected' : '' ?>>Tiêu đề (Heading)</option>
                        <option value="paragraph" <?= ($edit_block['block_type'] ?? 'paragraph') == 'paragraph' ? 'selected' : '' ?>>Đoạn văn (Paragraph)</option>
                        <option value="image" <?= ($edit_block['block_type'] ?? '') == 'image' ? 'selected' : '' ?>>Ảnh (Image)</option>
                        <option value="tip" <?= ($edit_block['block_type'] ?? '') == 'tip' ? 'selected' : '' ?>>Ghi chú (Tip Box)</option>
                    </select>
                </div>

                <div class="form-group" id="group_content_text">
                    <label for="block_content">Nội dung</label>
                    <textarea id="block_content" name="block_content" rows="8"><?= htmlspecialchars($edit_block['block_content'] ?? '') ?></textarea>
                </div>

                <div class="form-group hidden" id="group_content_image">
                    <label for="image_file">Chọn file ảnh</label>
                    <input type="file" id="image_file" name="image_file" accept="image/*">
                    <?php if ($edit_block && $edit_block['block_type'] == 'image'): ?>
                        <p style="margin-top:10px;">Ảnh hiện tại:</p>
                        <img src="../<?= htmlspecialchars($edit_block['block_content']) ?>" alt="Ảnh hiện tại">
                        <input type="hidden" name="current_image" value="<?= htmlspecialchars($edit_block['block_content']) ?>">
                    <?php endif; ?>
                </div>
                
                <button type="submit" class="btn-save"><i class="fas fa-save"></i> <?= $edit_block ? 'Lưu thay đổi' : 'Thêm khối' ?></button>
                <?php if ($edit_block): ?>
                <a href="quanly_noidung.php?post_id=<?= $post_id ?>" class="btn-cancel">Hủy sửa</a>
                <?php endif; ?>
            </form>
        </div>
    </main>
</div>

<script>
// Script đơn giản để ẩn/hiện ô nhập nội dung
document.addEventListener('DOMContentLoaded', function() {
    var typeSelect = document.getElementById('block_type');
    var textGroup = document.getElementById('group_content_text');
    var imageGroup = document.getElementById('group_content_image');
    var contentTextarea = document.getElementById('block_content');

    function toggleFields() {
        if (typeSelect.value === 'image') {
            textGroup.classList.add('hidden');
            imageGroup.classList.remove('hidden');
            // Xóa nội dung text khi chuyển sang ảnh (nếu là form thêm mới)
            <?php if (!$edit_block): ?>
            contentTextarea.value = '';
            <?php endif; ?>
        } else {
            textGroup.classList.remove('hidden');
            imageGroup.classList.add('hidden');
        }
    }
    
    // Chạy lần đầu khi tải trang
    toggleFields(); 
    
    // Chạy mỗi khi thay đổi lựa chọn
    typeSelect.addEventListener('change', toggleFields);
});
</script>

<?php $conn->close(); ?>
</body>
</html>