# Project_chap4_dataEA — Thực hành MANOVA (Chương 4)

Bài nhóm môn **Thống kê nhiều chiều**: MANOVA một và hai nhân tố trên dữ liệu nhân viên `DataEA`
(biến `Attrition`, `OverTime`). Mỗi câu là một child document; `main.Rmd` gộp lại thành 1 báo cáo HTML.

## Cấu trúc thư mục

```
Project_chap4_dataEA/
├── main.Rmd                     # File gộp: câu hỏi nghiên cứu + child tất cả các Part -> main.html
├── config/setup.R               # Package, seed, B_lan, hàm fp() và muc_do() dùng chung
├── data/
│   ├── raw/DataEA.xls           # Dữ liệu gốc (thực chất là CSV, đọc bằng read.csv)
│   └── processed/DataEA_clean.csv   # Dữ liệu sạch, sinh ra từ Part 1
├── Part_1_DuLieu_MoHinh/        # Câu (a) — Thư
├── Part_2_GiaDinh/              # Câu (b) — Thư (giả định cho cả 1 và 2 nhân tố)
├── Part_3_MANOVA_1NhanTo/       # Câu (c) — Thư
├── Part_4_HauNghiem/            # Câu (d) — Thư
├── Part_5_NhanXet/              # Câu (e) — Thư + Hà
├── Part_6_MANOVA_2NhanTo/       # Câu (f) — Hà
└── Part_7_HanChe/               # Câu (g) — Hà
```

Mỗi Part có `Part_X.Rmd` (child document, không có YAML) và thư mục `output/` để lưu hình/bảng nếu cần.

## Cách chạy

1. Mở `Project_chap4_dataEA.Rproj` trong RStudio (hoặc đặt working directory tại thư mục gốc).
2. Knit `main.Rmd`. Các package còn thiếu được tự cài khi chạy `config/setup.R`.
3. Các Part là child document nên không knit riêng được; luôn knit qua `main.Rmd`.
   Part 1–5 dùng chung đối tượng (`ea`, `X`, `nhom`, ...) tạo ở Part 1, nên phải giữ đúng thứ tự.
   Part 6 tự đọc `data/processed/DataEA_clean.csv`, có thể chạy thử độc lập từng chunk.
4. Mọi đường dẫn dùng `here::here(...)`. Nếu gặp lỗi `cannot open the connection`, restart R session rồi knit lại.

## Quy ước viết (thống nhất cả nhóm)

- Mức ý nghĩa α = 0.05; mức độ vi phạm giả định: p ≥ 0.05 thỏa, 1e-4 ≤ p < 0.05 vi phạm nhẹ, p < 1e-4 vi phạm nặng.
- Mỗi kiểm định: khối giả thuyết căn giữa (`$$\begin{aligned} H_0 &: ... \\ H_A &: ... \end{aligned}$$`)
  và câu kết luận "ta bác bỏ / không bác bỏ $H_0$ với mức ý nghĩa 5%, nghĩa là ...".
- Nhãn chunk không được trùng giữa các Part (nên đặt tiền tố theo câu, ví dụ `f-manova`).

## Làm việc nhóm với Git

```bash
git checkout -b ha-cau-f        # mỗi người một nhánh
# sửa Part của mình, rồi:
git add Part_6_MANOVA_2NhanTo/
git commit -m "Cau f: MANOVA hai nhan to"
git push -u origin ha-cau-f      # tạo Pull Request vào main
```

Mỗi người chỉ sửa thư mục Part của mình để tránh xung đột; `main.Rmd` và `config/setup.R` sửa sau khi thống nhất.
