// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ticket _$$_TicketFromJson(Map<String, dynamic> json) => _$_Ticket(
      title: json['title'] as String?,
      url: json['url'] as String,
      path: json['path'] as String?,
      id: json['id'] as int?,
      downloadDate: json['downloadDate'] as int?,
      downloadProgress: (json['downloadProgress'] as num?)?.toDouble() ?? 0.0,
      ticketDownloadStatus: json['ticketDownloadStatus'] as int? ?? 0,
    );

Map<String, dynamic> _$$_TicketToJson(_$_Ticket instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'path': instance.path,
      'id': instance.id,
      'downloadDate': instance.downloadDate,
      'downloadProgress': instance.downloadProgress,
      'ticketDownloadStatus': instance.ticketDownloadStatus,
    };
