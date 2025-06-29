// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sido_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SidoResponse _$SidoResponseFromJson(Map<String, dynamic> json) {
  return _SidoResponse.fromJson(json);
}

/// @nodoc
mixin _$SidoResponse {
  SidoHeader get header => throw _privateConstructorUsedError;
  SidoBody get body => throw _privateConstructorUsedError;

  /// Serializes this SidoResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SidoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SidoResponseCopyWith<SidoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SidoResponseCopyWith<$Res> {
  factory $SidoResponseCopyWith(
    SidoResponse value,
    $Res Function(SidoResponse) then,
  ) = _$SidoResponseCopyWithImpl<$Res, SidoResponse>;
  @useResult
  $Res call({SidoHeader header, SidoBody body});

  $SidoHeaderCopyWith<$Res> get header;
  $SidoBodyCopyWith<$Res> get body;
}

/// @nodoc
class _$SidoResponseCopyWithImpl<$Res, $Val extends SidoResponse>
    implements $SidoResponseCopyWith<$Res> {
  _$SidoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SidoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? header = null, Object? body = null}) {
    return _then(
      _value.copyWith(
            header: null == header
                ? _value.header
                : header // ignore: cast_nullable_to_non_nullable
                      as SidoHeader,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as SidoBody,
          )
          as $Val,
    );
  }

  /// Create a copy of SidoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SidoHeaderCopyWith<$Res> get header {
    return $SidoHeaderCopyWith<$Res>(_value.header, (value) {
      return _then(_value.copyWith(header: value) as $Val);
    });
  }

  /// Create a copy of SidoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SidoBodyCopyWith<$Res> get body {
    return $SidoBodyCopyWith<$Res>(_value.body, (value) {
      return _then(_value.copyWith(body: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SidoResponseImplCopyWith<$Res>
    implements $SidoResponseCopyWith<$Res> {
  factory _$$SidoResponseImplCopyWith(
    _$SidoResponseImpl value,
    $Res Function(_$SidoResponseImpl) then,
  ) = __$$SidoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SidoHeader header, SidoBody body});

  @override
  $SidoHeaderCopyWith<$Res> get header;
  @override
  $SidoBodyCopyWith<$Res> get body;
}

/// @nodoc
class __$$SidoResponseImplCopyWithImpl<$Res>
    extends _$SidoResponseCopyWithImpl<$Res, _$SidoResponseImpl>
    implements _$$SidoResponseImplCopyWith<$Res> {
  __$$SidoResponseImplCopyWithImpl(
    _$SidoResponseImpl _value,
    $Res Function(_$SidoResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SidoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? header = null, Object? body = null}) {
    return _then(
      _$SidoResponseImpl(
        header: null == header
            ? _value.header
            : header // ignore: cast_nullable_to_non_nullable
                  as SidoHeader,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as SidoBody,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SidoResponseImpl implements _SidoResponse {
  const _$SidoResponseImpl({required this.header, required this.body});

  factory _$SidoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SidoResponseImplFromJson(json);

  @override
  final SidoHeader header;
  @override
  final SidoBody body;

  @override
  String toString() {
    return 'SidoResponse(header: $header, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SidoResponseImpl &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, header, body);

  /// Create a copy of SidoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SidoResponseImplCopyWith<_$SidoResponseImpl> get copyWith =>
      __$$SidoResponseImplCopyWithImpl<_$SidoResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SidoResponseImplToJson(this);
  }
}

abstract class _SidoResponse implements SidoResponse {
  const factory _SidoResponse({
    required final SidoHeader header,
    required final SidoBody body,
  }) = _$SidoResponseImpl;

  factory _SidoResponse.fromJson(Map<String, dynamic> json) =
      _$SidoResponseImpl.fromJson;

  @override
  SidoHeader get header;
  @override
  SidoBody get body;

  /// Create a copy of SidoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SidoResponseImplCopyWith<_$SidoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SidoHeader _$SidoHeaderFromJson(Map<String, dynamic> json) {
  return _SidoHeader.fromJson(json);
}

/// @nodoc
mixin _$SidoHeader {
  String? get reqNo => throw _privateConstructorUsedError;
  String? get resultCode => throw _privateConstructorUsedError;
  String? get resultMsg => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

  /// Serializes this SidoHeader to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SidoHeader
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SidoHeaderCopyWith<SidoHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SidoHeaderCopyWith<$Res> {
  factory $SidoHeaderCopyWith(
    SidoHeader value,
    $Res Function(SidoHeader) then,
  ) = _$SidoHeaderCopyWithImpl<$Res, SidoHeader>;
  @useResult
  $Res call({
    String? reqNo,
    String? resultCode,
    String? resultMsg,
    String? errorMsg,
  });
}

/// @nodoc
class _$SidoHeaderCopyWithImpl<$Res, $Val extends SidoHeader>
    implements $SidoHeaderCopyWith<$Res> {
  _$SidoHeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SidoHeader
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reqNo = freezed,
    Object? resultCode = freezed,
    Object? resultMsg = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(
      _value.copyWith(
            reqNo: freezed == reqNo
                ? _value.reqNo
                : reqNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            resultCode: freezed == resultCode
                ? _value.resultCode
                : resultCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            resultMsg: freezed == resultMsg
                ? _value.resultMsg
                : resultMsg // ignore: cast_nullable_to_non_nullable
                      as String?,
            errorMsg: freezed == errorMsg
                ? _value.errorMsg
                : errorMsg // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SidoHeaderImplCopyWith<$Res>
    implements $SidoHeaderCopyWith<$Res> {
  factory _$$SidoHeaderImplCopyWith(
    _$SidoHeaderImpl value,
    $Res Function(_$SidoHeaderImpl) then,
  ) = __$$SidoHeaderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? reqNo,
    String? resultCode,
    String? resultMsg,
    String? errorMsg,
  });
}

/// @nodoc
class __$$SidoHeaderImplCopyWithImpl<$Res>
    extends _$SidoHeaderCopyWithImpl<$Res, _$SidoHeaderImpl>
    implements _$$SidoHeaderImplCopyWith<$Res> {
  __$$SidoHeaderImplCopyWithImpl(
    _$SidoHeaderImpl _value,
    $Res Function(_$SidoHeaderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SidoHeader
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reqNo = freezed,
    Object? resultCode = freezed,
    Object? resultMsg = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(
      _$SidoHeaderImpl(
        reqNo: freezed == reqNo
            ? _value.reqNo
            : reqNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        resultCode: freezed == resultCode
            ? _value.resultCode
            : resultCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        resultMsg: freezed == resultMsg
            ? _value.resultMsg
            : resultMsg // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorMsg: freezed == errorMsg
            ? _value.errorMsg
            : errorMsg // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SidoHeaderImpl implements _SidoHeader {
  const _$SidoHeaderImpl({
    this.reqNo,
    this.resultCode,
    this.resultMsg,
    this.errorMsg,
  });

  factory _$SidoHeaderImpl.fromJson(Map<String, dynamic> json) =>
      _$$SidoHeaderImplFromJson(json);

  @override
  final String? reqNo;
  @override
  final String? resultCode;
  @override
  final String? resultMsg;
  @override
  final String? errorMsg;

  @override
  String toString() {
    return 'SidoHeader(reqNo: $reqNo, resultCode: $resultCode, resultMsg: $resultMsg, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SidoHeaderImpl &&
            (identical(other.reqNo, reqNo) || other.reqNo == reqNo) &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            (identical(other.resultMsg, resultMsg) ||
                other.resultMsg == resultMsg) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reqNo, resultCode, resultMsg, errorMsg);

  /// Create a copy of SidoHeader
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SidoHeaderImplCopyWith<_$SidoHeaderImpl> get copyWith =>
      __$$SidoHeaderImplCopyWithImpl<_$SidoHeaderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SidoHeaderImplToJson(this);
  }
}

abstract class _SidoHeader implements SidoHeader {
  const factory _SidoHeader({
    final String? reqNo,
    final String? resultCode,
    final String? resultMsg,
    final String? errorMsg,
  }) = _$SidoHeaderImpl;

  factory _SidoHeader.fromJson(Map<String, dynamic> json) =
      _$SidoHeaderImpl.fromJson;

  @override
  String? get reqNo;
  @override
  String? get resultCode;
  @override
  String? get resultMsg;
  @override
  String? get errorMsg;

  /// Create a copy of SidoHeader
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SidoHeaderImplCopyWith<_$SidoHeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SidoBody _$SidoBodyFromJson(Map<String, dynamic> json) {
  return _SidoBody.fromJson(json);
}

/// @nodoc
mixin _$SidoBody {
  SidoItems? get items => throw _privateConstructorUsedError;
  String? get numOfRows => throw _privateConstructorUsedError;
  String? get pageNo => throw _privateConstructorUsedError;
  String? get totalCount => throw _privateConstructorUsedError;

  /// Serializes this SidoBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SidoBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SidoBodyCopyWith<SidoBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SidoBodyCopyWith<$Res> {
  factory $SidoBodyCopyWith(SidoBody value, $Res Function(SidoBody) then) =
      _$SidoBodyCopyWithImpl<$Res, SidoBody>;
  @useResult
  $Res call({
    SidoItems? items,
    String? numOfRows,
    String? pageNo,
    String? totalCount,
  });

  $SidoItemsCopyWith<$Res>? get items;
}

/// @nodoc
class _$SidoBodyCopyWithImpl<$Res, $Val extends SidoBody>
    implements $SidoBodyCopyWith<$Res> {
  _$SidoBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SidoBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? numOfRows = freezed,
    Object? pageNo = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(
      _value.copyWith(
            items: freezed == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as SidoItems?,
            numOfRows: freezed == numOfRows
                ? _value.numOfRows
                : numOfRows // ignore: cast_nullable_to_non_nullable
                      as String?,
            pageNo: freezed == pageNo
                ? _value.pageNo
                : pageNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalCount: freezed == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of SidoBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SidoItemsCopyWith<$Res>? get items {
    if (_value.items == null) {
      return null;
    }

    return $SidoItemsCopyWith<$Res>(_value.items!, (value) {
      return _then(_value.copyWith(items: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SidoBodyImplCopyWith<$Res>
    implements $SidoBodyCopyWith<$Res> {
  factory _$$SidoBodyImplCopyWith(
    _$SidoBodyImpl value,
    $Res Function(_$SidoBodyImpl) then,
  ) = __$$SidoBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    SidoItems? items,
    String? numOfRows,
    String? pageNo,
    String? totalCount,
  });

  @override
  $SidoItemsCopyWith<$Res>? get items;
}

/// @nodoc
class __$$SidoBodyImplCopyWithImpl<$Res>
    extends _$SidoBodyCopyWithImpl<$Res, _$SidoBodyImpl>
    implements _$$SidoBodyImplCopyWith<$Res> {
  __$$SidoBodyImplCopyWithImpl(
    _$SidoBodyImpl _value,
    $Res Function(_$SidoBodyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SidoBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? numOfRows = freezed,
    Object? pageNo = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(
      _$SidoBodyImpl(
        items: freezed == items
            ? _value.items
            : items // ignore: cast_nullable_to_non_nullable
                  as SidoItems?,
        numOfRows: freezed == numOfRows
            ? _value.numOfRows
            : numOfRows // ignore: cast_nullable_to_non_nullable
                  as String?,
        pageNo: freezed == pageNo
            ? _value.pageNo
            : pageNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalCount: freezed == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SidoBodyImpl implements _SidoBody {
  const _$SidoBodyImpl({
    this.items,
    this.numOfRows,
    this.pageNo,
    this.totalCount,
  });

  factory _$SidoBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SidoBodyImplFromJson(json);

  @override
  final SidoItems? items;
  @override
  final String? numOfRows;
  @override
  final String? pageNo;
  @override
  final String? totalCount;

  @override
  String toString() {
    return 'SidoBody(items: $items, numOfRows: $numOfRows, pageNo: $pageNo, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SidoBodyImpl &&
            (identical(other.items, items) || other.items == items) &&
            (identical(other.numOfRows, numOfRows) ||
                other.numOfRows == numOfRows) &&
            (identical(other.pageNo, pageNo) || other.pageNo == pageNo) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, items, numOfRows, pageNo, totalCount);

  /// Create a copy of SidoBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SidoBodyImplCopyWith<_$SidoBodyImpl> get copyWith =>
      __$$SidoBodyImplCopyWithImpl<_$SidoBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SidoBodyImplToJson(this);
  }
}

abstract class _SidoBody implements SidoBody {
  const factory _SidoBody({
    final SidoItems? items,
    final String? numOfRows,
    final String? pageNo,
    final String? totalCount,
  }) = _$SidoBodyImpl;

  factory _SidoBody.fromJson(Map<String, dynamic> json) =
      _$SidoBodyImpl.fromJson;

  @override
  SidoItems? get items;
  @override
  String? get numOfRows;
  @override
  String? get pageNo;
  @override
  String? get totalCount;

  /// Create a copy of SidoBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SidoBodyImplCopyWith<_$SidoBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SidoItems _$SidoItemsFromJson(Map<String, dynamic> json) {
  return _SidoItems.fromJson(json);
}

/// @nodoc
mixin _$SidoItems {
  @JsonKey(name: 'item')
  List<SidoItem>? get item => throw _privateConstructorUsedError;

  /// Serializes this SidoItems to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SidoItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SidoItemsCopyWith<SidoItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SidoItemsCopyWith<$Res> {
  factory $SidoItemsCopyWith(SidoItems value, $Res Function(SidoItems) then) =
      _$SidoItemsCopyWithImpl<$Res, SidoItems>;
  @useResult
  $Res call({@JsonKey(name: 'item') List<SidoItem>? item});
}

/// @nodoc
class _$SidoItemsCopyWithImpl<$Res, $Val extends SidoItems>
    implements $SidoItemsCopyWith<$Res> {
  _$SidoItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SidoItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = freezed}) {
    return _then(
      _value.copyWith(
            item: freezed == item
                ? _value.item
                : item // ignore: cast_nullable_to_non_nullable
                      as List<SidoItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SidoItemsImplCopyWith<$Res>
    implements $SidoItemsCopyWith<$Res> {
  factory _$$SidoItemsImplCopyWith(
    _$SidoItemsImpl value,
    $Res Function(_$SidoItemsImpl) then,
  ) = __$$SidoItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'item') List<SidoItem>? item});
}

/// @nodoc
class __$$SidoItemsImplCopyWithImpl<$Res>
    extends _$SidoItemsCopyWithImpl<$Res, _$SidoItemsImpl>
    implements _$$SidoItemsImplCopyWith<$Res> {
  __$$SidoItemsImplCopyWithImpl(
    _$SidoItemsImpl _value,
    $Res Function(_$SidoItemsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SidoItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = freezed}) {
    return _then(
      _$SidoItemsImpl(
        item: freezed == item
            ? _value._item
            : item // ignore: cast_nullable_to_non_nullable
                  as List<SidoItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SidoItemsImpl implements _SidoItems {
  const _$SidoItemsImpl({@JsonKey(name: 'item') final List<SidoItem>? item})
    : _item = item;

  factory _$SidoItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SidoItemsImplFromJson(json);

  final List<SidoItem>? _item;
  @override
  @JsonKey(name: 'item')
  List<SidoItem>? get item {
    final value = _item;
    if (value == null) return null;
    if (_item is EqualUnmodifiableListView) return _item;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SidoItems(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SidoItemsImpl &&
            const DeepCollectionEquality().equals(other._item, _item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_item));

  /// Create a copy of SidoItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SidoItemsImplCopyWith<_$SidoItemsImpl> get copyWith =>
      __$$SidoItemsImplCopyWithImpl<_$SidoItemsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SidoItemsImplToJson(this);
  }
}

abstract class _SidoItems implements SidoItems {
  const factory _SidoItems({
    @JsonKey(name: 'item') final List<SidoItem>? item,
  }) = _$SidoItemsImpl;

  factory _SidoItems.fromJson(Map<String, dynamic> json) =
      _$SidoItemsImpl.fromJson;

  @override
  @JsonKey(name: 'item')
  List<SidoItem>? get item;

  /// Create a copy of SidoItems
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SidoItemsImplCopyWith<_$SidoItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SidoItem _$SidoItemFromJson(Map<String, dynamic> json) {
  return _SidoItem.fromJson(json);
}

/// @nodoc
mixin _$SidoItem {
  String? get orgCd => throw _privateConstructorUsedError;
  String? get orgdownNm => throw _privateConstructorUsedError;

  /// Serializes this SidoItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SidoItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SidoItemCopyWith<SidoItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SidoItemCopyWith<$Res> {
  factory $SidoItemCopyWith(SidoItem value, $Res Function(SidoItem) then) =
      _$SidoItemCopyWithImpl<$Res, SidoItem>;
  @useResult
  $Res call({String? orgCd, String? orgdownNm});
}

/// @nodoc
class _$SidoItemCopyWithImpl<$Res, $Val extends SidoItem>
    implements $SidoItemCopyWith<$Res> {
  _$SidoItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SidoItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orgCd = freezed, Object? orgdownNm = freezed}) {
    return _then(
      _value.copyWith(
            orgCd: freezed == orgCd
                ? _value.orgCd
                : orgCd // ignore: cast_nullable_to_non_nullable
                      as String?,
            orgdownNm: freezed == orgdownNm
                ? _value.orgdownNm
                : orgdownNm // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SidoItemImplCopyWith<$Res>
    implements $SidoItemCopyWith<$Res> {
  factory _$$SidoItemImplCopyWith(
    _$SidoItemImpl value,
    $Res Function(_$SidoItemImpl) then,
  ) = __$$SidoItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? orgCd, String? orgdownNm});
}

/// @nodoc
class __$$SidoItemImplCopyWithImpl<$Res>
    extends _$SidoItemCopyWithImpl<$Res, _$SidoItemImpl>
    implements _$$SidoItemImplCopyWith<$Res> {
  __$$SidoItemImplCopyWithImpl(
    _$SidoItemImpl _value,
    $Res Function(_$SidoItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SidoItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orgCd = freezed, Object? orgdownNm = freezed}) {
    return _then(
      _$SidoItemImpl(
        orgCd: freezed == orgCd
            ? _value.orgCd
            : orgCd // ignore: cast_nullable_to_non_nullable
                  as String?,
        orgdownNm: freezed == orgdownNm
            ? _value.orgdownNm
            : orgdownNm // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SidoItemImpl implements _SidoItem {
  const _$SidoItemImpl({this.orgCd, this.orgdownNm});

  factory _$SidoItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SidoItemImplFromJson(json);

  @override
  final String? orgCd;
  @override
  final String? orgdownNm;

  @override
  String toString() {
    return 'SidoItem(orgCd: $orgCd, orgdownNm: $orgdownNm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SidoItemImpl &&
            (identical(other.orgCd, orgCd) || other.orgCd == orgCd) &&
            (identical(other.orgdownNm, orgdownNm) ||
                other.orgdownNm == orgdownNm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orgCd, orgdownNm);

  /// Create a copy of SidoItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SidoItemImplCopyWith<_$SidoItemImpl> get copyWith =>
      __$$SidoItemImplCopyWithImpl<_$SidoItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SidoItemImplToJson(this);
  }
}

abstract class _SidoItem implements SidoItem {
  const factory _SidoItem({final String? orgCd, final String? orgdownNm}) =
      _$SidoItemImpl;

  factory _SidoItem.fromJson(Map<String, dynamic> json) =
      _$SidoItemImpl.fromJson;

  @override
  String? get orgCd;
  @override
  String? get orgdownNm;

  /// Create a copy of SidoItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SidoItemImplCopyWith<_$SidoItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
