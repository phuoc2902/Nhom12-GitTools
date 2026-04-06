# Hướng dẫn chụp screenshot minh chứng CI/CD cho báo cáo

## Tên Tool sử dụng (bắt buộc)
- **GitHub Actions**: Công cụ CI/CD tích hợp sẵn trong GitHub.

## Chi tiết Pipeline/Workflow

### Build
- Job `build`: Kiểm tra cú pháp Dockerfile bằng `docker build`.
- Chụp màn hình khi job này đang chạy hoặc kết quả pass/fail.

### Test
- Job `test`: Kiểm tra sự tồn tại của `README.md`, `skill.md`, `Dockerfile`.
- Chụp màn hình khi job này fail (nếu cố tình xóa file).

### Deploy
- Job `deploy`: Đẩy image lên Docker Hub `phuoc4/truonghuyphuoc:v1.0`.
- Chụp màn hình khi job này pass (nếu có secrets Docker Hub).

## Chi tiết file cấu hình

- File: `.github/workflows/main.yml`
- Chụp màn hình nội dung file YAML trong GitHub repository.

## Giải thích file YAML/…

- Chụp màn hình file `main.yml` và giải thích từng phần:
  - `on`: trigger events
  - `jobs`: build, test, deploy
  - `steps`: checkout, build, test checks, deploy actions

## Các thư viện có sẵn áp dụng trong file cấu hình, phiên bản…

- `actions/checkout@v4`: Clone repository
- `docker/login-action@v3`: Login Docker Hub
- `docker/build-push-action@v5`: Build và push image

## Yêu cầu chấm: ≥ 3 màn hình có pipeline với các trạng thái khác nhau thành công/thất bại…

### Nơi chụp hình: Tab "Actions" trong GitHub repository

1. **Màn hình 1: Pipeline thành công**
   - Vào repository GitHub > tab "Actions"
   - Chọn workflow run gần nhất với status "Success" (màu xanh)
   - Chụp màn hình tổng quan workflow với 3 jobs đều pass.

2. **Màn hình 2: Pipeline thất bại**
   - Sau khi làm pipeline fail (theo `pipeline-failure-guide.md`)
   - Chọn workflow run với status "Failure" (màu đỏ)
   - Chụp màn hình show job nào fail và lý do.

3. **Màn hình 3: Chi tiết workflow**
   - Trong workflow run, click vào để xem chi tiết
   - Chụp màn hình show các jobs (build, test, deploy) và steps của chúng.

4. **Màn hình bổ sung: Lịch sử CI/CD**
   - Chụp màn hình danh sách các workflow runs để show lịch sử.

## Lịch sử CI/CD

- Chụp màn hình tab "Actions" với danh sách các runs.
- Ghi chú số lần chạy, thời gian, và status của từng run.

## Cách thực hiện

1. Push code lên nhánh `main` để trigger pipeline.
2. Chờ pipeline chạy xong (khoảng 2-3 phút).
3. Vào GitHub > Actions để chụp hình.
4. Để có trạng thái thất bại: Làm theo hướng dẫn trong `docs/pipeline-failure-guide.md`.