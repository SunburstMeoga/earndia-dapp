import 'package:flutter/material.dart';
import 'package:earndia_app/constants/colors.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabTitles;

  const CustomTabBar({
    super.key,
    required this.tabTitles,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitles.length,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: Colors.black,
              indicatorColor: AppColors.primary,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              unselectedLabelStyle: const TextStyle(fontSize: 14),
              tabs: tabTitles.map((title) => Tab(text: title)).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: tabTitles.map((title) {
                return ListView.builder(
                  itemCount: 10,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return BlogItem(
                      title: '标题 $index',
                      summary: '这是一段简介内容 $index',
                      category: title,
                      date: '2024-01-${index + 1}',
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BlogItem extends StatelessWidget {
  final String title;
  final String summary;
  final String category;
  final String date;

  const BlogItem({
    super.key,
    required this.title,
    required this.summary,
    required this.category,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              summary,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
