import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:surf_flutter_study_jam_2023/data/network/api/repositories/dio_repository.dart';
import 'package:surf_flutter_study_jam_2023/data/network/api/services/dio_service.dart';

import '../../dio_exception.dart';

@Singleton(as: DioService)
class DioServiceImpl implements DioService {
  DioServiceImpl(this.dioRepository);

  final DioRepository dioRepository;

  // @override
  // Future<Response> sendToApi({
  //   required path,
  //   data,
  //   Map<String, dynamic>? queryParameters,
  //   Options? options,
  //   CancelToken? cancelToken,
  //   ProgressCallback? onSendProgress,
  //   ProgressCallback? onReceiveProgress,
  // }) async {
  //   try {
  //     final token = await FirebaseAuth.instance.currentUser?.getIdToken();
  //     // debugPrint(token.toString(), wrapWidth: 3000);
  //     final pattern = RegExp('.{1,800}');
  //     // pattern
  //     //     .allMatches(token.toString())
  //     //     .forEach((match) => print(match.group(0)));
  //     final response = await DioRepositoryImpl().sendToApi(
  //       token: token,
  //       path: path,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: options,
  //       cancelToken: cancelToken,
  //       onSendProgress: onSendProgress,
  //       onReceiveProgress: onReceiveProgress,
  //     );
  //     // print(response);
  //     return response;
  //   } on DioError catch (e) {
  //     // print(e.response);
  //     final errorMessage = DioExceptions.fromDioError(e).toString();
  //     throw errorMessage;
  //   }
  // }

  @override
  Future<Response> getFromApi({
    required path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      //print(token);
      final response = await DioRepositoryImpl().getFromApi(
        path: path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  @override
  Future<Response> downloadFromApi(
      {required path,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final response = await DioRepositoryImpl().downloadFromApi(
        path: path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  // @override
  // Future<Response> deleteFromApi(
  //     {required path,
  //     data,
  //     Map<String, dynamic>? queryParameters,
  //     Options? options,
  //     CancelToken? cancelToken,
  //     ProgressCallback? onSendProgress,
  //     ProgressCallback? onReceiveProgress}) async {
  //   try {
  //     final token = await FirebaseAuth.instance.currentUser?.getIdToken();
  //     // debugPrint(token.toString(), wrapWidth: 3000);
  //     final pattern = RegExp('.{1,800}');
  //     // pattern
  //     //     .allMatches(token.toString())
  //     //     .forEach((match) => print(match.group(0)));
  //     final response = await DioRepositoryImpl().deleteFromApi(
  //         token: token,
  //         path: path,
  //         queryParameters: queryParameters,
  //         options: options,
  //         cancelToken: cancelToken,
  //         data: data);
  //     // print(response);
  //     return response;
  //   } on DioError catch (e) {
  //     // print(e.response);
  //     final errorMessage = DioExceptions.fromDioError(e).toString();
  //     throw errorMessage;
  //   }
  // }
}
