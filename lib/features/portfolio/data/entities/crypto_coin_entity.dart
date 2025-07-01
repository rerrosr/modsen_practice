import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_entity.g.dart';

@JsonSerializable()
class CryptoCoinEntity {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'image')
  final String symbol;
  @JsonKey(name: 'current_price')
  final double priceUsd;
  @JsonKey(name: 'price_change_24h')
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
