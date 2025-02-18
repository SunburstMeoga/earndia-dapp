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
        body: SafeArea(
          child: Column(
            children: [
              // 顶部栏
              Container(
                height: statusBarHeight + appBarHeight, // 适配状态栏 & AppBar
                color: const Color(0xFF373A81), // 统一顶部栏颜色
                padding: EdgeInsets.only(
                  top: statusBarHeight, // 避免被状态栏遮挡
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  children: [
                    // 左边：日期
                    const Expanded(
                      flex: 1,
                      child: Text(
                        '2023-10-25', // 日期
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    // 中间：本地 Logo 图片
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Image.asset(
                          'assets/images/logo.png', // 这里加载本地 Logo 图片
                          width: 120, // Logo宽度
                          height: 40, // 调整 Logo 高度，避免过大
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // 右边：搜索 & 语言切换按钮
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
                child: Center(
                  child: CustomTabBar(
                    tabTitles: const ['热门新闻', '商业', '技术', '科学'],
                    tabViews: const [
                      Center(child: Text('热门新闻内容')),
                      Center(child: Text('商业内容')),
                      Center(child: Text('技术内容')),
                      Center(child: Text('科学内容')),
                    ],
                  ), // 新闻页面内容占位
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
