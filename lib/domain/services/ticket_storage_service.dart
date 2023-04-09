import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ticket_model.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ordering.dart' as ordering;

abstract class TicketStorageService {
  Future<Either<String, String>> downloadPdfByLink(
      String urlOfPdf, Function(double) onProgressCallback);
  Future<void> addNewTicket(Ticket ticket);
  Future<List<Ticket>> getTickets(ordering.Ordering? ordering);
  Future<File> getTicketFromDatabase();
  Future<void> addPathToDownloadedTicketPdf(Ticket ticket);
  Future<int> deleteTicket(Ticket ticket);
}
