import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_entity.g.dart';

@JsonSerializable()
class CryptoCoinEntity {
  final String id;
  final String name;
  final String symbol;
  final double priceUsd;
  final double change24h;

  const CryptoCoinEntity({
    required this.id,
    required this.name,
    required this.symbol,
    required this.priceUsd,
    required this.change24h,
  });

  factory CryptoCoinEntity.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinEntityToJson(this);
}
