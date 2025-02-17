import 'package:walletconnect_dart/walletconnect_dart.dart';

class WalletService {
  late WalletConnect connector;

  WalletService() {
    connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'Earndia',
        description: 'A Flutter DApp',
        url: 'https://example.com',
      ),
    );
  }

  Future<void> createSession(Function(String) onDisplayUri) async {
    try {
      await connector.createSession(
        onDisplayUri: (uri) {
          print("Generated URI: $uri");
          onDisplayUri(uri);
        },
      );
    } catch (e) {
      print("Failed to create session: $e");
      rethrow;
    }
  }
}
