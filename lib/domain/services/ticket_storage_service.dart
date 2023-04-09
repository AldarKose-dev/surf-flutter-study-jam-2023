import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ticket_model.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ordering.dart'
    as ordering;

abstract class TicketStorageService {
  Future<Either<String, String>> downloadPdfByLink(
      String urlOfPdf,
      Function(double)
          onProgressCallback); //Метод для загрузки PDF-файла по указанной ссылке.
  //Принимает ссылку на PDF-файл и функцию обратного вызова для отслеживания прогресса загрузки(увы не успел этот колбек использовать)
  Future<void> addNewTicket(
      Ticket ticket); //Метод для добавления нового билета в хранилище.
  Future<List<Ticket>> getTickets(
      ordering.Ordering?
          ordering); //Иетод для получения списка всех билетов из хранилища.
  Future<File>
      getTicketFromDatabase(); //Метод для получения PDF-файла билета из базы данных.
  Future<void> addPathToDownloadedTicketPdf(
      Ticket
          ticket); //Метод для добавления пути к загруженному PDF-файлу в объект билета в хранилище.
  Future<int> deleteTicket(
      Ticket ticket); //Метод для удаления билета из хранилища.
}
