import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:earndia_app/constants/colors.dart';
import 'package:earndia_app/widgets/profile/profile_header.dart';
import 'package:earndia_app/widgets/profile/profile_stats.dart';
import 'package:earndia_app/widgets/profile/profile_rewards.dart';
import 'package:earndia_app/widgets/profile/profile_menu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final profileImageSize = 120.0;
    final backgroundHeight = statusBarHeight + (profileImageSize / 2);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            // 顶部背景色
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: backgroundHeight,
              child: Container(
                color: AppColors.primary,
              ),
            ),
            // 内容区域
            Column(
              children: [
                SizedBox(height: statusBarHeight),
                const Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProfileHeader(),
                        SizedBox(height: 20),
                        ProfileStats(),
                        SizedBox(height: 20),
                        ProfileRewards(),
                        SizedBox(height: 20),
                        ProfileMenu(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
