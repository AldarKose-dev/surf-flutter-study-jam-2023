import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/enums/ticket_download_status.dart';

part 'ticket_model.freezed.dart';
part 'ticket_model.g.dart';

@freezed
class Ticket with _$Ticket {
  const factory Ticket(
      {String? title,
      required String url,
      String? path,
      int? id,
      int? downloadDate,
      @Default(0.0) double downloadProgress,
      @Default(0) int ticketDownloadStatus}) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}
