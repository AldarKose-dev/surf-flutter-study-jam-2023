
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:surf_flutter_study_jam_2023/data/network/api/services/dio_service.dart';

abstract class TicketStorageRepository {
  Future<Response> getPdfByLink(urlOfPdf, Function(double) onProgressCallback);
}

@Singleton(as: TicketStorageRepository)
class TicketStorageRepositoryImpl implements TicketStorageRepository {
  TicketStorageRepositoryImpl(this.dioService);

  final DioService dioService;

  @override
  Future<Response> getPdfByLink(
      urlOfPdf, Function(double) onProgressCallback) async {
    final response = await dioService.downloadFromNetwork(
      path: urlOfPdf,
      options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
      onReceiveProgress: (received, total) {
        if (total != -1) {
          onProgressCallback(received / total);
        }
      },
    );
    return response;
  }
}
