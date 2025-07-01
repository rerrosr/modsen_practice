import 'package:dio/dio.dart';

import '../data.dart';

class CryptoCoinProviderImpl implements CryptoCoinProvider {
  final Dio _dio;

  CryptoCoinProviderImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<CryptoCoinEntity>> getCryptoCoinsList() async {
    final Response<List<dynamic>> response = await _dio.get(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin%2Cethereum%2Ctether%2Cxrp%2Cbnb%2Csolana%2Cusdc%2Ctron%2Cdogecoin%2Csui%2Cusds',
      options: Options(
        headers: <String, dynamic>{
          'accept': 'CG-13mVXheXyzf1kQtbWJEsJDBo',
        },
      ),
    );

    return response.data?.map((dynamic item) {
          return CryptoCoinEntity.fromJson(item as Map<String, dynamic>);
        }).toList() ??
        <CryptoCoinEntity>[];
  }
}
