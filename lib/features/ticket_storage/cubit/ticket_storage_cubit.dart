import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ordering.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ticket_model.dart';
import 'package:surf_flutter_study_jam_2023/domain/services/ticket_storage_service.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/cubit/ticket_storage_state.dart';

@injectable
class TicketStorageCubit extends Cubit<TicketStorageState> {
  final TicketStorageService _ticketStorageService;
  TicketStorageCubit(this._ticketStorageService)
      : super(const TicketStorageState()) {
    getListOfTickets();
  }
  void onPdfUrlChanged(String value) {
    emit(
      state.copyWith(urlOfPdf: value),
    );
  }

  Future<void> openTicketPdf(Ticket ticketToShow) async {
    if (state.selectedTicketFile != null) {
      emit(state.copyWith(selectedTicketFile: null));
    }
    print(ticketToShow);
    emit(state.copyWith(selectedTicketFile: File(ticketToShow.path!)));
  }

  Future<void> downloadPdf(Ticket ticketToDownload) async {
    // var downloadingTicket = state.listOfTickets!
    //     .indexWhere((element) => element == ticketToDownload);
    final pdf = await _ticketStorageService
        .downloadPdfByLink(ticketToDownload.url, (progress) {
      // var newList = state.listOfTickets;
      // Ticket newTicket = state.listOfTickets![downloadingTicket]
      //     .copyWith(downloadProgress: progress);
      // newList![downloadingTicket] = newTicket;
      // emit(state.copyWith(listOfTickets: newList));
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
              downloadDate: DateTime.now().millisecondsSinceEpoch));
      await getListOfTickets();
    });
  }

  void onOrderingChanged(Ordering ordering) async {
    emit(state.copyWith(ordering: ordering));
    try {
      await getListOfTickets();
    } catch (e) {
      print(e);
    }
  }

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

  Future<void> getListOfTickets() async {
    try {
      final tickets = await _ticketStorageService.getTickets(state.ordering);
      emit(state.copyWith(listOfTickets: tickets));
    } catch (e) {
      print(e);
    }
  }

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

  Future<void> shareTicket() async {
    await Share.shareXFiles([XFile(state.selectedTicketFile!.path)],
        text: 'Surf Jam is Cool!');
  }

  Future<void> downloadAll() async {
    try {
      bool noNeedToDownload =
          state.listOfTickets!.every((ticket) => ticket.path != null);
      if (noNeedToDownload) {
        Fluttertoast.showToast(
            msg: "Все билеты уже скачаны!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            fontSize: 16);
      } else {
        await Future.wait(
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
