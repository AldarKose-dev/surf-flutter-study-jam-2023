import 'package:dio/dio.dart';

abstract class DioService {
  Future<Response> downloadFromNetwork({
    required path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });
}
