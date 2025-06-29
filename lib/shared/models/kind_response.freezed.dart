// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kind_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

KindResponse _$KindResponseFromJson(Map<String, dynamic> json) {
  return _KindResponse.fromJson(json);
}

/// @nodoc
mixin _$KindResponse {
  KindHeader get header => throw _privateConstructorUsedError;
  KindBody get body => throw _privateConstructorUsedError;

  /// Serializes this KindResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KindResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KindResponseCopyWith<KindResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KindResponseCopyWith<$Res> {
  factory $KindResponseCopyWith(
    KindResponse value,
    $Res Function(KindResponse) then,
  ) = _$KindResponseCopyWithImpl<$Res, KindResponse>;
  @useResult
  $Res call({KindHeader header, KindBody body});

  $KindHeaderCopyWith<$Res> get header;
  $KindBodyCopyWith<$Res> get body;
}

/// @nodoc
class _$KindResponseCopyWithImpl<$Res, $Val extends KindResponse>
    implements $KindResponseCopyWith<$Res> {
  _$KindResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KindResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? header = null, Object? body = null}) {
    return _then(
      _value.copyWith(
            header: null == header
                ? _value.header
                : header // ignore: cast_nullable_to_non_nullable
                      as KindHeader,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as KindBody,
          )
          as $Val,
    );
  }

  /// Create a copy of KindResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KindHeaderCopyWith<$Res> get header {
    return $KindHeaderCopyWith<$Res>(_value.header, (value) {
      return _then(_value.copyWith(header: value) as $Val);
    });
  }

  /// Create a copy of KindResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KindBodyCopyWith<$Res> get body {
    return $KindBodyCopyWith<$Res>(_value.body, (value) {
      return _then(_value.copyWith(body: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KindResponseImplCopyWith<$Res>
    implements $KindResponseCopyWith<$Res> {
  factory _$$KindResponseImplCopyWith(
    _$KindResponseImpl value,
    $Res Function(_$KindResponseImpl) then,
  ) = __$$KindResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({KindHeader header, KindBody body});

  @override
  $KindHeaderCopyWith<$Res> get header;
  @override
  $KindBodyCopyWith<$Res> get body;
}

/// @nodoc
class __$$KindResponseImplCopyWithImpl<$Res>
    extends _$KindResponseCopyWithImpl<$Res, _$KindResponseImpl>
    implements _$$KindResponseImplCopyWith<$Res> {
  __$$KindResponseImplCopyWithImpl(
    _$KindResponseImpl _value,
    $Res Function(_$KindResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KindResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? header = null, Object? body = null}) {
    return _then(
      _$KindResponseImpl(
        header: null == header
            ? _value.header
            : header // ignore: cast_nullable_to_non_nullable
                  as KindHeader,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as KindBody,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KindResponseImpl implements _KindResponse {
  const _$KindResponseImpl({required this.header, required this.body});

  factory _$KindResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$KindResponseImplFromJson(json);

  @override
  final KindHeader header;
  @override
  final KindBody body;

  @override
  String toString() {
    return 'KindResponse(header: $header, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KindResponseImpl &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, header, body);

  /// Create a copy of KindResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KindResponseImplCopyWith<_$KindResponseImpl> get copyWith =>
      __$$KindResponseImplCopyWithImpl<_$KindResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KindResponseImplToJson(this);
  }
}

abstract class _KindResponse implements KindResponse {
  const factory _KindResponse({
    required final KindHeader header,
    required final KindBody body,
  }) = _$KindResponseImpl;

  factory _KindResponse.fromJson(Map<String, dynamic> json) =
      _$KindResponseImpl.fromJson;

  @override
  KindHeader get header;
  @override
  KindBody get body;

  /// Create a copy of KindResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KindResponseImplCopyWith<_$KindResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KindHeader _$KindHeaderFromJson(Map<String, dynamic> json) {
  return _KindHeader.fromJson(json);
}

/// @nodoc
mixin _$KindHeader {
  String? get errorMsg => throw _privateConstructorUsedError;
  String? get reqNo => throw _privateConstructorUsedError;
  String? get resultCode => throw _privateConstructorUsedError;
  String? get resultMsg => throw _privateConstructorUsedError;

  /// Serializes this KindHeader to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KindHeader
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KindHeaderCopyWith<KindHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KindHeaderCopyWith<$Res> {
  factory $KindHeaderCopyWith(
    KindHeader value,
    $Res Function(KindHeader) then,
  ) = _$KindHeaderCopyWithImpl<$Res, KindHeader>;
  @useResult
  $Res call({
    String? errorMsg,
    String? reqNo,
    String? resultCode,
    String? resultMsg,
  });
}

/// @nodoc
class _$KindHeaderCopyWithImpl<$Res, $Val extends KindHeader>
    implements $KindHeaderCopyWith<$Res> {
  _$KindHeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KindHeader
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = freezed,
    Object? reqNo = freezed,
    Object? resultCode = freezed,
    Object? resultMsg = freezed,
  }) {
    return _then(
      _value.copyWith(
            errorMsg: freezed == errorMsg
                ? _value.errorMsg
                : errorMsg // ignore: cast_nullable_to_non_nullable
                      as String?,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$KindHeaderImplCopyWith<$Res>
    implements $KindHeaderCopyWith<$Res> {
  factory _$$KindHeaderImplCopyWith(
    _$KindHeaderImpl value,
    $Res Function(_$KindHeaderImpl) then,
  ) = __$$KindHeaderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? errorMsg,
    String? reqNo,
    String? resultCode,
    String? resultMsg,
  });
}

/// @nodoc
class __$$KindHeaderImplCopyWithImpl<$Res>
    extends _$KindHeaderCopyWithImpl<$Res, _$KindHeaderImpl>
    implements _$$KindHeaderImplCopyWith<$Res> {
  __$$KindHeaderImplCopyWithImpl(
    _$KindHeaderImpl _value,
    $Res Function(_$KindHeaderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KindHeader
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = freezed,
    Object? reqNo = freezed,
    Object? resultCode = freezed,
    Object? resultMsg = freezed,
  }) {
    return _then(
      _$KindHeaderImpl(
        errorMsg: freezed == errorMsg
            ? _value.errorMsg
            : errorMsg // ignore: cast_nullable_to_non_nullable
                  as String?,
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KindHeaderImpl implements _KindHeader {
  const _$KindHeaderImpl({
    this.errorMsg,
    this.reqNo,
    this.resultCode,
    this.resultMsg,
  });

  factory _$KindHeaderImpl.fromJson(Map<String, dynamic> json) =>
      _$$KindHeaderImplFromJson(json);

  @override
  final String? errorMsg;
  @override
  final String? reqNo;
  @override
  final String? resultCode;
  @override
  final String? resultMsg;

  @override
  String toString() {
    return 'KindHeader(errorMsg: $errorMsg, reqNo: $reqNo, resultCode: $resultCode, resultMsg: $resultMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KindHeaderImpl &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.reqNo, reqNo) || other.reqNo == reqNo) &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            (identical(other.resultMsg, resultMsg) ||
                other.resultMsg == resultMsg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, errorMsg, reqNo, resultCode, resultMsg);

  /// Create a copy of KindHeader
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KindHeaderImplCopyWith<_$KindHeaderImpl> get copyWith =>
      __$$KindHeaderImplCopyWithImpl<_$KindHeaderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KindHeaderImplToJson(this);
  }
}

abstract class _KindHeader implements KindHeader {
  const factory _KindHeader({
    final String? errorMsg,
    final String? reqNo,
    final String? resultCode,
    final String? resultMsg,
  }) = _$KindHeaderImpl;

  factory _KindHeader.fromJson(Map<String, dynamic> json) =
      _$KindHeaderImpl.fromJson;

  @override
  String? get errorMsg;
  @override
  String? get reqNo;
  @override
  String? get resultCode;
  @override
  String? get resultMsg;

  /// Create a copy of KindHeader
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KindHeaderImplCopyWith<_$KindHeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KindBody _$KindBodyFromJson(Map<String, dynamic> json) {
  return _KindBody.fromJson(json);
}

/// @nodoc
mixin _$KindBody {
  String? get pageNo => throw _privateConstructorUsedError;
  KindItems? get items => throw _privateConstructorUsedError;
  String? get totalCount => throw _privateConstructorUsedError;
  String? get numOfRows => throw _privateConstructorUsedError;

  /// Serializes this KindBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KindBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KindBodyCopyWith<KindBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KindBodyCopyWith<$Res> {
  factory $KindBodyCopyWith(KindBody value, $Res Function(KindBody) then) =
      _$KindBodyCopyWithImpl<$Res, KindBody>;
  @useResult
  $Res call({
    String? pageNo,
    KindItems? items,
    String? totalCount,
    String? numOfRows,
  });

  $KindItemsCopyWith<$Res>? get items;
}

/// @nodoc
class _$KindBodyCopyWithImpl<$Res, $Val extends KindBody>
    implements $KindBodyCopyWith<$Res> {
  _$KindBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KindBody
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
                      as KindItems?,
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

  /// Create a copy of KindBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KindItemsCopyWith<$Res>? get items {
    if (_value.items == null) {
      return null;
    }

    return $KindItemsCopyWith<$Res>(_value.items!, (value) {
      return _then(_value.copyWith(items: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KindBodyImplCopyWith<$Res>
    implements $KindBodyCopyWith<$Res> {
  factory _$$KindBodyImplCopyWith(
    _$KindBodyImpl value,
    $Res Function(_$KindBodyImpl) then,
  ) = __$$KindBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? pageNo,
    KindItems? items,
    String? totalCount,
    String? numOfRows,
  });

  @override
  $KindItemsCopyWith<$Res>? get items;
}

/// @nodoc
class __$$KindBodyImplCopyWithImpl<$Res>
    extends _$KindBodyCopyWithImpl<$Res, _$KindBodyImpl>
    implements _$$KindBodyImplCopyWith<$Res> {
  __$$KindBodyImplCopyWithImpl(
    _$KindBodyImpl _value,
    $Res Function(_$KindBodyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KindBody
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
      _$KindBodyImpl(
        pageNo: freezed == pageNo
            ? _value.pageNo
            : pageNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        items: freezed == items
            ? _value.items
            : items // ignore: cast_nullable_to_non_nullable
                  as KindItems?,
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
class _$KindBodyImpl implements _KindBody {
  const _$KindBodyImpl({
    this.pageNo,
    this.items,
    this.totalCount,
    this.numOfRows,
  });

  factory _$KindBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$KindBodyImplFromJson(json);

  @override
  final String? pageNo;
  @override
  final KindItems? items;
  @override
  final String? totalCount;
  @override
  final String? numOfRows;

  @override
  String toString() {
    return 'KindBody(pageNo: $pageNo, items: $items, totalCount: $totalCount, numOfRows: $numOfRows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KindBodyImpl &&
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

  /// Create a copy of KindBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KindBodyImplCopyWith<_$KindBodyImpl> get copyWith =>
      __$$KindBodyImplCopyWithImpl<_$KindBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KindBodyImplToJson(this);
  }
}

abstract class _KindBody implements KindBody {
  const factory _KindBody({
    final String? pageNo,
    final KindItems? items,
    final String? totalCount,
    final String? numOfRows,
  }) = _$KindBodyImpl;

  factory _KindBody.fromJson(Map<String, dynamic> json) =
      _$KindBodyImpl.fromJson;

  @override
  String? get pageNo;
  @override
  KindItems? get items;
  @override
  String? get totalCount;
  @override
  String? get numOfRows;

  /// Create a copy of KindBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KindBodyImplCopyWith<_$KindBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KindItems _$KindItemsFromJson(Map<String, dynamic> json) {
  return _KindItems.fromJson(json);
}

/// @nodoc
mixin _$KindItems {
  @JsonKey(name: 'item')
  List<KindItem>? get item => throw _privateConstructorUsedError;

  /// Serializes this KindItems to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KindItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KindItemsCopyWith<KindItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KindItemsCopyWith<$Res> {
  factory $KindItemsCopyWith(KindItems value, $Res Function(KindItems) then) =
      _$KindItemsCopyWithImpl<$Res, KindItems>;
  @useResult
  $Res call({@JsonKey(name: 'item') List<KindItem>? item});
}

/// @nodoc
class _$KindItemsCopyWithImpl<$Res, $Val extends KindItems>
    implements $KindItemsCopyWith<$Res> {
  _$KindItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KindItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = freezed}) {
    return _then(
      _value.copyWith(
            item: freezed == item
                ? _value.item
                : item // ignore: cast_nullable_to_non_nullable
                      as List<KindItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$KindItemsImplCopyWith<$Res>
    implements $KindItemsCopyWith<$Res> {
  factory _$$KindItemsImplCopyWith(
    _$KindItemsImpl value,
    $Res Function(_$KindItemsImpl) then,
  ) = __$$KindItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'item') List<KindItem>? item});
}

/// @nodoc
class __$$KindItemsImplCopyWithImpl<$Res>
    extends _$KindItemsCopyWithImpl<$Res, _$KindItemsImpl>
    implements _$$KindItemsImplCopyWith<$Res> {
  __$$KindItemsImplCopyWithImpl(
    _$KindItemsImpl _value,
    $Res Function(_$KindItemsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KindItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = freezed}) {
    return _then(
      _$KindItemsImpl(
        item: freezed == item
            ? _value._item
            : item // ignore: cast_nullable_to_non_nullable
                  as List<KindItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KindItemsImpl implements _KindItems {
  const _$KindItemsImpl({@JsonKey(name: 'item') final List<KindItem>? item})
    : _item = item;

  factory _$KindItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$KindItemsImplFromJson(json);

  final List<KindItem>? _item;
  @override
  @JsonKey(name: 'item')
  List<KindItem>? get item {
    final value = _item;
    if (value == null) return null;
    if (_item is EqualUnmodifiableListView) return _item;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'KindItems(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KindItemsImpl &&
            const DeepCollectionEquality().equals(other._item, _item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_item));

  /// Create a copy of KindItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KindItemsImplCopyWith<_$KindItemsImpl> get copyWith =>
      __$$KindItemsImplCopyWithImpl<_$KindItemsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KindItemsImplToJson(this);
  }
}

abstract class _KindItems implements KindItems {
  const factory _KindItems({
    @JsonKey(name: 'item') final List<KindItem>? item,
  }) = _$KindItemsImpl;

  factory _KindItems.fromJson(Map<String, dynamic> json) =
      _$KindItemsImpl.fromJson;

  @override
  @JsonKey(name: 'item')
  List<KindItem>? get item;

  /// Create a copy of KindItems
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KindItemsImplCopyWith<_$KindItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KindItem _$KindItemFromJson(Map<String, dynamic> json) {
  return _KindItem.fromJson(json);
}

/// @nodoc
mixin _$KindItem {
  String? get kindCd => throw _privateConstructorUsedError;
  String? get kindNm => throw _privateConstructorUsedError;

  /// Serializes this KindItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KindItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KindItemCopyWith<KindItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KindItemCopyWith<$Res> {
  factory $KindItemCopyWith(KindItem value, $Res Function(KindItem) then) =
      _$KindItemCopyWithImpl<$Res, KindItem>;
  @useResult
  $Res call({String? kindCd, String? kindNm});
}

/// @nodoc
class _$KindItemCopyWithImpl<$Res, $Val extends KindItem>
    implements $KindItemCopyWith<$Res> {
  _$KindItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KindItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? kindCd = freezed, Object? kindNm = freezed}) {
    return _then(
      _value.copyWith(
            kindCd: freezed == kindCd
                ? _value.kindCd
                : kindCd // ignore: cast_nullable_to_non_nullable
                      as String?,
            kindNm: freezed == kindNm
                ? _value.kindNm
                : kindNm // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$KindItemImplCopyWith<$Res>
    implements $KindItemCopyWith<$Res> {
  factory _$$KindItemImplCopyWith(
    _$KindItemImpl value,
    $Res Function(_$KindItemImpl) then,
  ) = __$$KindItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? kindCd, String? kindNm});
}

/// @nodoc
class __$$KindItemImplCopyWithImpl<$Res>
    extends _$KindItemCopyWithImpl<$Res, _$KindItemImpl>
    implements _$$KindItemImplCopyWith<$Res> {
  __$$KindItemImplCopyWithImpl(
    _$KindItemImpl _value,
    $Res Function(_$KindItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KindItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? kindCd = freezed, Object? kindNm = freezed}) {
    return _then(
      _$KindItemImpl(
        kindCd: freezed == kindCd
            ? _value.kindCd
            : kindCd // ignore: cast_nullable_to_non_nullable
                  as String?,
        kindNm: freezed == kindNm
            ? _value.kindNm
            : kindNm // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KindItemImpl implements _KindItem {
  const _$KindItemImpl({this.kindCd, this.kindNm});

  factory _$KindItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$KindItemImplFromJson(json);

  @override
  final String? kindCd;
  @override
  final String? kindNm;

  @override
  String toString() {
    return 'KindItem(kindCd: $kindCd, kindNm: $kindNm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KindItemImpl &&
            (identical(other.kindCd, kindCd) || other.kindCd == kindCd) &&
            (identical(other.kindNm, kindNm) || other.kindNm == kindNm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, kindCd, kindNm);

  /// Create a copy of KindItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KindItemImplCopyWith<_$KindItemImpl> get copyWith =>
      __$$KindItemImplCopyWithImpl<_$KindItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KindItemImplToJson(this);
  }
}

abstract class _KindItem implements KindItem {
  const factory _KindItem({final String? kindCd, final String? kindNm}) =
      _$KindItemImpl;

  factory _KindItem.fromJson(Map<String, dynamic> json) =
      _$KindItemImpl.fromJson;

  @override
  String? get kindCd;
  @override
  String? get kindNm;

  /// Create a copy of KindItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KindItemImplCopyWith<_$KindItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
