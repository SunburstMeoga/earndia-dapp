import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:earndia_app/services/wallet_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? qrCodeUri;

  @override
  void initState() {
    super.initState();
    _login();
  }

  void _login() async {
    final WalletService walletService = WalletService();

    try {
      print("Starting WalletConnect session...");
      await walletService.createSession((uri) {
        print('Received URI: $uri');
        setState(() {
          qrCodeUri = uri;
        });
      });
    } catch (e) {
      print('Error connecting wallet: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login with WalletConnect")),
      body: Center(
        child: qrCodeUri == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Scan this QR code in your wallet app!"),
                ],
              ),
      ),
    );
  }
}
