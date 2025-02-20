import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:earndia_app/widgets/top_bar.dart';
import 'package:earndia_app/widgets/home/home_banner.dart';
import 'package:earndia_app/widgets/home/hot_ranking.dart';
import 'package:earndia_app/constants/colors.dart';

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
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    Container(
                      color: AppColors.primary,
                      child: const TabBar(
                        isScrollable: true,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white70,
                        indicatorColor: Colors.white,
                        tabs: [
                          Tab(text: '热门'),
                          Tab(text: '商业'),
                          Tab(text: '技术'),
                          Tab(text: '科学'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: List.generate(4, (index) {
                          return const SingleChildScrollView(
                            child: Column(
                              children: [
                                HomeBanner(),
                                HotRanking(),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
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
