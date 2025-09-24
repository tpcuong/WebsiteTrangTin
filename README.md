=== Cách dùng Git bash đẩy code lên Git ===
Xác định URL của repository: 
https://github.com/tpcuong/WebsiteTrangTin.git
1. Mở terminal hoặc Git Bash.
  cd /path/to/your/folder ( Chọn nơi lưu mà bạn muốn lưu project).
2. Clone repository về máy.
  git clone https://github.com/tpcuong/WebsiteTrangTin.git
  Git sẽ tạo một thư mục WebsiteTrangTin trong folder hiện tại và tải toàn bộ code, commit, branch về máy.
3. Vào thư mục project
  cd WebsiteTrangTin
  Bây giờ bạn đã có repo local và có thể thao tác với Git bình thường: git status, git add, git commit, git push, git pull.
4. Các câu lệnh thường dùng
- Mô hình hoạt động của Git:
git status ( Kiểm tra all file)
git add . ( Thêm all file lên Git)
git commit ( Comment phần new code trên Git )
git push  ( Đẩy code/file lên Git )
5. Link hướng dẫn: https://youtu.be/-BtolPy15fg?si=74Et3C1K16SjvgAO
=== Cơ sở dữ liệu MySQL trên Vertrigo ===
1. Cài đặt và mở Vertrigo
   Index of .../ (Google Chorm) http://127.0.0.1/ or http://localhost/
   MySQL/ (Google Chorm) http://127.0.0.1/phpmyadmin/
   Username: root
   Password: vertrigo
2. Hướng dẫn dùng database
   Creat database mới (VD: tincongnghe_db)
   Lưu ý: Tên Database mới với trùng tên database dùng trong dự án.
   Sau đó chọn mục Import để import dữ liệu của dự án lên database.
   
