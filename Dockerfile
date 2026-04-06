# Sử dụng Nginx bản nhẹ nhất (alpine) để làm web server
FROM nginx:alpine

# Thiết lập thư mục làm việc trong container
WORKDIR /usr/share/nginx/html

# Chép nội dung website tĩnh vào thư mục mặc định của Nginx
COPY public/ .

# Chép các tài liệu dự án vào thư mục /docs trong web root
COPY docs/ docs/

# Thông báo container sẽ chạy ở cổng 80
EXPOSE 80