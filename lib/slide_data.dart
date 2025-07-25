import 'package:flutter/material.dart';
import 'package:smn/charts/framework_trend.dart';
import 'package:smn/charts/smartphone_char3.dart';
import 'package:smn/slides/image_helper.dart';
import 'package:smn/slides/slide.dart';

import 'charts/smartphone_chart.dart';

final slides = [
  Slide(
    tag: 'wellcome',
    backgroundImage: ImageSource.asset('assets/images/qna_bg.jpg'),
    content: [
      TitleContent(
        'Seminar\nSự phát triển của mobile',
        color: Colors.deepOrange,
      ),
      TextContent('Cross platform - Flutter', color: Colors.deepOrangeAccent),
    ],
    alignment: Alignment.center,
  ),
  Slide(
    tag: 'agenda',
    alignment: Alignment.center,
    backgroundImage: ImageSource.network(
      'https://images.unsplash.com/photo-1607496220321-0c71c2fdbffb?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    content: [
      TitleContent('Mục lục', color: Colors.purple, fontSize: 60),
      TextContent('1. Giới thiệu', fontSize: 42),
      TextContent('2. Sự ra đời của smart phone và Native', fontSize: 42),
      TextContent('3. Sự trỗi dậy của Cross-Platform', fontSize: 42),
      TextContent(
        '4. Flutter: Ngôi sao đang lên của Cross-Platform',
        fontSize: 42,
      ),

      TextContent('5. Q&A', fontSize: 42),
    ],
  ),
  Slide(
    tag: 'chart',
    content: [
      TitleContent('Thị phần hệ điều hành di động từ 2009-2025\n'),
      ChartContent(SmartPhoneChart3()),
    ],
  ),
  Slide(
    tag: 'timeline',
    content: [
      TitleContent('Smart Phone Timeline\n'),
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
            "iPhone OS ra mắt sử dụng Objective-C là ngôn ngữ phát triển chính",
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
          contents: ["HTC Dream (T-Mobile G1) là thiết bị đầu tiên"],
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
          datetime: "21/06/2010",
          title: "Đổi tên iPhone OS thành iOS",
          contents: [
            "iOS 4.0 giới thiệu multitasking và iBooks",
            "FaceTime xuất hiện lần đầu",
          ],
          color: Colors.deepPurple,
        ),
        TimelineData(
          datetime: "06/03/2012",
          title: "Google Play ra đời",
          contents: [
            "Hợp nhất các nền tảng Android Market, Google Music, Google eBookstore, Google Movies",
          ],
          color: Colors.brown,
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
            "3,95 triệu ứng dụng trên Google Play",
          ],
          color: Colors.pinkAccent,
        ),
      ]),
    ],
  ),
  Slide(
    tag: 'chart',
    content: [
      TitleContent('Số lượng người sử dụng smart phone qua các năm\n'),
      ChartContent(SmartPhoneChart()),
    ],
  ),

  Slide(
    tag: 'native',
    alignment: Alignment.centerLeft,
    backgroundImage: ImageSource.network(
      'https://images.unsplash.com/photo-1607799279861-4dd421887fb3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    content: [
      TitleContent('Native là gì?', fontSize: 60),
      TextContent(
        'Là cách ứng dụng di động được phát triển riêng cho một nền tảng.\nSử dụng ngôn ngữ và công cụ chính thức từ nhà phát hành ra nền tảng đó',
        fontSize: 38,
      ),
      TitleContent('Ưu điểm:', color: Colors.greenAccent, fontSize: 42),
      TextContent(
        '- Hiệu năng tối ưu, trải nghiệm người dùng mượt mà nhất.',
        fontSize: 38,
      ),
      TextContent(
        '- Truy cập đầy đủ tính năng của thiết bị (camera, GPS, cảm biến...).',
        fontSize: 38,
      ),
      TextContent('- UI/UX chuẩn chỉnh theo từng hệ điều hành.', fontSize: 38),
      TitleContent('Nhược điểm:', color: Colors.redAccent, fontSize: 42),
      TextContent(
        '- Cần nhiều đội ngũ/ ngôn ngữ/ codebase riêng biệt (tốn kém, mất thời gian).',
        fontSize: 38,
      ),
      TextContent('- Bảo trì, cập nhật phức tạp.', fontSize: 38),
    ],
  ),
  Slide(
    tag: 'cross-platform0',
    backgroundImage: ImageSource.asset('assets/images/cr1.png'),
    alignment: Alignment.centerLeft,
    content: [
      TitleContent('Cross-Platform là gì?', fontSize: 60),
      TextContent(
        'Là phương pháp phát triển ứng dụng phần mềm có thể hoạt động trên nhiều nền tảng\nhoặc hệ điều hành khác nhau chỉ với một codebase duy nhất.',
        fontSize: 38,
      ),
    ],
  ),
  Slide(
    tag: 'cross-platform1',
    backgroundImage: ImageSource.asset('assets/images/cr1.png'),
    alignment: Alignment.centerLeft,
    content: [
      TitleContent('Tại sao cần Cross-Platform?', fontSize: 60),
      TitleContent(
        '1. Tiết kiệm thời gian & chi phí',
        color: Colors.greenAccent,
        fontSize: 38,
      ),
      TextContent(
        'Viết một lần, chạy trên nhiều nền tảng (iOS, Android, Web, Desktop)',
        fontSize: 32,
      ),
      TextContent(
        'Giảm chi phí đội ngũ kỹ thuật (chỉ cần 1 team thay vì nhiều)',
        fontSize: 32,
      ),
      TitleContent(
        '2. Tốc độ ra mắt sản phẩm nhanh hơn',
        color: Colors.blueAccent,
        fontSize: 38,
      ),
      TextContent(
        'Dễ dàng thử nghiệm ý tưởng (MVP) và đưa ra thị trường sớm',
        fontSize: 32,
      ),
      TextContent(
        'Phù hợp với các startup, dự án nhỏ cần phản hồi nhanh',
        fontSize: 32,
      ),
      TitleContent(
        '3. Duy trì & cập nhật dễ dàng',
        color: Colors.orangeAccent,
        fontSize: 38,
      ),
      TextContent(
        'Một codebase duy nhất giúp cập nhật đồng bộ và ít lỗi',
        fontSize: 32,
      ),
      TextContent(
        'Dễ kiểm soát version và triển khai tính năng mới',
        fontSize: 32,
      ),
      TitleContent(
        '4. Trải nghiệm người dùng thống nhất',
        color: Colors.purpleAccent,
        fontSize: 38,
      ),
      TextContent(
        'Giao diện, logic hoạt động giống nhau trên nhiều thiết bị',
        fontSize: 32,
      ),
      TextContent('Giữ thương hiệu & thiết kế nhất quán', fontSize: 32),
    ],
  ),

  Slide(
    tag: 'cross-platform-history',
    backgroundImage: ImageSource.asset('assets/images/cr2.png'),
    alignment: Alignment.centerLeft,
    content: [
      TitleContent('Lịch sử phát triển Cross-Platform', fontSize: 60),
      TitleContent(
        'Hybrid Apps (Web-based):',
        color: Colors.limeAccent,
        fontSize: 38,
      ),
      TextContent('Cordova, Ionic.', fontSize: 32),
      TextContent(
        'Cách hoạt động: Dùng WebView, xây dựng bằng HTML/CSS/JS.',
        fontSize: 32,
      ),
      TextContent(
        'Ưu/nhược điểm: Phát triển nhanh, nhưng hiệu năng và trải nghiệm chưa tốt.',
        fontSize: 32,
      ),
      TitleContent(
        'Native-like Apps:',
        color: Colors.lightGreenAccent,
        fontSize: 38,
      ),
      TextContent('React Native, Xamarin, Flutter.', fontSize: 32),
      TextContent(
        'Cách hoạt động: Compile ra mã native hoặc sử dụng bridge.',
        fontSize: 32,
      ),
      TextContent(
        'Ưu/nhược điểm: Gần hiệu năng Native hơn, trải nghiệm tốt hơn Hybrid.',
        fontSize: 32,
      ),
    ],
  ),

  Slide(
    tag: 'chart',
    content: [
      TitleContent('Biểu đồ xu hướng framework cross-platform (2015-2025)\n'),
      ChartContent(FrameworkTrendChart()),
    ],
  ),

  Slide(
    tag: 'flutter1',
    backgroundImage: ImageSource.asset('assets/images/def_bg2.jpg'),
    alignment: Alignment.centerLeft,
    content: [
      TitleContent('Flutter là gì', color: Colors.blue),
      TextContent(
        'Flutter là một SDK mã nguồn mở được tạo ra bởi Google.\nNó được sử dụng để phát triển các ứng dụng đa nền tảng từ một codebase duy nhất',
        fontSize: 32,
      ),
      TitleContent(
        'Ngôn ngữ & kiến trúc',
        color: Colors.yellowAccent,
        fontSize: 38,
      ),
      TextContent('• Sử dụng ngôn ngữ Dart do Google phát triển', fontSize: 32),
      TextContent(
        '• Flutter sử dụng render engine Skia/Impeller để render UI tự động từng pixel, không phụ thuộc vào widget native như React Native hay Xamarin.',
        fontSize: 32,
      ),
      TitleContent(
        'Hot Reload & Widget phong phú',
        color: Colors.greenAccent,
        fontSize: 38,
      ),
      TextContent(
        '• Hot Reload giúp hiển thị thay đổi mã gần như ngay lập tức mà không mất trạng thái hiện tại của ứng dụng, giúp tăng tốc độ phát triển.',
        fontSize: 32,
      ),
      TextContent(
        '• Thư viện widget thiết kế đẹp mắt (Material Design, Cupertino…) với khả năng tùy chỉnh cao, giúp tạo giao diện UI linh hoạt sắc nét trên mọi nền tảng.',
        fontSize: 32,
      ),
      TitleContent(
        'Cộng đồng lớn và phát triển',
        color: Colors.orangeAccent,
        fontSize: 38,
      ),
      TextContent(
        '• Flutter được Google duy trì và hỗ trợ cộng đồng mã nguồn mở toàn cầu, với nhiều package và plugin hỗ trợ sẵn trên pub.dev.',
        fontSize: 32,
      ),
      TextContent(
        '• Được sử dụng trong các sản phẩm cả nội bộ Google như Google Pay, Google Earth… cũng như nhiều công ty lớn như Alibaba, ByteDance.v.v.',
        fontSize: 32,
      ),
    ],
  ),
  Slide(
    tag: 'timeline',
    backgroundImage: ImageSource.asset('assets/images/def_bg.jpeg'),
    content: [
      TitleContent('Các cột mốc phát triển của Flutter\n'),
      TimelineContent([
        TimelineData(
          datetime: "5/2017",
          title: "Phát hành Flutter Alpha",
          contents: [
            "Google phát hành phiên bản alpha đầu tiên của Flutter",
            "Bao gồm bộ sưu tập widgets và công cụ để xây dựng giao diện cho Android và iOS",
          ],
          color: Colors.blue,
        ),
        TimelineData(
          datetime: "2017",
          title: "First Commercial App",
          contents: [
            "Ứng dụng Hamilton là ứng dụng Flutter đầu tiên ngoài Google",
            "Phát triển và ra mắt trên chỉ trong vòng ba tháng với 500k+ active user, 3.5M lượt tải",
          ],
          color: Colors.redAccent,
        ),
        TimelineData(
          datetime: "4/12/2018",
          title: "Flutter 1.0",
          contents: [
            "Phát hành chính thức tại sự kiện Flutter Live '18 ở London",
            "Giới thiệu Hot Reload và Add-to-App features",
            "Hỗ trợ 50 ngôn ngữ UI localization",
          ],
          color: Colors.green,
        ),
        TimelineData(
          datetime: "5/2019",
          title: "Flutter for Web và macOS",
          contents: [
            "Mở rộng hỗ trợ cho web và macOS (alpha)",
            "Giới thiệu dự án Hummingbird để đưa Flutter lên web",
          ],
          color: Colors.orange,
        ),

        TimelineData(
          datetime: "3/2021",
          title: "Flutter 2.0",
          contents: [
            "Hỗ trợ thêm web, macOS, Windows và Linux",
            "Ra mắt Dart 2.12 với null safety",
          ],
          color: Colors.cyan,
        ),
        TimelineData(
          datetime: "5/2022",
          title: "Flutter 3.0",
          contents: [
            "Tất cả 6 nền tảng (iOS, Android, web, Windows, macOS, Linux) đều stable",
            "Giới thiệu Flutter Casual Games Tool Kit",
          ],
          color: Colors.redAccent,
        ),
        TimelineData(
          datetime: "8/2022",
          title: "Flutter 3.3 - Giới thiệu Impeller",
          contents: [
            "Giới thiệu render engine Impeller",
            "Hỗ trợ tương tác Objective-C và Swift",
            "Cải thiện Material Design và hiệu suất",
          ],
          color: Colors.teal,
        ),
        TimelineData(
          datetime: "25/1/2023",
          title: "Flutter 3.7",
          contents: [
            "Giới thiệu Material Design 3",
            "Giới thiệu Impeller preview cho iOS",
            "Cải thiện scrolling và DevTools",
          ],
          color: Colors.indigo,
        ),
        TimelineData(
          datetime: "5/2023",
          title: "Flutter 3.10",
          contents: [
            "Hơn 1M ứng dụng Flutter được xuất bản",
            "Impeller mặc định trên iOS",
            "Cải thiện hiệu suất tải web lên 42%",
          ],
          color: Colors.deepOrange,
        ),
        TimelineData(
          datetime: "8/2023",
          title: "Flutter 3.13",
          contents: [
            "Cải thiện hiệu suất Impeller trên iOS (giảm 50% thời gian rasterization)",
            "API mới cho thiết bị gập (foldable devices)",
          ],
          color: Colors.brown,
        ),

        TimelineData(
          datetime: "11/2032",
          title: "Flutter 3.27",
          contents: [
            "Cải tiến Cupertino widgets với iOS 15+ styles",
            "Impeller là default engine cho cả iOS và Android",
          ],
          color: Colors.deepPurple,
        ),
        TimelineData(
          datetime: "5/2025",
          title: "Flutter 3.38",
          contents: [
            "Dart code chạy trên main thread thay vì UI thread riêng",
            "Impeller là default rendering engine trên Android",
            "Website rewrite với dark mode support",
          ],
          color: Colors.green,
        ),
      ]),
    ],
  ),
  Slide(
    tag: 'q&a',
    backgroundImage: ImageSource.asset('assets/images/qna_bg.jpg'),
    content: [TitleContent('Q&A')],
    alignment: Alignment.center,
  ),
  Slide(
    tag: 'thank',
    backgroundImage: ImageSource.asset('assets/images/qna_bg.jpg'),
    content: [TitleContent('Thank you!')],
  ),
];
