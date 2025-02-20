import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:earndia_app/constants/colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  void _showEditNameDialog(BuildContext context, String currentName) {
    final TextEditingController controller =
        TextEditingController(text: currentName);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          '修改名字',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: '请输入新的名字',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              '取消',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () {
              // TODO: 实现保存名字的逻辑
              Navigator.pop(context);
            },
            child: const Text(
              '确定',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/profile_image.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '万花筒',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            IconButton(
              padding: const EdgeInsets.only(left: 4),
              constraints: const BoxConstraints(),
              icon: Icon(
                Icons.edit,
                size: 16,
                color: AppColors.primary,
              ),
              onPressed: () => _showEditNameDialog(context, '万花筒'),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          '推荐人: 紫巴拉',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '0x44FA...bdD6',
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
