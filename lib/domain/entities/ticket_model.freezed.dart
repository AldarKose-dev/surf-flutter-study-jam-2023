// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
mixin _$Ticket {
  String? get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  int? get downloadDate => throw _privateConstructorUsedError;
  double get downloadProgress => throw _privateConstructorUsedError;
  int get ticketDownloadStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res, Ticket>;
  @useResult
  $Res call(
      {String? title,
      String url,
      String? path,
      int? id,
      int? downloadDate,
      double downloadProgress,
      int ticketDownloadStatus});
}

/// @nodoc
class _$TicketCopyWithImpl<$Res, $Val extends Ticket>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? url = null,
    Object? path = freezed,
    Object? id = freezed,
    Object? downloadDate = freezed,
    Object? downloadProgress = null,
    Object? ticketDownloadStatus = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      downloadDate: freezed == downloadDate
          ? _value.downloadDate
          : downloadDate // ignore: cast_nullable_to_non_nullable
              as int?,
      downloadProgress: null == downloadProgress
          ? _value.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double,
      ticketDownloadStatus: null == ticketDownloadStatus
          ? _value.ticketDownloadStatus
          : ticketDownloadStatus // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TicketCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$_TicketCopyWith(_$_Ticket value, $Res Function(_$_Ticket) then) =
      __$$_TicketCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String url,
      String? path,
      int? id,
      int? downloadDate,
      double downloadProgress,
      int ticketDownloadStatus});
}

/// @nodoc
class __$$_TicketCopyWithImpl<$Res>
    extends _$TicketCopyWithImpl<$Res, _$_Ticket>
    implements _$$_TicketCopyWith<$Res> {
  __$$_TicketCopyWithImpl(_$_Ticket _value, $Res Function(_$_Ticket) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? url = null,
    Object? path = freezed,
    Object? id = freezed,
    Object? downloadDate = freezed,
    Object? downloadProgress = null,
    Object? ticketDownloadStatus = null,
  }) {
    return _then(_$_Ticket(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      downloadDate: freezed == downloadDate
          ? _value.downloadDate
          : downloadDate // ignore: cast_nullable_to_non_nullable
              as int?,
      downloadProgress: null == downloadProgress
          ? _value.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double,
      ticketDownloadStatus: null == ticketDownloadStatus
          ? _value.ticketDownloadStatus
          : ticketDownloadStatus // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ticket implements _Ticket {
  const _$_Ticket(
      {this.title,
      required this.url,
      this.path,
      this.id,
      this.downloadDate,
      this.downloadProgress = 0.0,
      this.ticketDownloadStatus = 0});

  factory _$_Ticket.fromJson(Map<String, dynamic> json) =>
      _$$_TicketFromJson(json);

  @override
  final String? title;
  @override
  final String url;
  @override
  final String? path;
  @override
  final int? id;
  @override
  final int? downloadDate;
  @override
  @JsonKey()
  final double downloadProgress;
  @override
  @JsonKey()
  final int ticketDownloadStatus;

  @override
  String toString() {
    return 'Ticket(title: $title, url: $url, path: $path, id: $id, downloadDate: $downloadDate, downloadProgress: $downloadProgress, ticketDownloadStatus: $ticketDownloadStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ticket &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.downloadDate, downloadDate) ||
                other.downloadDate == downloadDate) &&
            (identical(other.downloadProgress, downloadProgress) ||
                other.downloadProgress == downloadProgress) &&
            (identical(other.ticketDownloadStatus, ticketDownloadStatus) ||
                other.ticketDownloadStatus == ticketDownloadStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, url, path, id,
      downloadDate, downloadProgress, ticketDownloadStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketCopyWith<_$_Ticket> get copyWith =>
      __$$_TicketCopyWithImpl<_$_Ticket>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketToJson(
      this,
    );
  }
}

abstract class _Ticket implements Ticket {
  const factory _Ticket(
      {final String? title,
      required final String url,
      final String? path,
      final int? id,
      final int? downloadDate,
      final double downloadProgress,
      final int ticketDownloadStatus}) = _$_Ticket;

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$_Ticket.fromJson;

  @override
  String? get title;
  @override
  String get url;
  @override
  String? get path;
  @override
  int? get id;
  @override
  int? get downloadDate;
  @override
  double get downloadProgress;
  @override
  int get ticketDownloadStatus;
  @override
  @JsonKey(ignore: true)
  _$$_TicketCopyWith<_$_Ticket> get copyWith =>
      throw _privateConstructorUsedError;
}
