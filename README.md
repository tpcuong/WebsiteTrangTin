# WebsiteTrangTin

Hướng dẫn cài đặt và sử dụng dự án **WebsiteTrangTin** trên local và Git.

---

## 1. Cách dùng Git Bash đẩy code lên Git

**URL của repository:**  
https://github.com/tpcuong/WebsiteTrangTin.git

### Bước 1: Mở terminal hoặc Git Bash
Chuyển đến thư mục mà bạn muốn lưu project:
```bash
cd /path/to/your/folder
Bước 2: Clone repository về máy
bash
Copy code
git clone https://github.com/tpcuong/WebsiteTrangTin.git
Git sẽ tạo một thư mục WebsiteTrangTin trong folder hiện tại và tải toàn bộ code, commit, branch về máy.

Bước 3: Vào thư mục project
bash
Copy code
cd WebsiteTrangTin
Bây giờ bạn đã có repo local và có thể thao tác với Git bình thường:

bash
Copy code
git status   # Kiểm tra trạng thái file
git add .    # Thêm tất cả file vào stage
git commit -m "Initial commit"  # Commit các thay đổi với thông điệp
git push     # Đẩy code lên GitHub
git pull     # Lấy các thay đổi mới nhất từ remote
Bước 4: Các câu lệnh Git thường dùng
git status → Kiểm tra trạng thái tất cả file

git add . → Thêm tất cả file vào stage

git commit -m "..." → Commit các thay đổi với comment

git push → Đẩy code/file lên GitHub

git pull → Lấy các thay đổi mới nhất từ remote

Bước 5: Tham khảo hướng dẫn
Hướng dẫn Git chi tiết (Video)

2. Cơ sở dữ liệu MySQL trên Vertrigo
Bước 1: Cài đặt và mở Vertrigo
Truy cập index:

cpp
Copy code
http://127.0.0.1/ 
hoặc
http://localhost/
Truy cập phpMyAdmin:

arduino
Copy code
http://127.0.0.1/phpmyadmin/
Username: root

Password: vertrigo

Bước 2: Hướng dẫn dùng database
Tạo database mới (ví dụ: tincongnghe_db)

Lưu ý: Tên database mới phải trùng với tên database dùng trong dự án.

Chọn mục Import để import dữ liệu của dự án vào database.
