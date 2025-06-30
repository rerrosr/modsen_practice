import '../domain.dart';

abstract class CryptoCoinRepository {
  Future<List<CryptoCoinModel>> getCryptoCoinsList();
}
