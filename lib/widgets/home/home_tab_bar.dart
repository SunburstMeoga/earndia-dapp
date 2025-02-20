import 'package:flutter/material.dart';
import 'package:earndia_app/constants/colors.dart';

class HomeTabBar extends StatelessWidget {
  final List<String> tabTitles;

  const HomeTabBar({
    super.key,
    required this.tabTitles,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        bottom: false,
        child: TabBar(
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: tabTitles.map((title) => Tab(text: title)).toList(),
        ),
      ),
    );
  }
}
