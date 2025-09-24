# WebsiteTrangTin

Hướng dẫn cài đặt và sử dụng dự án **WebsiteTrangTin** trên local và Git.

---

## Mục lục

* [1. Cách dùng Git Bash đẩy code lên Git](#1-cách-dùng-git-bash-đẩy-code-lên-git)
* [2. Cơ sở dữ liệu MySQL trên Vertrigo](#2-cơ-sở-dữ-liệu-mysql-trên-vertrigo)
* [3. Tham khảo](#3-tham-khảo)

---

## 1. Cách dùng Git Bash đẩy code lên Git

**URL của repository:**
https://github.com/tpcuong/WebsiteTrangTin.git

### Hướng dẫn

1.  **Mở terminal hoặc Git Bash** và di chuyển đến thư mục bạn muốn lưu project:
    ```bash
    cd /path/to/your/folder
    ```
2.  **Clone repository về máy** bằng lệnh sau. Lệnh này sẽ tạo một thư mục `WebsiteTrangTin` và tải toàn bộ code về.
    ```bash
    git clone [https://github.com/tpcuong/WebsiteTrangTin.git](https://github.com/tpcuong/WebsiteTrangTin.git)
    ```
3.  **Vào thư mục project** để bắt đầu thao tác với Git:
    ```bash
    cd WebsiteTrangTin
    ```

### Các câu lệnh Git thường dùng

```bash
# Kiểm tra trạng thái các file đã thay đổi
git status

# Thêm tất cả các file đã thay đổi vào vùng đệm (stage)
git add .

# Ghi lại các thay đổi với một thông điệp
git commit -m "Initial commit"

# Đẩy code lên GitHub
git push

# Lấy các thay đổi mới nhất từ repository
git pull
```
## 2. Cơ sở dữ liệu MySQL trên Vertrigo
1. **Cài đặt và mở Vertrigo**
Truy cập các địa chỉ sau trên trình duyệt:

Trang chủ:
```bash
http://127.0.0.1/ hoặc http://localhost/

phpMyAdmin: http://127.0.0.1/phpmyadmin/
```
Thông tin đăng nhập mặc định:
```bash
Username: root

Password: vertrigo
```
2. **Hướng dẫn sử dụng database**
Tạo database mới:

Tạo một database mới (ví dụ: tincongnghe_db).

Lưu ý: Tên database mới phải trùng với tên database được sử dụng trong dự án.

Import dữ liệu:
Chọn database vừa tạo, sau đó chọn mục Import để tải file dữ liệu (.sql) của dự án lên database.
