import '../entities/entities.dart';

abstract class CryptoCoinProvider {
  Future<List<CryptoCoinEntity>> getCryptoCoinsList();
}
