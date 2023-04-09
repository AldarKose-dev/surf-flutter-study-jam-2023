// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_storage_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TicketStorageState {
  String? get urlOfPdf =>
      throw _privateConstructorUsedError; // ссылка введенная при добавлении пдф
  List<Ticket>? get listOfTickets =>
      throw _privateConstructorUsedError; // список билетов с БД
  File? get selectedTicketFile =>
      throw _privateConstructorUsedError; // выбранный пдф файл который нужно открыть
  Ordering get ordering => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketStorageStateCopyWith<TicketStorageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketStorageStateCopyWith<$Res> {
  factory $TicketStorageStateCopyWith(
          TicketStorageState value, $Res Function(TicketStorageState) then) =
      _$TicketStorageStateCopyWithImpl<$Res, TicketStorageState>;
  @useResult
  $Res call(
      {String? urlOfPdf,
      List<Ticket>? listOfTickets,
      File? selectedTicketFile,
      Ordering ordering});

  $OrderingCopyWith<$Res> get ordering;
}

/// @nodoc
class _$TicketStorageStateCopyWithImpl<$Res, $Val extends TicketStorageState>
    implements $TicketStorageStateCopyWith<$Res> {
  _$TicketStorageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urlOfPdf = freezed,
    Object? listOfTickets = freezed,
    Object? selectedTicketFile = freezed,
    Object? ordering = null,
  }) {
    return _then(_value.copyWith(
      urlOfPdf: freezed == urlOfPdf
          ? _value.urlOfPdf
          : urlOfPdf // ignore: cast_nullable_to_non_nullable
              as String?,
      listOfTickets: freezed == listOfTickets
          ? _value.listOfTickets
          : listOfTickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket>?,
      selectedTicketFile: freezed == selectedTicketFile
          ? _value.selectedTicketFile
          : selectedTicketFile // ignore: cast_nullable_to_non_nullable
              as File?,
      ordering: null == ordering
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as Ordering,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderingCopyWith<$Res> get ordering {
    return $OrderingCopyWith<$Res>(_value.ordering, (value) {
      return _then(_value.copyWith(ordering: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TicketStorageStateCopyWith<$Res>
    implements $TicketStorageStateCopyWith<$Res> {
  factory _$$_TicketStorageStateCopyWith(_$_TicketStorageState value,
          $Res Function(_$_TicketStorageState) then) =
      __$$_TicketStorageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? urlOfPdf,
      List<Ticket>? listOfTickets,
      File? selectedTicketFile,
      Ordering ordering});

  @override
  $OrderingCopyWith<$Res> get ordering;
}

/// @nodoc
class __$$_TicketStorageStateCopyWithImpl<$Res>
    extends _$TicketStorageStateCopyWithImpl<$Res, _$_TicketStorageState>
    implements _$$_TicketStorageStateCopyWith<$Res> {
  __$$_TicketStorageStateCopyWithImpl(
      _$_TicketStorageState _value, $Res Function(_$_TicketStorageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urlOfPdf = freezed,
    Object? listOfTickets = freezed,
    Object? selectedTicketFile = freezed,
    Object? ordering = null,
  }) {
    return _then(_$_TicketStorageState(
      urlOfPdf: freezed == urlOfPdf
          ? _value.urlOfPdf
          : urlOfPdf // ignore: cast_nullable_to_non_nullable
              as String?,
      listOfTickets: freezed == listOfTickets
          ? _value._listOfTickets
          : listOfTickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket>?,
      selectedTicketFile: freezed == selectedTicketFile
          ? _value.selectedTicketFile
          : selectedTicketFile // ignore: cast_nullable_to_non_nullable
              as File?,
      ordering: null == ordering
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as Ordering,
    ));
  }
}

/// @nodoc

class _$_TicketStorageState implements _TicketStorageState {
  const _$_TicketStorageState(
      {this.urlOfPdf,
      final List<Ticket>? listOfTickets,
      this.selectedTicketFile,
      this.ordering = const Ordering.dateDownloadedAsc()})
      : _listOfTickets = listOfTickets;

  @override
  final String? urlOfPdf;
// ссылка введенная при добавлении пдф
  final List<Ticket>? _listOfTickets;
// ссылка введенная при добавлении пдф
  @override
  List<Ticket>? get listOfTickets {
    final value = _listOfTickets;
    if (value == null) return null;
    if (_listOfTickets is EqualUnmodifiableListView) return _listOfTickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// список билетов с БД
  @override
  final File? selectedTicketFile;
// выбранный пдф файл который нужно открыть
  @override
  @JsonKey()
  final Ordering ordering;

  @override
  String toString() {
    return 'TicketStorageState(urlOfPdf: $urlOfPdf, listOfTickets: $listOfTickets, selectedTicketFile: $selectedTicketFile, ordering: $ordering)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TicketStorageState &&
            (identical(other.urlOfPdf, urlOfPdf) ||
                other.urlOfPdf == urlOfPdf) &&
            const DeepCollectionEquality()
                .equals(other._listOfTickets, _listOfTickets) &&
            (identical(other.selectedTicketFile, selectedTicketFile) ||
                other.selectedTicketFile == selectedTicketFile) &&
            (identical(other.ordering, ordering) ||
                other.ordering == ordering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      urlOfPdf,
      const DeepCollectionEquality().hash(_listOfTickets),
      selectedTicketFile,
      ordering);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketStorageStateCopyWith<_$_TicketStorageState> get copyWith =>
      __$$_TicketStorageStateCopyWithImpl<_$_TicketStorageState>(
          this, _$identity);
}

abstract class _TicketStorageState implements TicketStorageState {
  const factory _TicketStorageState(
      {final String? urlOfPdf,
      final List<Ticket>? listOfTickets,
      final File? selectedTicketFile,
      final Ordering ordering}) = _$_TicketStorageState;

  @override
  String? get urlOfPdf;
  @override // ссылка введенная при добавлении пдф
  List<Ticket>? get listOfTickets;
  @override // список билетов с БД
  File? get selectedTicketFile;
  @override // выбранный пдф файл который нужно открыть
  Ordering get ordering;
  @override
  @JsonKey(ignore: true)
  _$$_TicketStorageStateCopyWith<_$_TicketStorageState> get copyWith =>
      throw _privateConstructorUsedError;
}
