import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class DioRepository {
  Future<Response> sendToApi({
    required token,
    required path,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response> getFromApi({
    required path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response> deleteFromApi({
    required token,
    required path,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });
  Future<Response> downloadFromApi({
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
  Future<Response> sendToApi({
    required token,
    required path,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var dio = Dio();
      dio.options.baseUrl = "https://test-portfolio-jvhy.vercel.app";
      dio.options.headers['Authorization'] = "Bearer $token";
      dio.options.headers['accept'] = 'application/json';

      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        // options: Options(
        //     followRedirects: false,
        //     validateStatus: (status) {
        //       return status! < 500;
        //     }),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print("Response was successful: ${response}");
      return response;
    } catch (e) {
      print("Api fail" + e.toString());
      rethrow;
    }
  }

  @override
  Future<Response> getFromApi({
    required path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var dio = Dio();
      dio.options.baseUrl = "https://test-portfolio-jvhy.vercel.app";

      dio.options.headers['accept'] = 'application/json';
      final response = dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<Response> deleteFromApi({
    required token,
    required path,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var dio = Dio();
      dio.options.baseUrl = "https://test-portfolio-jvhy.vercel.app";
      dio.options.headers['accept'] = 'application/json';
      dio.options.headers['Authorization'] = "Bearer $token";
      final response = dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<Response> downloadFromApi(
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
      print(e);
      rethrow;
    }
  }
}
