# 🚚 VanFlow - Decision Support System for Van Drivers

**VanFlow** là ứng dụng di động hỗ trợ tài xế xe tải (phân khúc 945kg) đưa ra quyết định chấp nhận đơn hàng một cách nhanh chóng và khoa học dựa trên dữ liệu thực tế tại TP. Hồ Chí Minh.

## 🌟 Tính năng chính

- **Đánh giá đơn hàng siêu tốc:** Tính toán lợi nhuận ròng dựa trên giá xăng, quãng đường và đặc thù quận huyện chỉ trong 2 giây.
- **Scoring Engine:** Hệ thống chấm điểm đơn hàng (Chấp nhận/Cân nhắc/Từ chối) dựa trên thuật toán kinh tế vận tải.
- **Bản đồ dữ liệu 22 Quận/Huyện:** Tích hợp sẵn dữ liệu về kẹt xe, cấm tải và cấm giờ của toàn bộ TP.HCM.
- **Learning Engine (AI cục bộ):** Hệ thống tự học và cập nhật xác suất "nối đơn" dựa trên phản hồi thực tế của tài xế sau mỗi chuyến đi.
- **Giao diện tối ưu:** High-contrast Dark Mode, font chữ lớn, hỗ trợ thao tác một tay an toàn khi đang trên xe.

## 🧠 Công thức cốt lõi

### 1. Tính toán Lợi nhuận thực tế (Profit Logic)
Dựa trên định mức thực tế của dòng xe van 945kg:
- **Định mức:** 10km / 1 Lít xăng.
- **Chi phí vận hành/km:** `(Giá xăng / 10) + 1,150đ (khấu hao)`.
- **Lợi nhuận ròng:** `Giá cước - (Tổng quãng đường * Chi phí vận hành/km)`.

### 2. Thuật toán Học máy (Reinforcement Learning)
Cập nhật xác suất nổ đơn (Chain Probability) của từng quận:
`P(new) = P(old) * 0.8 + (Result * 0.2)`
*(Trong đó Result = 1 nếu có đơn nối, = 0 nếu chạy rỗng)*

## 🏗 Kiến trúc dự án (Architecture)

Dự án áp dụng **Clean Architecture** kết hợp với cấu trúc **Feature-first** để đảm bảo tính mở rộng và dễ bảo trì:

```text
lib/
 ├── core/              # Logic dùng chung, Models, Services (Isar, Scoring Engine)
 ├── features/          # Các tính năng độc lập (Monitor, Analytics, Order Analysis)
 │    ├── data/         # Implement repositories & data sources
 │    ├── domain/       # Business logic (Entities, Repositories interfaces)
 │    └── presentation/ # BLoC & UI
 └── presentation/      # Các màn hình chính & Common widgets
```

## 🛠 Tech Stack

- **Framework:** Flutter (Mobile)
- **State Management:** Flutter BLoC (v9+) & Equatable
- **Database:** Isar (High-performance NoSQL local DB)
- **DI:** GetIt (Service Locator)
- **Local Analytics:** Thuật toán AI tự học tích hợp trực tiếp trên thiết bị.

## 🚀 Cài đặt

1. Clone dự án.
2. Chạy lệnh cài đặt thư viện:
   ```bash
   flutter pub get
   ```
3. Chạy build runner để tạo code tự động cho Isar:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. Chạy ứng dụng:
   ```bash
   flutter run
   ```

## ⚖️ Disclaimer
Ứng dụng này là một công cụ hỗ trợ quyết định cá nhân, 100% logic cục bộ, không can thiệp vào API của bất kỳ nền tảng giao hàng nào, đảm bảo an toàn tuyệt đối cho tài khoản của tài xế.

---
Developed with ❤️ by Senior Flutter Engineer.
