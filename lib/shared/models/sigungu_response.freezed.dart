// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sigungu_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SigunguResponse _$SigunguResponseFromJson(Map<String, dynamic> json) {
  return _SigunguResponse.fromJson(json);
}

/// @nodoc
mixin _$SigunguResponse {
  SigunguHeader get header => throw _privateConstructorUsedError;
  SigunguBody get body => throw _privateConstructorUsedError;

  /// Serializes this SigunguResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SigunguResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SigunguResponseCopyWith<SigunguResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SigunguResponseCopyWith<$Res> {
  factory $SigunguResponseCopyWith(
    SigunguResponse value,
    $Res Function(SigunguResponse) then,
  ) = _$SigunguResponseCopyWithImpl<$Res, SigunguResponse>;
  @useResult
  $Res call({SigunguHeader header, SigunguBody body});

  $SigunguHeaderCopyWith<$Res> get header;
  $SigunguBodyCopyWith<$Res> get body;
}

/// @nodoc
class _$SigunguResponseCopyWithImpl<$Res, $Val extends SigunguResponse>
    implements $SigunguResponseCopyWith<$Res> {
  _$SigunguResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SigunguResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? header = null, Object? body = null}) {
    return _then(
      _value.copyWith(
            header: null == header
                ? _value.header
                : header // ignore: cast_nullable_to_non_nullable
                      as SigunguHeader,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as SigunguBody,
          )
          as $Val,
    );
  }

  /// Create a copy of SigunguResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SigunguHeaderCopyWith<$Res> get header {
    return $SigunguHeaderCopyWith<$Res>(_value.header, (value) {
      return _then(_value.copyWith(header: value) as $Val);
    });
  }

  /// Create a copy of SigunguResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SigunguBodyCopyWith<$Res> get body {
    return $SigunguBodyCopyWith<$Res>(_value.body, (value) {
      return _then(_value.copyWith(body: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SigunguResponseImplCopyWith<$Res>
    implements $SigunguResponseCopyWith<$Res> {
  factory _$$SigunguResponseImplCopyWith(
    _$SigunguResponseImpl value,
    $Res Function(_$SigunguResponseImpl) then,
  ) = __$$SigunguResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SigunguHeader header, SigunguBody body});

  @override
  $SigunguHeaderCopyWith<$Res> get header;
  @override
  $SigunguBodyCopyWith<$Res> get body;
}

/// @nodoc
class __$$SigunguResponseImplCopyWithImpl<$Res>
    extends _$SigunguResponseCopyWithImpl<$Res, _$SigunguResponseImpl>
    implements _$$SigunguResponseImplCopyWith<$Res> {
  __$$SigunguResponseImplCopyWithImpl(
    _$SigunguResponseImpl _value,
    $Res Function(_$SigunguResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SigunguResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? header = null, Object? body = null}) {
    return _then(
      _$SigunguResponseImpl(
        header: null == header
            ? _value.header
            : header // ignore: cast_nullable_to_non_nullable
                  as SigunguHeader,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as SigunguBody,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SigunguResponseImpl implements _SigunguResponse {
  const _$SigunguResponseImpl({required this.header, required this.body});

  factory _$SigunguResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SigunguResponseImplFromJson(json);

  @override
  final SigunguHeader header;
  @override
  final SigunguBody body;

  @override
  String toString() {
    return 'SigunguResponse(header: $header, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigunguResponseImpl &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, header, body);

  /// Create a copy of SigunguResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SigunguResponseImplCopyWith<_$SigunguResponseImpl> get copyWith =>
      __$$SigunguResponseImplCopyWithImpl<_$SigunguResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SigunguResponseImplToJson(this);
  }
}

abstract class _SigunguResponse implements SigunguResponse {
  const factory _SigunguResponse({
    required final SigunguHeader header,
    required final SigunguBody body,
  }) = _$SigunguResponseImpl;

  factory _SigunguResponse.fromJson(Map<String, dynamic> json) =
      _$SigunguResponseImpl.fromJson;

  @override
  SigunguHeader get header;
  @override
  SigunguBody get body;

  /// Create a copy of SigunguResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SigunguResponseImplCopyWith<_$SigunguResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SigunguHeader _$SigunguHeaderFromJson(Map<String, dynamic> json) {
  return _SigunguHeader.fromJson(json);
}

/// @nodoc
mixin _$SigunguHeader {
  String? get reqNo => throw _privateConstructorUsedError;
  String? get resultCode => throw _privateConstructorUsedError;
  String? get resultMsg => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

  /// Serializes this SigunguHeader to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SigunguHeader
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SigunguHeaderCopyWith<SigunguHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SigunguHeaderCopyWith<$Res> {
  factory $SigunguHeaderCopyWith(
    SigunguHeader value,
    $Res Function(SigunguHeader) then,
  ) = _$SigunguHeaderCopyWithImpl<$Res, SigunguHeader>;
  @useResult
  $Res call({
    String? reqNo,
    String? resultCode,
    String? resultMsg,
    String? errorMsg,
  });
}

/// @nodoc
class _$SigunguHeaderCopyWithImpl<$Res, $Val extends SigunguHeader>
    implements $SigunguHeaderCopyWith<$Res> {
  _$SigunguHeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SigunguHeader
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
abstract class _$$SigunguHeaderImplCopyWith<$Res>
    implements $SigunguHeaderCopyWith<$Res> {
  factory _$$SigunguHeaderImplCopyWith(
    _$SigunguHeaderImpl value,
    $Res Function(_$SigunguHeaderImpl) then,
  ) = __$$SigunguHeaderImplCopyWithImpl<$Res>;
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
class __$$SigunguHeaderImplCopyWithImpl<$Res>
    extends _$SigunguHeaderCopyWithImpl<$Res, _$SigunguHeaderImpl>
    implements _$$SigunguHeaderImplCopyWith<$Res> {
  __$$SigunguHeaderImplCopyWithImpl(
    _$SigunguHeaderImpl _value,
    $Res Function(_$SigunguHeaderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SigunguHeader
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
      _$SigunguHeaderImpl(
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
class _$SigunguHeaderImpl implements _SigunguHeader {
  const _$SigunguHeaderImpl({
    this.reqNo,
    this.resultCode,
    this.resultMsg,
    this.errorMsg,
  });

  factory _$SigunguHeaderImpl.fromJson(Map<String, dynamic> json) =>
      _$$SigunguHeaderImplFromJson(json);

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
    return 'SigunguHeader(reqNo: $reqNo, resultCode: $resultCode, resultMsg: $resultMsg, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigunguHeaderImpl &&
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

  /// Create a copy of SigunguHeader
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SigunguHeaderImplCopyWith<_$SigunguHeaderImpl> get copyWith =>
      __$$SigunguHeaderImplCopyWithImpl<_$SigunguHeaderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SigunguHeaderImplToJson(this);
  }
}

abstract class _SigunguHeader implements SigunguHeader {
  const factory _SigunguHeader({
    final String? reqNo,
    final String? resultCode,
    final String? resultMsg,
    final String? errorMsg,
  }) = _$SigunguHeaderImpl;

  factory _SigunguHeader.fromJson(Map<String, dynamic> json) =
      _$SigunguHeaderImpl.fromJson;

  @override
  String? get reqNo;
  @override
  String? get resultCode;
  @override
  String? get resultMsg;
  @override
  String? get errorMsg;

  /// Create a copy of SigunguHeader
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SigunguHeaderImplCopyWith<_$SigunguHeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SigunguBody _$SigunguBodyFromJson(Map<String, dynamic> json) {
  return _SigunguBody.fromJson(json);
}

/// @nodoc
mixin _$SigunguBody {
  String? get pageNo => throw _privateConstructorUsedError;
  SigunguItems? get items => throw _privateConstructorUsedError;
  String? get totalCount => throw _privateConstructorUsedError;
  String? get numOfRows => throw _privateConstructorUsedError;

  /// Serializes this SigunguBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SigunguBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SigunguBodyCopyWith<SigunguBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SigunguBodyCopyWith<$Res> {
  factory $SigunguBodyCopyWith(
    SigunguBody value,
    $Res Function(SigunguBody) then,
  ) = _$SigunguBodyCopyWithImpl<$Res, SigunguBody>;
  @useResult
  $Res call({
    String? pageNo,
    SigunguItems? items,
    String? totalCount,
    String? numOfRows,
  });

  $SigunguItemsCopyWith<$Res>? get items;
}

/// @nodoc
class _$SigunguBodyCopyWithImpl<$Res, $Val extends SigunguBody>
    implements $SigunguBodyCopyWith<$Res> {
  _$SigunguBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SigunguBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNo = freezed,
    Object? items = freezed,
    Object? totalCount = freezed,
    Object? numOfRows = freezed,
  }) {
    return _then(
      _value.copyWith(
            pageNo: freezed == pageNo
                ? _value.pageNo
                : pageNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            items: freezed == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as SigunguItems?,
            totalCount: freezed == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as String?,
            numOfRows: freezed == numOfRows
                ? _value.numOfRows
                : numOfRows // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of SigunguBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SigunguItemsCopyWith<$Res>? get items {
    if (_value.items == null) {
      return null;
    }

    return $SigunguItemsCopyWith<$Res>(_value.items!, (value) {
      return _then(_value.copyWith(items: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SigunguBodyImplCopyWith<$Res>
    implements $SigunguBodyCopyWith<$Res> {
  factory _$$SigunguBodyImplCopyWith(
    _$SigunguBodyImpl value,
    $Res Function(_$SigunguBodyImpl) then,
  ) = __$$SigunguBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? pageNo,
    SigunguItems? items,
    String? totalCount,
    String? numOfRows,
  });

  @override
  $SigunguItemsCopyWith<$Res>? get items;
}

/// @nodoc
class __$$SigunguBodyImplCopyWithImpl<$Res>
    extends _$SigunguBodyCopyWithImpl<$Res, _$SigunguBodyImpl>
    implements _$$SigunguBodyImplCopyWith<$Res> {
  __$$SigunguBodyImplCopyWithImpl(
    _$SigunguBodyImpl _value,
    $Res Function(_$SigunguBodyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SigunguBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNo = freezed,
    Object? items = freezed,
    Object? totalCount = freezed,
    Object? numOfRows = freezed,
  }) {
    return _then(
      _$SigunguBodyImpl(
        pageNo: freezed == pageNo
            ? _value.pageNo
            : pageNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        items: freezed == items
            ? _value.items
            : items // ignore: cast_nullable_to_non_nullable
                  as SigunguItems?,
        totalCount: freezed == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as String?,
        numOfRows: freezed == numOfRows
            ? _value.numOfRows
            : numOfRows // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SigunguBodyImpl implements _SigunguBody {
  const _$SigunguBodyImpl({
    this.pageNo,
    this.items,
    this.totalCount,
    this.numOfRows,
  });

  factory _$SigunguBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SigunguBodyImplFromJson(json);

  @override
  final String? pageNo;
  @override
  final SigunguItems? items;
  @override
  final String? totalCount;
  @override
  final String? numOfRows;

  @override
  String toString() {
    return 'SigunguBody(pageNo: $pageNo, items: $items, totalCount: $totalCount, numOfRows: $numOfRows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigunguBodyImpl &&
            (identical(other.pageNo, pageNo) || other.pageNo == pageNo) &&
            (identical(other.items, items) || other.items == items) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.numOfRows, numOfRows) ||
                other.numOfRows == numOfRows));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pageNo, items, totalCount, numOfRows);

  /// Create a copy of SigunguBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SigunguBodyImplCopyWith<_$SigunguBodyImpl> get copyWith =>
      __$$SigunguBodyImplCopyWithImpl<_$SigunguBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SigunguBodyImplToJson(this);
  }
}

abstract class _SigunguBody implements SigunguBody {
  const factory _SigunguBody({
    final String? pageNo,
    final SigunguItems? items,
    final String? totalCount,
    final String? numOfRows,
  }) = _$SigunguBodyImpl;

  factory _SigunguBody.fromJson(Map<String, dynamic> json) =
      _$SigunguBodyImpl.fromJson;

  @override
  String? get pageNo;
  @override
  SigunguItems? get items;
  @override
  String? get totalCount;
  @override
  String? get numOfRows;

  /// Create a copy of SigunguBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SigunguBodyImplCopyWith<_$SigunguBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SigunguItems _$SigunguItemsFromJson(Map<String, dynamic> json) {
  return _SigunguItems.fromJson(json);
}

/// @nodoc
mixin _$SigunguItems {
  @JsonKey(name: 'item')
  List<SigunguItem>? get item => throw _privateConstructorUsedError;

  /// Serializes this SigunguItems to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SigunguItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SigunguItemsCopyWith<SigunguItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SigunguItemsCopyWith<$Res> {
  factory $SigunguItemsCopyWith(
    SigunguItems value,
    $Res Function(SigunguItems) then,
  ) = _$SigunguItemsCopyWithImpl<$Res, SigunguItems>;
  @useResult
  $Res call({@JsonKey(name: 'item') List<SigunguItem>? item});
}

/// @nodoc
class _$SigunguItemsCopyWithImpl<$Res, $Val extends SigunguItems>
    implements $SigunguItemsCopyWith<$Res> {
  _$SigunguItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SigunguItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = freezed}) {
    return _then(
      _value.copyWith(
            item: freezed == item
                ? _value.item
                : item // ignore: cast_nullable_to_non_nullable
                      as List<SigunguItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SigunguItemsImplCopyWith<$Res>
    implements $SigunguItemsCopyWith<$Res> {
  factory _$$SigunguItemsImplCopyWith(
    _$SigunguItemsImpl value,
    $Res Function(_$SigunguItemsImpl) then,
  ) = __$$SigunguItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'item') List<SigunguItem>? item});
}

/// @nodoc
class __$$SigunguItemsImplCopyWithImpl<$Res>
    extends _$SigunguItemsCopyWithImpl<$Res, _$SigunguItemsImpl>
    implements _$$SigunguItemsImplCopyWith<$Res> {
  __$$SigunguItemsImplCopyWithImpl(
    _$SigunguItemsImpl _value,
    $Res Function(_$SigunguItemsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SigunguItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = freezed}) {
    return _then(
      _$SigunguItemsImpl(
        item: freezed == item
            ? _value._item
            : item // ignore: cast_nullable_to_non_nullable
                  as List<SigunguItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SigunguItemsImpl implements _SigunguItems {
  const _$SigunguItemsImpl({
    @JsonKey(name: 'item') final List<SigunguItem>? item,
  }) : _item = item;

  factory _$SigunguItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SigunguItemsImplFromJson(json);

  final List<SigunguItem>? _item;
  @override
  @JsonKey(name: 'item')
  List<SigunguItem>? get item {
    final value = _item;
    if (value == null) return null;
    if (_item is EqualUnmodifiableListView) return _item;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SigunguItems(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigunguItemsImpl &&
            const DeepCollectionEquality().equals(other._item, _item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_item));

  /// Create a copy of SigunguItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SigunguItemsImplCopyWith<_$SigunguItemsImpl> get copyWith =>
      __$$SigunguItemsImplCopyWithImpl<_$SigunguItemsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SigunguItemsImplToJson(this);
  }
}

abstract class _SigunguItems implements SigunguItems {
  const factory _SigunguItems({
    @JsonKey(name: 'item') final List<SigunguItem>? item,
  }) = _$SigunguItemsImpl;

  factory _SigunguItems.fromJson(Map<String, dynamic> json) =
      _$SigunguItemsImpl.fromJson;

  @override
  @JsonKey(name: 'item')
  List<SigunguItem>? get item;

  /// Create a copy of SigunguItems
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SigunguItemsImplCopyWith<_$SigunguItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SigunguItem _$SigunguItemFromJson(Map<String, dynamic> json) {
  return _SigunguItem.fromJson(json);
}

/// @nodoc
mixin _$SigunguItem {
  String? get orgCd => throw _privateConstructorUsedError;
  String? get orgdownNm => throw _privateConstructorUsedError;
  String? get uprCd => throw _privateConstructorUsedError;

  /// Serializes this SigunguItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SigunguItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SigunguItemCopyWith<SigunguItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SigunguItemCopyWith<$Res> {
  factory $SigunguItemCopyWith(
    SigunguItem value,
    $Res Function(SigunguItem) then,
  ) = _$SigunguItemCopyWithImpl<$Res, SigunguItem>;
  @useResult
  $Res call({String? orgCd, String? orgdownNm, String? uprCd});
}

/// @nodoc
class _$SigunguItemCopyWithImpl<$Res, $Val extends SigunguItem>
    implements $SigunguItemCopyWith<$Res> {
  _$SigunguItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SigunguItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgCd = freezed,
    Object? orgdownNm = freezed,
    Object? uprCd = freezed,
  }) {
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
            uprCd: freezed == uprCd
                ? _value.uprCd
                : uprCd // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SigunguItemImplCopyWith<$Res>
    implements $SigunguItemCopyWith<$Res> {
  factory _$$SigunguItemImplCopyWith(
    _$SigunguItemImpl value,
    $Res Function(_$SigunguItemImpl) then,
  ) = __$$SigunguItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? orgCd, String? orgdownNm, String? uprCd});
}

/// @nodoc
class __$$SigunguItemImplCopyWithImpl<$Res>
    extends _$SigunguItemCopyWithImpl<$Res, _$SigunguItemImpl>
    implements _$$SigunguItemImplCopyWith<$Res> {
  __$$SigunguItemImplCopyWithImpl(
    _$SigunguItemImpl _value,
    $Res Function(_$SigunguItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SigunguItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgCd = freezed,
    Object? orgdownNm = freezed,
    Object? uprCd = freezed,
  }) {
    return _then(
      _$SigunguItemImpl(
        orgCd: freezed == orgCd
            ? _value.orgCd
            : orgCd // ignore: cast_nullable_to_non_nullable
                  as String?,
        orgdownNm: freezed == orgdownNm
            ? _value.orgdownNm
            : orgdownNm // ignore: cast_nullable_to_non_nullable
                  as String?,
        uprCd: freezed == uprCd
            ? _value.uprCd
            : uprCd // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SigunguItemImpl implements _SigunguItem {
  const _$SigunguItemImpl({this.orgCd, this.orgdownNm, this.uprCd});

  factory _$SigunguItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SigunguItemImplFromJson(json);

  @override
  final String? orgCd;
  @override
  final String? orgdownNm;
  @override
  final String? uprCd;

  @override
  String toString() {
    return 'SigunguItem(orgCd: $orgCd, orgdownNm: $orgdownNm, uprCd: $uprCd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigunguItemImpl &&
            (identical(other.orgCd, orgCd) || other.orgCd == orgCd) &&
            (identical(other.orgdownNm, orgdownNm) ||
                other.orgdownNm == orgdownNm) &&
            (identical(other.uprCd, uprCd) || other.uprCd == uprCd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orgCd, orgdownNm, uprCd);

  /// Create a copy of SigunguItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SigunguItemImplCopyWith<_$SigunguItemImpl> get copyWith =>
      __$$SigunguItemImplCopyWithImpl<_$SigunguItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SigunguItemImplToJson(this);
  }
}

abstract class _SigunguItem implements SigunguItem {
  const factory _SigunguItem({
    final String? orgCd,
    final String? orgdownNm,
    final String? uprCd,
  }) = _$SigunguItemImpl;

  factory _SigunguItem.fromJson(Map<String, dynamic> json) =
      _$SigunguItemImpl.fromJson;

  @override
  String? get orgCd;
  @override
  String? get orgdownNm;
  @override
  String? get uprCd;

  /// Create a copy of SigunguItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SigunguItemImplCopyWith<_$SigunguItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
