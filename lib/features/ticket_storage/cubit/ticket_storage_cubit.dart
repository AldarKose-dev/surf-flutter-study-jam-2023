import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ordering.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ticket_model.dart';
import 'package:surf_flutter_study_jam_2023/domain/services/ticket_storage_service.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/cubit/ticket_storage_state.dart';
// кубит главной страницы по показу билетов

@injectable
class TicketStorageCubit extends Cubit<TicketStorageState> {
  final TicketStorageService _ticketStorageService;
  TicketStorageCubit(this._ticketStorageService)
      : super(const TicketStorageState()) {
    getListOfTickets();
  }
  // Обработчик изменения URL PDF файла
  void onPdfUrlChanged(String value) {
    emit(
      state.copyWith(urlOfPdf: value), // Изменение состояния: URL PDF файла
    );
  }

  // Открытие PDF файла билета
  Future<void> openTicketPdf(Ticket ticketToShow) async {
    if (state.selectedTicketFile != null) {
      // Если выбранный билет уже открыт, то его нужно закрыть
      emit(state.copyWith(selectedTicketFile: null));
    }
    print(ticketToShow);
    emit(state.copyWith(
        selectedTicketFile: File(ticketToShow.path!))); // Открытие файла билета
  }

  // Загрузка PDF файла билета
  Future<void> downloadPdf(Ticket ticketToDownload) async {
    final pdf = await _ticketStorageService
        .downloadPdfByLink(ticketToDownload.url, (progress) {
      // Функция обратного вызова на каждое изменение состояния загрузки PDF файла
    });
    pdf.fold((l) {
      print(l);
      Fluttertoast.showToast(
          msg: l,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 1,
          fontSize: 16);
    }, (r) async {
      print('я скачался $r');
      await _ticketStorageService.addPathToDownloadedTicketPdf(
          ticketToDownload.copyWith(
              path: r.toString(),
              ticketDownloadStatus: 2,
              downloadProgress: 1,
              downloadDate: DateTime.now()
                  .millisecondsSinceEpoch)); // Сохранение пути загруженного PDF файла в базу данных
      await getListOfTickets(); // Обновление списка билетов после загрузки
    });
  }

  // Обработчик изменения сортировки списка билетов
  void onOrderingChanged(Ordering ordering) async {
    emit(state.copyWith(
        ordering: ordering)); // Изменение состояния: сортировка списка билетов
    try {
      await getListOfTickets(); // Обновление списка билетов после изменения сортировки
    } catch (e) {
      print(e);
    }
  }
  // добавяляет билет в sqflte
  Future<void> saveTicketToLocalDb(String urlOfPdf) async {
    try {
      await _ticketStorageService.addNewTicket(
        Ticket(
            url: urlOfPdf,
            title: urlOfPdf.substring(urlOfPdf.lastIndexOf('/') + 1)),
      );
      await getListOfTickets();
      Fluttertoast.showToast(
          msg: "Билет был успешно добавлен!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          fontSize: 16);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Случилась неприятность, билет не добавлен :(",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          fontSize: 16);
    }
  }
  // получаем список билетов из БД
  Future<void> getListOfTickets() async {
    try {
      final tickets = await _ticketStorageService.getTickets(state.ordering);
      emit(state.copyWith(listOfTickets: tickets));
    } catch (e) {
      print(e);
    }
  }
  // удаляет билет по  с БД
  Future<void> deleteTicket(Ticket ticket) async {
    try {
      await _ticketStorageService.deleteTicket(ticket);
      await getListOfTickets();
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Случилась неприятность, не удалось удалить билет :(",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          fontSize: 16);
    }
  }
  // Метод для того чтобы поделится билетом
  Future<void> shareTicket() async {
    await Share.shareXFiles([XFile(state.selectedTicketFile!.path)],
        text: 'Surf Jam is Cool!');
  }
  // Метод для скачивания всех билетов
  Future<void> downloadAll() async {
    try {
      bool noNeedToDownload = // проверка на то есть ли у них путь уже
          state.listOfTickets!.every((ticket) => ticket.path != null);
      if (noNeedToDownload) {
        Fluttertoast.showToast(
            msg: "Все билеты уже скачаны!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            fontSize: 16);
      } else {
        await Future.wait( // через Future.wait выполняем лист запросов на скачку всех пдф
          state.listOfTickets!.map(
            (ticket) {
              return downloadPdf(ticket);
            },
          ),
        );
      }
    } catch (e) {}
  }
}

extension UrlFileNameExtension on String {
  String get fileNameFromUrl {
    final uri = Uri.parse(this);
    return uri.pathSegments.last;
  }
}
