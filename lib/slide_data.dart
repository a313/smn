import 'package:flutter/material.dart';
import 'package:smn/slides/slide.dart';

final slides = [
  Slide(
    backgroundImage:
        'https://images.unsplash.com/photo-1593720213428-28a5b9e94613?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    content: [
      TitleContent('Seminar: Sự phát triển của mobile'),
      TextContent('Cross platform - Flutter'),
    ],
    alignment: Alignment.center,
  ),
  Slide(
    alignment: Alignment.centerLeft,
    backgroundImage:
        'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    content: [
      TitleContent('Mục lục', color: Colors.yellowAccent, fontSize: 54),
      TextContent('1. Giới thiệu', fontSize: 36),
      TextContent('2. Sự ra đời của smart phone và Native', fontSize: 36),
      TextContent('3. Sự trỗi dậy của Cross-Platform', fontSize: 36),
      TextContent(
        '4. Flutter: Ngôi sao đang lên của Cross-Platform',
        fontSize: 36,
      ),
      TextContent('5. Q&A', fontSize: 36),
    ],
  ),

  Slide(
    content: [
      TitleContent('Smart Phone and Native Timeline\n'),
      TimelineContent([
        TimelineData(
          datetime: "09/01/2007",
          title: "iPhone được công bố",
          contents: [
            "Steve Jobs giới thiệu iPhone tại Macworld",
            "iPhone kết hợp iPod, điện thoại, trình duyệt",
          ],
          color: Colors.blue,
        ),
        TimelineData(
          datetime: "29/06/2007",
          title: "iPhone đầu tiên phát hành",
          contents: [
            "iPhone 2G ra mắt tại Mỹ",
            "Chạy iPhone OS 1.0, sử dụng Objective-C là ngôn ngữ phát triển chính",
          ],
          color: Colors.redAccent,
        ),
        TimelineData(
          datetime: "06/03/2008",
          title: "Apple giới thiệu iPhone SDK",
          contents: [
            "Cho phép lập trình viên bên ngoài phát triển ứng dụng",
            "Đánh dấu sự mở cửa của nền tảng iOS",
          ],
          color: Colors.orange,
        ),
        TimelineData(
          datetime: "10/07/2008",
          title: "App Store ra mắt",
          contents: [
            "Khoảng 500 ứng dụng sẵn có",
            "Bắt đầu cuộc đua thị trường ứng dụng di động",
          ],
          color: Colors.lightBlue,
        ),
        TimelineData(
          datetime: "23/09/2008",
          title: "Android 1.0 chính thức ra mắt",
          contents: [
            "HTC Dream (T-Mobile G1) là thiết bị đầu tiên",
            "Android Market bắt đầu hoạt động",
          ],
          color: Colors.lightGreen,
        ),
        TimelineData(
          datetime: "22/10/2008",
          title: "Android Market phát hành",
          contents: [
            "Khoảng 35 ứng dụng có sẵn",
            "Không có hệ thống đánh giá/xếp hạng ứng dụng",
          ],
          color: Colors.teal,
        ),

        TimelineData(
          datetime: "02/06/2014",
          title: "Swift được công bố",
          contents: [
            "Apple giới thiệu Swift tại WWDC 2014",
            "Hướng tới thay thế dần Objective-C",
          ],
          color: Colors.deepOrange,
        ),

        TimelineData(
          datetime: "15/02/2016",
          title: "Kotlin 1.0 phát hành",
          contents: [
            "JetBrains công bố phiên bản ổn định",
            "Hoạt động trên JVM, tương thích với Java",
          ],
          color: Colors.purple,
        ),
        TimelineData(
          datetime: "17/05/2017",
          title: "Kotlin thành ngôn ngữ chính thức trên Android",
          contents: [
            "Google công bố tại Google I/O",
            "Được hỗ trợ hoàn toàn bởi Android Studio",
          ],
          color: Colors.blueGrey,
        ),

        TimelineData(
          datetime: "03/06/2019",
          title: "SwiftUI được giới thiệu",
          contents: [
            "Framework mới cho UI trên iOS",
            "Hoạt động song song với UIKit",
          ],
          color: Colors.pink,
        ),

        TimelineData(
          datetime: "15/07/2025",
          title: "Kotlin Multiplatform 2.0 ổn định",
          contents: [
            "Hỗ trợ đa nền tảng chính thức (Android, iOS, Desktop, Web)",
          ],
          color: Colors.deepPurple,
        ),
        TimelineData(
          datetime: "Now",
          title: "Hàng triệu ứng dụng đã được phát hành",
          contents: [
            "1,9 triệu ứng dụng trên Apple Store",
            "3.95 triệu ứng dụng trên Google Play Store",
          ],
          color: Colors.pinkAccent,
        ),
      ]),
    ],
  ),
  Slide(
    alignment: Alignment.centerLeft,
    backgroundImage:
        'https://images.unsplash.com/photo-1550751827-4133d5e30b6d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    content: [
      TitleContent('Native là gì?', fontSize: 54),
      TitleContent('Định nghĩa:', color: Colors.blue, fontSize: 42),
      TextContent(
        'Là cách ứng dụng di động được phát triển riêng cho một nền tảng (iOS hoặc Android) bằng ngôn ngữ và công cụ chính thức như Swift/Objective-C (iOS) hoặc Kotlin/Java (Android).',
        fontSize: 32,
      ),
      TitleContent('Ưu điểm:', color: Colors.greenAccent, fontSize: 42),
      TextContent(
        '- Hiệu năng tối ưu, trải nghiệm người dùng mượt mà nhất.',
        fontSize: 32,
      ),
      TextContent(
        '- Truy cập đầy đủ tính năng của thiết bị (camera, GPS, cảm biến...).',
        fontSize: 32,
      ),
      TextContent('- UI/UX chuẩn chỉnh theo từng hệ điều hành.', fontSize: 32),
      TitleContent('Nhược điểm:', color: Colors.redAccent, fontSize: 42),
      TextContent(
        '- Cần 2 đội ngũ/ngôn ngữ/codebase riêng biệt (tốn kém, mất thời gian).',
        fontSize: 32,
      ),
      TextContent('- Bảo trì, cập nhật phức tạp.', fontSize: 32),
    ],
  ),
];
