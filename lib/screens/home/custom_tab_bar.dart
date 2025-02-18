import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabTitles;
  final List<Widget> tabViews;

  const CustomTabBar(
      {super.key, required this.tabTitles, required this.tabViews});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitles.length, // 设置Tab数量
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48), // 设置 TabBar 的高度
          child: Container(
            color: Colors.transparent, // 设置背景颜色为透明
            child: TabBar(
              labelColor: const Color(0xFF373A81), // 选中Tab文字颜色
              unselectedLabelColor: Colors.black, // 未选中Tab文字颜色
              indicatorColor: const Color(0xFF373A81), // 选中Tab下划线颜色
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16), // 选中Tab字体加粗、变大
              unselectedLabelStyle: const TextStyle(fontSize: 14), // 未选中Tab字体大小
              tabs:
                  tabTitles.map((title) => Tab(text: title)).toList(), // 渲染Tab
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0), // 添加合适的内边距，避免TabView内容太紧
          child: TabBarView(
            children: tabViews.map((tabView) {
              return Container(
                child: tabView,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
