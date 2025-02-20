import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:earndia_app/widgets/top_bar.dart';
import 'package:earndia_app/widgets/blog/blog_tab_view.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

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
                child: const BlogTabView(
                  tabTitles: ['热门', '商业', '技术', '科学'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
