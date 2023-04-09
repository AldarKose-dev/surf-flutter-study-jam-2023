import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:surf_flutter_study_jam_2023/data/network/api/repositories/dio_repository.dart';
import 'package:surf_flutter_study_jam_2023/data/network/api/services/dio_service.dart';

import '../../dio_exception.dart';

// Класс DioServiceImpl реализует интерфейс DioService в качестве экземпляра singleton.
// юзаем его для обработки сетевых запросов с использованием библиотеки Dio.
@Singleton(as: DioService)
class DioServiceImpl implements DioService {
  DioServiceImpl(this.dioRepository);

  final DioRepository dioRepository;

  @override
  Future<Response> downloadFromNetwork(
      {required path,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final response = await DioRepositoryImpl().downloadFromNetwork(
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
}
