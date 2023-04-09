import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ordering.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ticket_model.dart';

part 'ticket_storage_state.freezed.dart';

// класс состояния главного ждкрана по показу билетов
@Freezed() 
class TicketStorageState with _$TicketStorageState {
  const factory TicketStorageState({
    String? urlOfPdf, // ссылка введенная при добавлении пдф
    List<Ticket>? listOfTickets, // список билетов с БД
    File? selectedTicketFile, // выбранный пдф файл который нужно открыть
    @Default(Ordering.dateDownloadedAsc())
        Ordering ordering, //  вид сортировки билетов
  }) = _TicketStorageState;
}
