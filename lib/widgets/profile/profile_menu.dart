import 'package:flutter/material.dart';
import 'package:earndia_app/constants/colors.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          MenuItem(
            icon: Icons.article_outlined,
            title: '所有博客',
            onTap: () {},
          ),
          MenuItem(
            icon: Icons.favorite_border,
            title: '收藏',
            onTap: () {},
          ),
          MenuItem(
            icon: Icons.settings_outlined,
            title: '设置',
            onTap: () {},
          ),
          MenuItem(
            icon: Icons.help_outline,
            title: '帮助与反馈',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}
