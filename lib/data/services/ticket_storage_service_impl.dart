import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:surf_flutter_study_jam_2023/data/repositories/ticket_storage_repository.dart';
import 'package:surf_flutter_study_jam_2023/domain/entities/ticket_model.dart';
import 'package:surf_flutter_study_jam_2023/domain/services/ticket_storage_service.dart';
import 'package:path/path.dart' as path;
import 'package:surf_flutter_study_jam_2023/domain/entities/ordering.dart'
    as ordering;

@Singleton(as: TicketStorageService)
class TicketStorageServiceImpl implements TicketStorageService {
  TicketStorageServiceImpl(this._ticketStorageRepository);
  final TicketStorageRepository _ticketStorageRepository;
  Database? _database;
  // Метод для загрузки PDF-файла из Интернета по ссылке и сохранения его в приложении.
  @override
  Future<Either<String, String>> downloadPdfByLink(
      String urlOfPdf, Function(double) onProgressCallback) async {
    try {
      final response = await _ticketStorageRepository.getPdfByLink(
          urlOfPdf, onProgressCallback);
      final dir = await getApplicationDocumentsDirectory();
      File file = File(
          '${dir.path}/${urlOfPdf.substring(urlOfPdf.lastIndexOf('/') + 1)}');
      await file.writeAsBytes(response.data);
      return Right(file.path);
    } catch (e) {
      return Left(e.toString());
    }
  }

// Метод для получения базы данных SQLite для хранения билетов.
  Future<Database> get database async {
    _database = await openDatabase(
        path.join(await getDatabasesPath(), 'jam.db'),
        version: 1,
        onCreate: _createDB);
    return _database!;
  }
  // Метод для создания базы данных.

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tickets(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        url TEXT,
        title TEXT,
        downloadProgress REAL,
        ticketDownloadStatus INTEGER,
        path TEXT,
        downloadDate INTEGER 
        );
        ''');
  }

  // Метод для получения списка билетов из базы данных.
  @override
  Future<List<Ticket>> getTickets(ordering.Ordering? orderBy) async {
    final db = await database;
    List<Map<String, dynamic>> tickets;
    // здесь идет проверка на тип сортровки
    if (orderBy?.value == 'onlyDownloaded') {
      tickets = await db.query(
        'tickets',
        where: 'ticketDownloadStatus = ?',
        whereArgs: ['2'],
      );
    } else if (orderBy?.value == 'onlyNotDownloaded') {
      tickets = await db.query(
        'tickets',
        where: 'ticketDownloadStatus = ?',
        whereArgs: ['2'],
      );
    } else {
      tickets = await db.query(
        'tickets',
        orderBy: '${orderBy!.value} ${orderBy.order}',
      );
    }
    return List.generate(
        tickets.length,
        (index) => Ticket(
            id: tickets[index]['id'],
            url: tickets[index]['url'],
            path: tickets[index]['path'],
            title: tickets[index]['title'],
            downloadDate: tickets[index]['downloadDate'],
            ticketDownloadStatus: tickets[index]['ticketDownloadStatus']));
  }

  // Метод для добавления нового билета в базу данных.
  @override
  Future<void> addNewTicket(Ticket ticket) async {
    final db = await database;
    await db.insert('tickets', ticket.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Метод для обновления пути сохраненного PDF-файла для билета.
  @override
  Future<void> addPathToDownloadedTicketPdf(Ticket ticket) async {
    final db = await database;
    await db.update('tickets', ticket.toJson(),
        where: 'id = ?', whereArgs: [ticket.id]);
  }

  @override
  Future<int> deleteTicket(Ticket ticket) async {
    final db = await database;
    return await db.delete('tickets', where: 'id = ?', whereArgs: [ticket.id]);
  }

  @override
  Future<File> getTicketFromDatabase() {
    // TODO: implement getTicketFromDatabase
    throw UnimplementedError();
  }
}
