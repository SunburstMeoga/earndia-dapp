import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabTitles;
  final List<Widget> tabViews;

  CustomTabBar({required this.tabTitles, required this.tabViews});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitles.length,
      child: Scaffold(
        appBar: AppBar(
          // title: Text('Tab Example'),
          bottom: TabBar(
            labelColor: const Color(0xFF373A81), // 选中Tab文字颜色
            unselectedLabelColor: Colors.black, // 未选中Tab文字颜色
            indicatorColor: const Color(0xFF373A81), // 选中Tab下划线颜色
            labelStyle: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16), // 选中Tab字体加粗、变大
            unselectedLabelStyle: const TextStyle(fontSize: 14), // 未选中Tab字体大小
            tabs: tabTitles.map((title) => Tab(text: title)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabViews,
        ),
      ),
    );
  }
}
