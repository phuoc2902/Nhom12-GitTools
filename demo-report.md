# Demo Report - Hệ thống quản lý tài liệu Nhom12-GitTools

## 1. Chi tiết Dockerfile

Dockerfile hiện tại:

```dockerfile
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY public/ .
COPY docs/ docs/
EXPOSE 80
```

Giải thích:

- `FROM nginx:alpine`
  - Chọn base image Nginx nhẹ dựa trên Alpine Linux.
  - Đây là công thức để tạo container web server phục vụ static file.

- `WORKDIR /usr/share/nginx/html`
  - Thiết lập thư mục làm việc trong container.
  - Nginx mặc định phục vụ nội dung từ thư mục này.

- `COPY public/ .`
  - Sao chép toàn bộ nội dung website static từ thư mục `public` vào thư mục làm việc.
  - Các file này là giao diện frontend của ứng dụng.

- `COPY docs/ docs/`
  - Sao chép tài liệu dự án vào thư mục `docs` bên trong web root.
  - Khi chạy container, nội dung này có thể truy cập tĩnh qua `/docs/...`.

- `EXPOSE 80`
  - Khai báo cổng 80 là cổng HTTP của container.
  - Đây là cổng mà Nginx lắng nghe.

## 2. Backend / Frontend

### Frontend

- `public/index.html` là phần frontend chính của dự án.
- Nội dung frontend là website static hiển thị thông tin dự án và liên kết tới tài liệu `docs/`.
- Các file CSS/JS có thể được bổ sung trong `public/` nếu bạn mở rộng giao diện.

### Backend

- Hiện tại dự án không có backend application code riêng.
- Nginx đóng vai trò "backend" bằng cách phục vụ nội dung static.
- Kiến trúc này là một ứng dụng web tĩnh chạy trên một service duy nhất.

## 3. Chi tiết docker-compose

File `docker-compose.yml`:

```yaml
services:
  web:
    image: phuoc4/truonghuyphuoc:v1.0
    build:
      context: .
      dockerfile: Dockerfile
    container_name: nhom12-gittools-web
    ports:
      - "8080:80"
    restart: unless-stopped
```

Giải thích:

- `version: "3.9"`
  - Chỉ định phiên bản Docker Compose YAML.

- `services:`
  - Khai báo các service trong ứng dụng.

- `web:`
  - Tên service chính của hệ thống.

- `build:`
  - `context: .` xác định thư mục gốc chứa Dockerfile và nguồn code.
  - `dockerfile: Dockerfile` chỉ ra tên tệp Dockerfile.

- `container_name: nhom12-gittools-web`
  - Đặt tên dễ nhớ cho container khi chạy.

- `ports: - "8080:80"`
  - Map cổng host 8080 tới cổng container 80.
  - Khi mở `http://localhost:8080`, bạn sẽ truy cập ứng dụng.

- `restart: unless-stopped`
  - Giúp Docker tự khởi động lại container nếu lỗi.

## 4. Cấu hình hệ thống

- Đây là một hệ thống **Monolith / Single-service**.
- Chỉ có một service `web` trong Docker Compose.
- `public/` chứa phần frontend.
- `docs/` chứa tài liệu và nội dung phụ trợ.

## 5. Giải thích các services kèm theo

### Service `web`

- Đây là service duy nhất được quản lý bởi Docker Compose.
- Nó đảm nhận nhiệm vụ:
  - Build image từ Dockerfile.
  - Chạy container Nginx.
  - Phục vụ nội dung static ở cổng 8080 trên host.

## 6. Yêu cầu chấm

Để đủ yêu cầu demo, bạn cần trình bày các nội dung sau:

- `Dockerfile` và giải thích chi tiết từng lệnh.
- `docker-compose.yml` và giải thích các phần `build`, `ports`, `restart`.
- Mô tả kiến trúc: Monolith, frontend static, backend Nginx.
- Minh hoạ ít nhất 3 màn hình Docker Desktop:
  1. Images
  2. Containers / Apps
  3. Docker Hub / Registry (hoặc phần tag nếu có kết nối)

## 7. Build / Tag / Push lên Docker Hub

Các lệnh cần dùng:

```bash
docker build -t phuoc4/truonghuyphuoc:v1.0 .
docker run --rm -p 8080:80 phuoc4/truonghuyphuoc:v1.0
```

Nếu dùng Docker Compose:

```bash
docker compose up --build
docker compose down
```

Push lên Docker Hub:

```bash
docker login
docker push phuoc4/truonghuyphuoc:v1.0
```

## 8. Đánh giá hiện tại

Hiện tại setup đã đủ để demo phần này.

- Image đã build thành công với tag `phuoc4/truonghuyphuoc:v1.0`.
- `docker compose up --build --detach` cũng chạy được service `web` thành công.
- Bạn đã có `Dockerfile`, `docker-compose.yml`, `public/index.html` và `docs/`.
- Bước tiếp theo chỉ còn chạy container và chụp screenshot Docker Desktop.

- Bạn đã có `Dockerfile` và `docker-compose.yml`.
- Bạn đã có một web tĩnh để chạy bằng Nginx.
- Bạn chỉ cần build image, chạy container và push lên Docker Hub.
- Đảm bảo chụp hình Docker Desktop ở 3 màn hình yêu cầu.

> Lưu ý: Nếu muốn demo rõ ràng hơn, bạn có thể bổ sung thêm 1 file CSS và 1 số nội dung HTML nhỏ trong `public/` để trang đỡ trống.
