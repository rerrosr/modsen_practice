import 'package:dio/dio.dart';

import '../data.dart';

class CryptoCoinProviderImpl implements CryptoCoinProvider {
  final Dio _dio;

  CryptoCoinProviderImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<CryptoCoinEntity>> getCryptoCoinsList() async {
    final Response<dynamic> response = await _dio.get('');

    throw UnimplementedError(
      'CryptoCoinProviderImpl.getCryptoCoinsList is not implemented yet.',
    );
  }
}
