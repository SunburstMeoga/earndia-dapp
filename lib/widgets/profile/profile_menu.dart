import 'package:flutter/material.dart';
import 'package:earndia_app/constants/colors.dart';
import 'package:earndia_app/widgets/blog/blog_tab_view.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  void _navigateToBlogList(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlogListPage(category: category),
      ),
    );
  }

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
            onTap: () => _navigateToBlogList(context, '全部'),
          ),
          MenuItem(
            icon: Icons.favorite_border,
            title: '收藏',
            onTap: () => _navigateToBlogList(context, '收藏'),
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

class BlogListPage extends StatelessWidget {
  final String category;

  const BlogListPage({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category == '全部' ? '所有博客' : '我的收藏'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: const BlogTabView(
        tabTitles: ['所有博客', '点赞', '收藏'],
      ),
    );
  }
}

class BlogItem extends StatelessWidget {
  final int index;

  const BlogItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          '博客标题 ${index + 1}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              '这是博客的简介内容 ${index + 1}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 16,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 4),
                Text(
                  '2024-01-${index + 1}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
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
