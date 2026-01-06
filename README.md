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

### 3. 🧠 Cơ chế "Bộ não" Quyết định (Scoring Engine)
Tại sao VanFlow biết đơn hàng nào "ngon", đơn hàng nào "xương"? Không chỉ nhìn vào giá cước, hệ thống sử dụng thuật toán **Cân bằng Kinh tế Chuyến đi** để chấm điểm:
#### ⚖️ Công thức này hoạt động như thế nào?

Chúng tôi không tính bằng tiền, chúng tôi tính bằng **"Điểm giá trị thực tế"**:

1.  **Tiền tươi (Fee):** Điểm cộng ban đầu chính là giá cước bạn nhìn thấy.
2.  **Km Rỗng (Empty Km) x 9,000đ:** Đây là "chi phí cơ hội". Cứ mỗi km bạn chạy không để đến điểm nhận, bạn mất đi xăng xe, khấu hao và thời gian quý báu.
3.  **Phút tắc đường (Traffic) x 3,000đ:** Kẹt xe là kẻ thù của xe van. 3,000đ/phút là cái giá để bù đắp cho sự mệt mỏi và lượng xăng tiêu hao gấp đôi khi nhích từng mét trên đường phố TP.HCM.
4.  **Xác suất nối đơn (Chain Bonus) + 40,000đ:** Đây là "vùng xanh". Nếu trả hàng ở một quận dễ có đơn mới, hệ thống sẽ cộng thưởng để khuyến khích bạn nhận đơn, vì hành trình của bạn sẽ không kết thúc ở đó.
5.  **Hình phạt đặc thù (Penalties):** Trừ điểm nặng nếu hẻm nhỏ khó vào (`isVanFriendly`) hoặc khu vực đang trong giờ cấm tải (`hasTimeRestriction`).

### 🚦 Hệ thống đèn tín hiệu (Decision Making)

Thay vì để tài xế phải nhẩm tính con số lẻ, VanFlow trả về 3 trạng thái trực quan:

*   **✅ CHẤP NHẬN (Score > 40k):** "Kèo thơm"! Đơn hàng có lợi nhuận cao, đường thoáng, khả năng nổ đơn tiếp theo cực lớn. Bấm nhận ngay kẻo lỡ!
*   **⚠️ CÂN NHẮC (Score 0 - 40k):** "Đủ sống". Có thể làm nếu bạn đang cần chạy đủ chỉ tiêu hoặc muốn di chuyển về hướng đó.
*   **❌ TỪ CHỐI (Score < 0):** "Đơn hành xác". Sau khi trừ mọi chi phí và rủi ro, bạn đang làm không công hoặc thậm chí lỗ vốn. Tốt nhất nên bỏ qua để đợi kèo khác.

> **Triết lý của VanFlow:** "Đôi khi từ chối một đơn hàng xấu chính là cách nhanh nhất để gia tăng thu nhập cuối ngày."


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

# Q&A
### ❓ Tại sao lại là con số 40,000đ trong Chain Bonus?

Trong công thức chấm điểm, chúng tôi sử dụng phép tính: `districtProfile.chainProbability * 40000`. Đây không phải là con số ngẫu nhiên, mà là **Giá trị kỳ vọng của thu nhập tiềm năng (Expected Value)**.

#### 1. Con số 40,000đ nghĩa là gì?
Nó đại diện cho **lợi nhuận ròng trung bình** mà một tài xế xe van 945kg mong đợi kiếm được từ một đơn hàng tiếp theo.
*   Tại TP.HCM, sau khi trừ chi phí nhiên liệu, một đơn hàng ngắn/trung bình thường để lại lợi nhuận khoảng 30,000đ - 50,000đ. Chúng tôi chọn **40,000đ** làm mốc chuẩn để tính toán.

#### 2. Tại sao lại nhân Tỉ lệ (Probability) với 40,000đ?
Đây là cách hệ thống định giá "cơ hội". Hãy so sánh 2 kịch bản trả hàng:
*   **Khu vực A (Quận 1 - Tỉ lệ nối đơn 0.9):** `0.9 * 40,000 = 36,000đ`. Hệ thống hiểu là: *"Nếu bạn đến đây, bạn gần như chắc chắn bỏ túi thêm 36k nữa. Đơn hàng hiện tại dù giá hơi thấp vẫn cực kỳ đáng làm."*
*   **Khu vực B (Huyện Cần Giờ - Tỉ lệ nối đơn 0.1):** `0.1 * 40,000 = 4,000đ`. Hệ thống hiểu là: *"Đến đây xong khả năng cao là phải chạy xe không về. Đơn này phải trả giá rất cao mới bõ công chạy."*

#### 3. Ý nghĩa thực chiến: "Chạy đi thì dễ, chạy về mới khó"
Việc đưa con số 40,000đ vào thuật toán giúp giải quyết 3 bài toán lớn của tài xế van:
*   **Bù đắp rủi ro "vùng trắng":** Tự động trừ điểm các khu vực hẻo lánh để bảo vệ bạn khỏi việc cháy xăng khi chạy xe không về trung tâm.
*   **Định giá sự tiện lợi:** Đây giống như một khoản "tiền thưởng ảo" giúp bạn ưu tiên những đơn hàng đưa bạn đến các "vùng xanh" (kho bãi, khu công nghiệp).
*   **Tính đồng nhất:** Giúp mọi chỉ số (Km rỗng, thời gian kẹt xe) đều được quy về một đơn vị duy nhất là **Tiền (VND)** để đưa ra quyết định chính xác nhất.

> **💡 Mẹo:** Bạn có thể tùy chỉnh con số này trong `ScoreEngine`. Nếu bạn định giá mỗi đơn hàng của mình cao hơn, hãy nâng nó lên 60,000đ. Đây là cách bạn "dạy" VanFlow hiểu giá trị thời gian của chính mình.
h con số này chính là cách bạn "dạy" cho ứng dụng Van Flow biết bạn định giá thời gian và cơ hội của mình bao nhiêu tiền.
---
Developed with ❤️ by Senior Flutter Engineer.
