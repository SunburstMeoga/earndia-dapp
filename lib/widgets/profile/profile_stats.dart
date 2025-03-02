import 'package:flutter/material.dart';
import 'package:earndia_app/constants/colors.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileStats extends StatefulWidget {
  const ProfileStats({super.key});

  @override
  _ProfileStatsState createState() => _ProfileStatsState();
}

class _ProfileStatsState extends State<ProfileStats> {
  String walletAddress = '';
  bool isConnected = false;
  late WalletConnect connector;

  @override
  void initState() {
    super.initState();
    connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'Your App Name',
        description: 'Your App Description',
        url: 'https://your-app-url.com',
        icons: ['https://your-app-url.com/icon.png'],
      ),
    );
  }

  Future<void> _connectWallet() async {
    if (!isConnected) {
      try {
        // 创建连接会话
        final session = await connector.createSession(
          chainId: 1, // Ethereum主网
          onDisplayUri: (uri) async {
            // 使用钱包应用打开连接URI
            final mobileUri = uri.replaceAll('wc:', 'metamask:');
            if (await canLaunch(mobileUri)) {
              await launch(mobileUri);
            } else {
              // 如果未安装MetaMask，跳转下载页面
              await launch('https://metamask.io/download/');
            }
          },
        );

        // 监听连接事件
        connector.on('connect', (SessionStatus session) {
          setState(() {
            isConnected = true;
            if (session.accounts.isNotEmpty) {
              walletAddress = session.accounts[0];
            }
          });
        });

        // 监听断开连接事件
        connector.on('disconnect', (dynamic _) {
          setState(() {
            isConnected = false;
            walletAddress = '';
          });
        });
      } catch (e) {
        _showErrorDialog('连接失败: ${e.toString()}');
      }
    } else {
      // 断开连接
      await connector.killSession();
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('错误'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('确定'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              StatItem(label: '关注', value: '0'),
              StatItem(label: '收藏', value: '20'),
              StatItem(label: '浏览', value: '369'),
            ],
          ),
        ),
        GestureDetector(
          onTap: _connectWallet,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: isConnected ? Colors.green : AppColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                isConnected
                    ? '已连接: ${walletAddress.substring(0, 6)}...'
                    : '链接钱包',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  final String label;
  final String value;

  const StatItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
