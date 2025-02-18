import 'package:flutter/material.dart';
import 'package:earndia_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '新闻类App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigationExample(),
    );
  }
}

class BottomNavigationExample extends StatefulWidget {
  @override
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State<BottomNavigationExample> {
  int _selectedIndex = 0; // 当前选中的底部导航栏索引

  // 页面列表
  static final List<Widget> _pages = <Widget>[
    NewsPage(), // 新闻页面
    ViewPage(), // 视图页面
    ProfilePage(), // 我的页面
  ];

  // 底部导航栏点击事件
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // 显示当前选中的页面
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // 当前选中的索引
        onTap: _onItemTapped, // 点击事件
        selectedItemColor: Color(0xFF373A81), // 选中状态的颜色
        unselectedItemColor: Colors.black, // 未选中状态的颜色
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article), // 新闻图标
            label: '新闻', // 新闻文字
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list), // 视图图标
            label: '视图', // 视图文字
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // 我的图标
            label: '我的', // 我的文字
          ),
        ],
      ),
    );
  }
}

// 新闻页面
class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: HomePage(),
    );
  }
}

// 视图页面
class ViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('视图页面'),
    );
  }
}

// 我的页面
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我的页面'),
    );
  }
}
