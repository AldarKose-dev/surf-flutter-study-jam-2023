import 'package:freezed_annotation/freezed_annotation.dart';

part 'ordering.freezed.dart';

@freezed
abstract class Ordering with _$Ordering {
  const Ordering._();
  const factory Ordering.dateDownloadedAsc() = DateDownloadedAsc;
  const factory Ordering.dateDownloadedDsc() = DateDownloadedDsc;
  const factory Ordering.onlyDownloaded() = OnlyDownloaded;
  const factory Ordering.onlyNotDownloaded() = OnlyNotDownloaded;

  String get value {
    return when(
      dateDownloadedAsc: () => 'downloadDate',
      dateDownloadedDsc: () => "downloadDate",
      onlyDownloaded: () => 'onlyDownloaded',
      onlyNotDownloaded: () => 'onlyNotDownloaded',
    );
  }

  String get order {
    return when(
      dateDownloadedAsc: () => 'ASC',
      dateDownloadedDsc: () => "DESC",
      onlyDownloaded: () => '',
      onlyNotDownloaded: () => '',
    );
  }
}
