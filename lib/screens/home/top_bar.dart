import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 用于修改状态栏样式
import 'package:earndia_app/screens/home/custom_tab_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '新闻类App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewsPage(),
    );
  }
}

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top; // 获取状态栏高度
    double appBarHeight = 56.0; // AppBar 高度

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF373A81), // 设置状态栏背景颜色
        statusBarIconBrightness: Brightness.light, // 设置状态栏图标颜色（白色）
      ),
      child: Scaffold(
        body: Column(
          children: [
            // 顶部栏
            Container(
              height: statusBarHeight + appBarHeight, // 适配状态栏和AppBar
              color: const Color(0xFF373A81),
              padding: EdgeInsets.only(
                top: statusBarHeight,
                left: 16,
                right: 16,
              ),
              child: Row(
                children: [
                  // 日期
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  // Logo
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 100,
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // 搜索 & 语言切换
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // 主体内容
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 0), // 调整间距
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.red, // 设置边框颜色
                //     width: 1, // 边框宽度
                //   ),
                //   borderRadius: BorderRadius.circular(8), // 圆角
                // ),
                child: const CustomTabBar(
                  tabTitles: ['热门', '商业', '技术', '科学'],
                  tabViews: [
                    Center(child: Text('热门内容')),
                    Center(child: Text('商业内容')),
                    Center(child: Text('技术内容')),
                    Center(child: Text('科学内容')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
