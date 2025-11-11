<?php
// File này được include từ các file khác, nên nó sẽ tự động
// có các biến $IS_ADMIN, $IS_AUTHOR
// Lấy tên file .php hiện tại (ví dụ: 'index.php')
$current_page = basename($_SERVER['PHP_SELF']); 
?>
<aside class="sidebar">
    <div class="sidebar-logo">
        <h2>Y2K</h2>
        <span class="sidebar-user-role">
            <?php if ($IS_ADMIN): ?>
                , Admin
            <?php else: // $IS_AUTHOR ?>
                , Tác giả
            <?php endif; ?>
        </span>
    </div>
    <nav class="admin-nav">
        <ul>
            <li class="<?= ($current_page == 'index.php') ? 'active' : '' ?>">
                <a href="index.php"><i class="fas fa-tachometer-alt"></i> Bảng điều khiển</a>
            </li>
            <li class="<?= ($current_page == 'quanly_baiviet.php') ? 'active' : '' ?>">
                <a href="quanly_baiviet.php"><i class="fas fa-newspaper"></i> Quản lý Bài viết</a>
            </li>
            
            <?php if ($IS_ADMIN): // CHỈ ADMIN MỚI THẤY ?>
            
            <li class="<?= ($current_page == 'quanly_linhvuc.php') ? 'active' : '' ?>">
                <a href="quanly_linhvuc.php"><i class="fas fa-tags"></i> Quản lý Lĩnh vực</a>
            </li>
            <li class="<?= ($current_page == 'quanly_binhluan.php') ? 'active' : '' ?>">
                <a href="quanly_binhluan.php"><i class="fas fa-comments"></i> Quản lý Bình luận</a>
            </li>
            <li class="<?= ($current_page == 'quanly_users.php') ? 'active' : '' ?>">
                <a href="quanly_users.php"><i class="fas fa-users"></i> Quản lý Người dùng</a>
            </li>
            
            <?php endif; ?>
            
            <li class="<?= ($current_page == 'change_password.php') ? 'active' : '' ?>">
                <a href="change_password.php"><i class="fas fa-key"></i> Đổi mật khẩu</a>
            </li>

            <li><a href="../index.php" target="_blank"><i class="fas fa-globe"></i> Xem Website</a></li>
        </ul>
    </nav>
</aside>