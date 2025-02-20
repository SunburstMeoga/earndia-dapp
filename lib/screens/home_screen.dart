import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:earndia_app/screens/home/custom_tab_bar.dart';
import 'package:earndia_app/widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = 56.0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF373A81),
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Column(
          children: [
            TopBar(
              statusBarHeight: statusBarHeight,
              appBarHeight: appBarHeight,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 0,
                ),
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
