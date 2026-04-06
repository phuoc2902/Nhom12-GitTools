# Hướng dẫn làm Pipeline thất bại để minh chứng trạng thái thất bại

Để lấy minh chứng "Trạng thái thất bại" cho báo cáo, bạn có thể cố tình làm một trong các job thất bại bằng cách sửa đổi code hoặc file.

## 1. Làm job "test" thất bại

- Đổi tên file `README.md` thành `readme.md` (thay đổi case).
- Hoặc xóa file `skill.md` tạm thời.
- Sau đó push lên main, pipeline sẽ fail ở job test vì không tìm thấy file.

## 2. Làm job "build" thất bại

- Sửa `Dockerfile` để có lỗi cú pháp, ví dụ thêm dòng không hợp lệ:
  ```
  RUN invalid-command
  ```
- Hoặc xóa file `Dockerfile` tạm thời.
- Push lên main, job build sẽ fail khi docker build.

## 3. Làm job "deploy" thất bại

- Nếu không có secrets `DOCKERHUB_USERNAME` và `DOCKERHUB_TOKEN`, job deploy sẽ fail khi login.
- Hoặc sửa tag thành invalid: `phuoc4/truonghuyphuoc:invalid-tag`.

## Cách khôi phục

Sau khi chụp screenshot trạng thái thất bại:
- Revert lại các thay đổi để pipeline pass.
- Push lại để có trạng thái thành công.

## Lưu ý

- Chụp screenshot tab "Actions" trong GitHub repository để show pipeline status.
- Ghi chú rõ job nào fail và lý do.