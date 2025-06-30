class CryptoCoinModel {
  final String id;
  final String name;
  final String symbol;
  final double priceUsd;
  final double change24h;

  CryptoCoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.priceUsd,
    required this.change24h,
  });
}
