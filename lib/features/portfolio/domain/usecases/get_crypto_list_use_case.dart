import '../domain.dart';

class GetCryptoListUseCase {
  final CryptoCoinRepository _cryptoCoinRepository;

  GetCryptoListUseCase({required CryptoCoinRepository cryptoCoinRepository})
    : _cryptoCoinRepository = cryptoCoinRepository;

  Future<List<CryptoCoinModel>> execute() async {
    return _cryptoCoinRepository.getCryptoCoinsList();
  }
}
