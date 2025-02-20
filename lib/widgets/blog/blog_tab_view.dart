import 'package:flutter/material.dart';
import 'package:earndia_app/constants/colors.dart';
import 'package:earndia_app/screens/blog/blog_detail_page.dart';

class BlogTabView extends StatelessWidget {
  final List<String> tabTitles;

  const BlogTabView({
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
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              unselectedLabelStyle: const TextStyle(fontSize: 14),
              tabs: tabTitles.map((title) => Tab(text: title)).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: tabTitles.map((title) {
                return BlogListView(category: title);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BlogListView extends StatelessWidget {
  final String category;

  const BlogListView({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return BlogItem(
          index: index + 1,
          title: '美联储周四料将降息，但面临四大问题',
          date: '2023-7-12 16:45:37',
          category: '文静',
          action: '转载',
        );
      },
    );
  }
}

class BlogItem extends StatelessWidget {
  final int index;
  final String title;
  final String date;
  final String category;
  final String action;

  const BlogItem({
    super.key,
    required this.index,
    required this.title,
    required this.date,
    required this.category,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailPage(
              title: title,
              category: category,
              date: date,
              author: '文静',
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(right: 12, top: 4),
              decoration: BoxDecoration(
                color: index <= 3 ? AppColors.primary : Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  index.toString().padLeft(2, '0'),
                  style: TextStyle(
                    color: index <= 3 ? Colors.white : Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                    child: Row(
                      children: [
                        Text(category),
                        const SizedBox(width: 8),
                        Text(
                          '|',
                          style: TextStyle(color: Colors.grey[300]),
                        ),
                        const SizedBox(width: 8),
                        Text(action),
                        Expanded(
                          child: Text(
                            date,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 100,
              height: 75,
              child: Image.asset(
                'assets/blogs/blog.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
