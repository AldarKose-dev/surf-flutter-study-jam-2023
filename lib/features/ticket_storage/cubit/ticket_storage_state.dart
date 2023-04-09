import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ordering.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ticket_model.dart';

part 'ticket_storage_state.freezed.dart';

@Freezed()
class TicketStorageState with _$TicketStorageState {
  const factory TicketStorageState({
    String? urlOfPdf,
    List<Ticket>? listOfTickets,
    File? selectedTicketFile,
    @Default(Ordering.nameAsc()) Ordering ordering,
  }) = _TicketStorageState;
}
