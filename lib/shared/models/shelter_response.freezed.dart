// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shelter_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ShelterResponse _$ShelterResponseFromJson(Map<String, dynamic> json) {
  return _ShelterResponse.fromJson(json);
}

/// @nodoc
mixin _$ShelterResponse {
  ShelterHeader get header => throw _privateConstructorUsedError;
  ShelterBody get body => throw _privateConstructorUsedError;

  /// Serializes this ShelterResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShelterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShelterResponseCopyWith<ShelterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelterResponseCopyWith<$Res> {
  factory $ShelterResponseCopyWith(
    ShelterResponse value,
    $Res Function(ShelterResponse) then,
  ) = _$ShelterResponseCopyWithImpl<$Res, ShelterResponse>;
  @useResult
  $Res call({ShelterHeader header, ShelterBody body});

  $ShelterHeaderCopyWith<$Res> get header;
  $ShelterBodyCopyWith<$Res> get body;
}

/// @nodoc
class _$ShelterResponseCopyWithImpl<$Res, $Val extends ShelterResponse>
    implements $ShelterResponseCopyWith<$Res> {
  _$ShelterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShelterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? header = null, Object? body = null}) {
    return _then(
      _value.copyWith(
            header: null == header
                ? _value.header
                : header // ignore: cast_nullable_to_non_nullable
                      as ShelterHeader,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as ShelterBody,
          )
          as $Val,
    );
  }

  /// Create a copy of ShelterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShelterHeaderCopyWith<$Res> get header {
    return $ShelterHeaderCopyWith<$Res>(_value.header, (value) {
      return _then(_value.copyWith(header: value) as $Val);
    });
  }

  /// Create a copy of ShelterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShelterBodyCopyWith<$Res> get body {
    return $ShelterBodyCopyWith<$Res>(_value.body, (value) {
      return _then(_value.copyWith(body: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShelterResponseImplCopyWith<$Res>
    implements $ShelterResponseCopyWith<$Res> {
  factory _$$ShelterResponseImplCopyWith(
    _$ShelterResponseImpl value,
    $Res Function(_$ShelterResponseImpl) then,
  ) = __$$ShelterResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ShelterHeader header, ShelterBody body});

  @override
  $ShelterHeaderCopyWith<$Res> get header;
  @override
  $ShelterBodyCopyWith<$Res> get body;
}

/// @nodoc
class __$$ShelterResponseImplCopyWithImpl<$Res>
    extends _$ShelterResponseCopyWithImpl<$Res, _$ShelterResponseImpl>
    implements _$$ShelterResponseImplCopyWith<$Res> {
  __$$ShelterResponseImplCopyWithImpl(
    _$ShelterResponseImpl _value,
    $Res Function(_$ShelterResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShelterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? header = null, Object? body = null}) {
    return _then(
      _$ShelterResponseImpl(
        header: null == header
            ? _value.header
            : header // ignore: cast_nullable_to_non_nullable
                  as ShelterHeader,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as ShelterBody,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShelterResponseImpl implements _ShelterResponse {
  const _$ShelterResponseImpl({required this.header, required this.body});

  factory _$ShelterResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShelterResponseImplFromJson(json);

  @override
  final ShelterHeader header;
  @override
  final ShelterBody body;

  @override
  String toString() {
    return 'ShelterResponse(header: $header, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShelterResponseImpl &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, header, body);

  /// Create a copy of ShelterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShelterResponseImplCopyWith<_$ShelterResponseImpl> get copyWith =>
      __$$ShelterResponseImplCopyWithImpl<_$ShelterResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ShelterResponseImplToJson(this);
  }
}

abstract class _ShelterResponse implements ShelterResponse {
  const factory _ShelterResponse({
    required final ShelterHeader header,
    required final ShelterBody body,
  }) = _$ShelterResponseImpl;

  factory _ShelterResponse.fromJson(Map<String, dynamic> json) =
      _$ShelterResponseImpl.fromJson;

  @override
  ShelterHeader get header;
  @override
  ShelterBody get body;

  /// Create a copy of ShelterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShelterResponseImplCopyWith<_$ShelterResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShelterHeader _$ShelterHeaderFromJson(Map<String, dynamic> json) {
  return _ShelterHeader.fromJson(json);
}

/// @nodoc
mixin _$ShelterHeader {
  String? get errorMsg => throw _privateConstructorUsedError;
  String? get reqNo => throw _privateConstructorUsedError;
  String? get resultCode => throw _privateConstructorUsedError;
  String? get resultMsg => throw _privateConstructorUsedError;

  /// Serializes this ShelterHeader to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShelterHeader
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShelterHeaderCopyWith<ShelterHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelterHeaderCopyWith<$Res> {
  factory $ShelterHeaderCopyWith(
    ShelterHeader value,
    $Res Function(ShelterHeader) then,
  ) = _$ShelterHeaderCopyWithImpl<$Res, ShelterHeader>;
  @useResult
  $Res call({
    String? errorMsg,
    String? reqNo,
    String? resultCode,
    String? resultMsg,
  });
}

/// @nodoc
class _$ShelterHeaderCopyWithImpl<$Res, $Val extends ShelterHeader>
    implements $ShelterHeaderCopyWith<$Res> {
  _$ShelterHeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShelterHeader
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
abstract class _$$ShelterHeaderImplCopyWith<$Res>
    implements $ShelterHeaderCopyWith<$Res> {
  factory _$$ShelterHeaderImplCopyWith(
    _$ShelterHeaderImpl value,
    $Res Function(_$ShelterHeaderImpl) then,
  ) = __$$ShelterHeaderImplCopyWithImpl<$Res>;
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
class __$$ShelterHeaderImplCopyWithImpl<$Res>
    extends _$ShelterHeaderCopyWithImpl<$Res, _$ShelterHeaderImpl>
    implements _$$ShelterHeaderImplCopyWith<$Res> {
  __$$ShelterHeaderImplCopyWithImpl(
    _$ShelterHeaderImpl _value,
    $Res Function(_$ShelterHeaderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShelterHeader
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
      _$ShelterHeaderImpl(
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
class _$ShelterHeaderImpl implements _ShelterHeader {
  const _$ShelterHeaderImpl({
    this.errorMsg,
    this.reqNo,
    this.resultCode,
    this.resultMsg,
  });

  factory _$ShelterHeaderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShelterHeaderImplFromJson(json);

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
    return 'ShelterHeader(errorMsg: $errorMsg, reqNo: $reqNo, resultCode: $resultCode, resultMsg: $resultMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShelterHeaderImpl &&
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

  /// Create a copy of ShelterHeader
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShelterHeaderImplCopyWith<_$ShelterHeaderImpl> get copyWith =>
      __$$ShelterHeaderImplCopyWithImpl<_$ShelterHeaderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShelterHeaderImplToJson(this);
  }
}

abstract class _ShelterHeader implements ShelterHeader {
  const factory _ShelterHeader({
    final String? errorMsg,
    final String? reqNo,
    final String? resultCode,
    final String? resultMsg,
  }) = _$ShelterHeaderImpl;

  factory _ShelterHeader.fromJson(Map<String, dynamic> json) =
      _$ShelterHeaderImpl.fromJson;

  @override
  String? get errorMsg;
  @override
  String? get reqNo;
  @override
  String? get resultCode;
  @override
  String? get resultMsg;

  /// Create a copy of ShelterHeader
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShelterHeaderImplCopyWith<_$ShelterHeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShelterBody _$ShelterBodyFromJson(Map<String, dynamic> json) {
  return _ShelterBody.fromJson(json);
}

/// @nodoc
mixin _$ShelterBody {
  String? get pageNo => throw _privateConstructorUsedError;
  ShelterItems? get items => throw _privateConstructorUsedError;
  String? get totalCount => throw _privateConstructorUsedError;
  String? get numOfRows => throw _privateConstructorUsedError;

  /// Serializes this ShelterBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShelterBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShelterBodyCopyWith<ShelterBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelterBodyCopyWith<$Res> {
  factory $ShelterBodyCopyWith(
    ShelterBody value,
    $Res Function(ShelterBody) then,
  ) = _$ShelterBodyCopyWithImpl<$Res, ShelterBody>;
  @useResult
  $Res call({
    String? pageNo,
    ShelterItems? items,
    String? totalCount,
    String? numOfRows,
  });

  $ShelterItemsCopyWith<$Res>? get items;
}

/// @nodoc
class _$ShelterBodyCopyWithImpl<$Res, $Val extends ShelterBody>
    implements $ShelterBodyCopyWith<$Res> {
  _$ShelterBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShelterBody
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
                      as ShelterItems?,
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

  /// Create a copy of ShelterBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShelterItemsCopyWith<$Res>? get items {
    if (_value.items == null) {
      return null;
    }

    return $ShelterItemsCopyWith<$Res>(_value.items!, (value) {
      return _then(_value.copyWith(items: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShelterBodyImplCopyWith<$Res>
    implements $ShelterBodyCopyWith<$Res> {
  factory _$$ShelterBodyImplCopyWith(
    _$ShelterBodyImpl value,
    $Res Function(_$ShelterBodyImpl) then,
  ) = __$$ShelterBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? pageNo,
    ShelterItems? items,
    String? totalCount,
    String? numOfRows,
  });

  @override
  $ShelterItemsCopyWith<$Res>? get items;
}

/// @nodoc
class __$$ShelterBodyImplCopyWithImpl<$Res>
    extends _$ShelterBodyCopyWithImpl<$Res, _$ShelterBodyImpl>
    implements _$$ShelterBodyImplCopyWith<$Res> {
  __$$ShelterBodyImplCopyWithImpl(
    _$ShelterBodyImpl _value,
    $Res Function(_$ShelterBodyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShelterBody
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
      _$ShelterBodyImpl(
        pageNo: freezed == pageNo
            ? _value.pageNo
            : pageNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        items: freezed == items
            ? _value.items
            : items // ignore: cast_nullable_to_non_nullable
                  as ShelterItems?,
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
class _$ShelterBodyImpl implements _ShelterBody {
  const _$ShelterBodyImpl({
    this.pageNo,
    this.items,
    this.totalCount,
    this.numOfRows,
  });

  factory _$ShelterBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShelterBodyImplFromJson(json);

  @override
  final String? pageNo;
  @override
  final ShelterItems? items;
  @override
  final String? totalCount;
  @override
  final String? numOfRows;

  @override
  String toString() {
    return 'ShelterBody(pageNo: $pageNo, items: $items, totalCount: $totalCount, numOfRows: $numOfRows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShelterBodyImpl &&
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

  /// Create a copy of ShelterBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShelterBodyImplCopyWith<_$ShelterBodyImpl> get copyWith =>
      __$$ShelterBodyImplCopyWithImpl<_$ShelterBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShelterBodyImplToJson(this);
  }
}

abstract class _ShelterBody implements ShelterBody {
  const factory _ShelterBody({
    final String? pageNo,
    final ShelterItems? items,
    final String? totalCount,
    final String? numOfRows,
  }) = _$ShelterBodyImpl;

  factory _ShelterBody.fromJson(Map<String, dynamic> json) =
      _$ShelterBodyImpl.fromJson;

  @override
  String? get pageNo;
  @override
  ShelterItems? get items;
  @override
  String? get totalCount;
  @override
  String? get numOfRows;

  /// Create a copy of ShelterBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShelterBodyImplCopyWith<_$ShelterBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShelterItems _$ShelterItemsFromJson(Map<String, dynamic> json) {
  return _ShelterItems.fromJson(json);
}

/// @nodoc
mixin _$ShelterItems {
  @JsonKey(name: 'item')
  List<ShelterItem>? get item => throw _privateConstructorUsedError;

  /// Serializes this ShelterItems to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShelterItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShelterItemsCopyWith<ShelterItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelterItemsCopyWith<$Res> {
  factory $ShelterItemsCopyWith(
    ShelterItems value,
    $Res Function(ShelterItems) then,
  ) = _$ShelterItemsCopyWithImpl<$Res, ShelterItems>;
  @useResult
  $Res call({@JsonKey(name: 'item') List<ShelterItem>? item});
}

/// @nodoc
class _$ShelterItemsCopyWithImpl<$Res, $Val extends ShelterItems>
    implements $ShelterItemsCopyWith<$Res> {
  _$ShelterItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShelterItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = freezed}) {
    return _then(
      _value.copyWith(
            item: freezed == item
                ? _value.item
                : item // ignore: cast_nullable_to_non_nullable
                      as List<ShelterItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShelterItemsImplCopyWith<$Res>
    implements $ShelterItemsCopyWith<$Res> {
  factory _$$ShelterItemsImplCopyWith(
    _$ShelterItemsImpl value,
    $Res Function(_$ShelterItemsImpl) then,
  ) = __$$ShelterItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'item') List<ShelterItem>? item});
}

/// @nodoc
class __$$ShelterItemsImplCopyWithImpl<$Res>
    extends _$ShelterItemsCopyWithImpl<$Res, _$ShelterItemsImpl>
    implements _$$ShelterItemsImplCopyWith<$Res> {
  __$$ShelterItemsImplCopyWithImpl(
    _$ShelterItemsImpl _value,
    $Res Function(_$ShelterItemsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShelterItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = freezed}) {
    return _then(
      _$ShelterItemsImpl(
        item: freezed == item
            ? _value._item
            : item // ignore: cast_nullable_to_non_nullable
                  as List<ShelterItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShelterItemsImpl implements _ShelterItems {
  const _$ShelterItemsImpl({
    @JsonKey(name: 'item') final List<ShelterItem>? item,
  }) : _item = item;

  factory _$ShelterItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShelterItemsImplFromJson(json);

  final List<ShelterItem>? _item;
  @override
  @JsonKey(name: 'item')
  List<ShelterItem>? get item {
    final value = _item;
    if (value == null) return null;
    if (_item is EqualUnmodifiableListView) return _item;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ShelterItems(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShelterItemsImpl &&
            const DeepCollectionEquality().equals(other._item, _item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_item));

  /// Create a copy of ShelterItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShelterItemsImplCopyWith<_$ShelterItemsImpl> get copyWith =>
      __$$ShelterItemsImplCopyWithImpl<_$ShelterItemsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShelterItemsImplToJson(this);
  }
}

abstract class _ShelterItems implements ShelterItems {
  const factory _ShelterItems({
    @JsonKey(name: 'item') final List<ShelterItem>? item,
  }) = _$ShelterItemsImpl;

  factory _ShelterItems.fromJson(Map<String, dynamic> json) =
      _$ShelterItemsImpl.fromJson;

  @override
  @JsonKey(name: 'item')
  List<ShelterItem>? get item;

  /// Create a copy of ShelterItems
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShelterItemsImplCopyWith<_$ShelterItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShelterItem _$ShelterItemFromJson(Map<String, dynamic> json) {
  return _ShelterItem.fromJson(json);
}

/// @nodoc
mixin _$ShelterItem {
  String? get careRegNo => throw _privateConstructorUsedError;
  String? get careNm => throw _privateConstructorUsedError;

  /// Serializes this ShelterItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShelterItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShelterItemCopyWith<ShelterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelterItemCopyWith<$Res> {
  factory $ShelterItemCopyWith(
    ShelterItem value,
    $Res Function(ShelterItem) then,
  ) = _$ShelterItemCopyWithImpl<$Res, ShelterItem>;
  @useResult
  $Res call({String? careRegNo, String? careNm});
}

/// @nodoc
class _$ShelterItemCopyWithImpl<$Res, $Val extends ShelterItem>
    implements $ShelterItemCopyWith<$Res> {
  _$ShelterItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShelterItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? careRegNo = freezed, Object? careNm = freezed}) {
    return _then(
      _value.copyWith(
            careRegNo: freezed == careRegNo
                ? _value.careRegNo
                : careRegNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            careNm: freezed == careNm
                ? _value.careNm
                : careNm // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShelterItemImplCopyWith<$Res>
    implements $ShelterItemCopyWith<$Res> {
  factory _$$ShelterItemImplCopyWith(
    _$ShelterItemImpl value,
    $Res Function(_$ShelterItemImpl) then,
  ) = __$$ShelterItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? careRegNo, String? careNm});
}

/// @nodoc
class __$$ShelterItemImplCopyWithImpl<$Res>
    extends _$ShelterItemCopyWithImpl<$Res, _$ShelterItemImpl>
    implements _$$ShelterItemImplCopyWith<$Res> {
  __$$ShelterItemImplCopyWithImpl(
    _$ShelterItemImpl _value,
    $Res Function(_$ShelterItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShelterItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? careRegNo = freezed, Object? careNm = freezed}) {
    return _then(
      _$ShelterItemImpl(
        careRegNo: freezed == careRegNo
            ? _value.careRegNo
            : careRegNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        careNm: freezed == careNm
            ? _value.careNm
            : careNm // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShelterItemImpl implements _ShelterItem {
  const _$ShelterItemImpl({this.careRegNo, this.careNm});

  factory _$ShelterItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShelterItemImplFromJson(json);

  @override
  final String? careRegNo;
  @override
  final String? careNm;

  @override
  String toString() {
    return 'ShelterItem(careRegNo: $careRegNo, careNm: $careNm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShelterItemImpl &&
            (identical(other.careRegNo, careRegNo) ||
                other.careRegNo == careRegNo) &&
            (identical(other.careNm, careNm) || other.careNm == careNm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, careRegNo, careNm);

  /// Create a copy of ShelterItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShelterItemImplCopyWith<_$ShelterItemImpl> get copyWith =>
      __$$ShelterItemImplCopyWithImpl<_$ShelterItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShelterItemImplToJson(this);
  }
}

abstract class _ShelterItem implements ShelterItem {
  const factory _ShelterItem({final String? careRegNo, final String? careNm}) =
      _$ShelterItemImpl;

  factory _ShelterItem.fromJson(Map<String, dynamic> json) =
      _$ShelterItemImpl.fromJson;

  @override
  String? get careRegNo;
  @override
  String? get careNm;

  /// Create a copy of ShelterItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShelterItemImplCopyWith<_$ShelterItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
