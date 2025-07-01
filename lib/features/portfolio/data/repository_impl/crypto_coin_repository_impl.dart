import '../../domain/domain.dart';
import '../data.dart';
import '../mappers/mappers.dart';

class CryptoCoinRepositoryImpl implements CryptoCoinRepository {
  final CryptoCoinProvider _cryptoCoinProvider;

  CryptoCoinRepositoryImpl({required CryptoCoinProvider cryptoCoinProvider})
    : _cryptoCoinProvider = cryptoCoinProvider;
  @override
  Future<List<CryptoCoinModel>> getCryptoCoinsList() async {
    final List<CryptoCoinEntity> cryptoList = await _cryptoCoinProvider
        .getCryptoCoinsList();

    return cryptoList.map(CryptoCoinMapper.fromEntity).toList();
  }
}
