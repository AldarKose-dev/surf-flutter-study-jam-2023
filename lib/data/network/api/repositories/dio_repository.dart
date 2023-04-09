import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class DioRepository {
  Future<Response> downloadFromNetwork({
    required path,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });
}

@Singleton(as: DioRepository)
class DioRepositoryImpl implements DioRepository {
  @override
  Future<Response> downloadFromNetwork(
      {required path,
      data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      var dio = Dio();
      dio.options.headers['accept'] = 'application/pdf';
      final response = dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
