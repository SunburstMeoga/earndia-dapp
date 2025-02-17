import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

class Web3Service {
  late Web3Client client;

  Web3Service(String rpcUrl) {
    client = Web3Client(rpcUrl, Client());
  }

  Future<String> getAccountBalance(String address) async {
    final balance = await client.getBalance(EthereumAddress.fromHex(address));
    return balance.getValueInUnit(EtherUnit.ether).toString();
  }
}
