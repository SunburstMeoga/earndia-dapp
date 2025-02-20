import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final double statusBarHeight;
  final double appBarHeight;

  const TopBar({
    super.key,
    required this.statusBarHeight,
    required this.appBarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: statusBarHeight + appBarHeight,
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
    );
  }
}