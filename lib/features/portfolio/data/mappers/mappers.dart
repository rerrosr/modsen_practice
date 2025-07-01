import '../../domain/domain.dart';
import '../data.dart';

class CryptoCoinMapper {
  static CryptoCoinModel fromEntity(CryptoCoinEntity entity) {
    return CryptoCoinModel(
      id: entity.id,
      name: entity.name,
      symbol: entity.symbol,
      priceUsd: entity.priceUsd,
      change24h: entity.change24h,
    );
  }

  static CryptoCoinEntity fromModel(CryptoCoinModel model) {
    return CryptoCoinEntity(
      id: model.id,
      name: model.name,
      symbol: model.symbol,
      priceUsd: model.priceUsd,
      change24h: model.change24h,
    );
  }
}
