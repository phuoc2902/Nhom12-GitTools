1. Trương Huy Phước
Vai trò: LEADER

Nhánh làm việc: feature/lead-setup

Commit nâng cao: Amend commit - (Đã hoàn thành)

Remote Operations: Sync branch & Thay đổi remote URL (Đã hoàn thành)

2. Trần Quốc Trung
Vai trò: DEVELOPER

Nhánh làm việc: feture/header (Lưu ý: sai chính tả chữ 'feature')

Commit nâng cao: Cherry-pick một commit sang branch khác

Remote Operations: Thay đổi remote URL (giả lập fork)

3. Vũ Gia Kiệt (Đã hoàn thành)
Vai trò: DEVELOPER

Nhánh làm việc: feature/vu-gia-kiet

Commit nâng cao: Undo một commit (Đã hoàn thành)

Remote Operations: Thay đổi remote URL (giả lập fork) (Đã hoàn thành)

4. Lâm Nhật Khang (Đã hoàn thành)
Vai trò: DEVELOPER

Nhánh làm việc: revert-6-feature/footer

Commit nâng cao: Revert một commit

Remote Operations: Thay đổi remote URL (giả lập fork)

5. Nguyễn Ngọc Thanh Trường (Đã hoàn thành)
Vai trò: DEVELOPER

Nhánh làm việc: feature/footer

Commit nâng cao: Squash ít nhất 2 commit - 

Remote Operations: View Pull Request/Merge Request trong Desktop (Đã hoàn thành)

---

## Cấu trúc thư mục hiện tại

- `Dockerfile`: hướng dẫn build image Nginx phục vụ tệp static.
- `docker-compose.yml`: cấu hình service chạy trên `8080:80`.
- `.dockerignore`: loại trừ file không cần thiết khỏi Docker build.
- `public/`: chứa website static (index.html).
- `docs/`: chứa tài liệu dự án chuyển đổi từ các file `.txt`.
- `README.md`, `skill.md`: tài liệu tổng quan và kỹ năng của nhóm.

## Chạy demo

1. Build image:
   ```bash
   docker build -t phuoc4/truonghuyphuoc:v1.0 .
   ```
2. Chạy container trực tiếp:
   ```bash
   docker run --rm -p 8080:80 phuoc4/truonghuyphuoc:v1.0
   ```
3. Hoặc chạy bằng Docker Compose:
   ```bash
   docker compose up --build
   ```
   hoặc chạy ngầm:
   ```bash
   docker compose up --build --detach
   ```
4. Mở trình duyệt đến:
   - `http://localhost:8080`

## Đẩy image lên Docker Hub

1. Đăng nhập Docker Hub:
   ```bash
   docker login
   ```
2. Push image tag `v1.0`:
   ```bash
   docker push phuoc4/truonghuyphuoc:v1.0
   ```

## Hướng dẫn screenshot Docker Desktop

- Chụp màn hình tab `Images` để show image `phuoc4/truonghuyphuoc:v1.0`.
- Chụp tab `Containers / Apps` khi container `nhom12-gittools-web` đang chạy.
- Chụp tab `Docker Hub` / `Registry` hoặc `Images` với tag `v1.0`.

## Tệp hỗ trợ

- `publish.ps1`: script PowerShell để build và push image.
- `docs/docker-desktop-screenshots.md`: hướng dẫn cụ thể cách chụp 3 màn hình Docker Desktop.
- `docs/pipeline-failure-guide.md`: hướng dẫn làm pipeline thất bại để minh chứng trạng thái thất bại.
- `docs/ci-cd-screenshots-guide.md`: hướng dẫn chụp screenshot minh chứng CI/CD cho báo cáo.

## CI/CD với GitHub Actions

Dự án đã được cấu hình CI/CD với GitHub Actions:

- File workflow: `.github/workflows/main.yml`
- Trigger: Push vào nhánh `main`
- 3 jobs: `build`, `test`, `deploy`

Để chạy pipeline:
1. Push code lên nhánh `main` của repository GitHub.
2. Kiểm tra tab "Actions" để xem trạng thái pipeline.
3. Chụp screenshot trạng thái thành công/thất bại cho báo cáo.

Xem chi tiết hướng dẫn chụp screenshot tại `docs/ci-cd-screenshots-guide.md`.
