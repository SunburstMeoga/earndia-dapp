import 'package:flutter/material.dart';

class HotRanking extends StatelessWidget {
  const HotRanking({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.trending_up, color: Colors.blue),
              const SizedBox(width: 8),
              const Text(
                '热搜榜',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text('更多 >'),
              ),
            ],
          ),
          _buildRankingItem(
            '01',
            '美联储周四料将降息，但面临四大问题',
          ),
          _buildRankingItem(
            '02',
            '第七届进博会·新华时评七年进博的...',
          ),
          _buildRankingItem(
            '03',
            '大神狂秀技术!成功让三星手机用上...',
          ),
        ],
      ),
    );
  }

  Widget _buildRankingItem(String rank, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            rank,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
