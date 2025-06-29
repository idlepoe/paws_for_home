// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abandonment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AbandonmentResponse _$AbandonmentResponseFromJson(Map<String, dynamic> json) {
  return _AbandonmentResponse.fromJson(json);
}

/// @nodoc
mixin _$AbandonmentResponse {
  Header get header => throw _privateConstructorUsedError;
  Body get body => throw _privateConstructorUsedError;

  /// Serializes this AbandonmentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AbandonmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AbandonmentResponseCopyWith<AbandonmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbandonmentResponseCopyWith<$Res> {
  factory $AbandonmentResponseCopyWith(
    AbandonmentResponse value,
    $Res Function(AbandonmentResponse) then,
  ) = _$AbandonmentResponseCopyWithImpl<$Res, AbandonmentResponse>;
  @useResult
  $Res call({Header header, Body body});

  $HeaderCopyWith<$Res> get header;
  $BodyCopyWith<$Res> get body;
}

/// @nodoc
class _$AbandonmentResponseCopyWithImpl<$Res, $Val extends AbandonmentResponse>
    implements $AbandonmentResponseCopyWith<$Res> {
  _$AbandonmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AbandonmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? header = null, Object? body = null}) {
    return _then(
      _value.copyWith(
            header: null == header
                ? _value.header
                : header // ignore: cast_nullable_to_non_nullable
                      as Header,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as Body,
          )
          as $Val,
    );
  }

  /// Create a copy of AbandonmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HeaderCopyWith<$Res> get header {
    return $HeaderCopyWith<$Res>(_value.header, (value) {
      return _then(_value.copyWith(header: value) as $Val);
    });
  }

  /// Create a copy of AbandonmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BodyCopyWith<$Res> get body {
    return $BodyCopyWith<$Res>(_value.body, (value) {
      return _then(_value.copyWith(body: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AbandonmentResponseImplCopyWith<$Res>
    implements $AbandonmentResponseCopyWith<$Res> {
  factory _$$AbandonmentResponseImplCopyWith(
    _$AbandonmentResponseImpl value,
    $Res Function(_$AbandonmentResponseImpl) then,
  ) = __$$AbandonmentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Header header, Body body});

  @override
  $HeaderCopyWith<$Res> get header;
  @override
  $BodyCopyWith<$Res> get body;
}

/// @nodoc
class __$$AbandonmentResponseImplCopyWithImpl<$Res>
    extends _$AbandonmentResponseCopyWithImpl<$Res, _$AbandonmentResponseImpl>
    implements _$$AbandonmentResponseImplCopyWith<$Res> {
  __$$AbandonmentResponseImplCopyWithImpl(
    _$AbandonmentResponseImpl _value,
    $Res Function(_$AbandonmentResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AbandonmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? header = null, Object? body = null}) {
    return _then(
      _$AbandonmentResponseImpl(
        header: null == header
            ? _value.header
            : header // ignore: cast_nullable_to_non_nullable
                  as Header,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as Body,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AbandonmentResponseImpl implements _AbandonmentResponse {
  const _$AbandonmentResponseImpl({required this.header, required this.body});

  factory _$AbandonmentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbandonmentResponseImplFromJson(json);

  @override
  final Header header;
  @override
  final Body body;

  @override
  String toString() {
    return 'AbandonmentResponse(header: $header, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbandonmentResponseImpl &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, header, body);

  /// Create a copy of AbandonmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbandonmentResponseImplCopyWith<_$AbandonmentResponseImpl> get copyWith =>
      __$$AbandonmentResponseImplCopyWithImpl<_$AbandonmentResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AbandonmentResponseImplToJson(this);
  }
}

abstract class _AbandonmentResponse implements AbandonmentResponse {
  const factory _AbandonmentResponse({
    required final Header header,
    required final Body body,
  }) = _$AbandonmentResponseImpl;

  factory _AbandonmentResponse.fromJson(Map<String, dynamic> json) =
      _$AbandonmentResponseImpl.fromJson;

  @override
  Header get header;
  @override
  Body get body;

  /// Create a copy of AbandonmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbandonmentResponseImplCopyWith<_$AbandonmentResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Header _$HeaderFromJson(Map<String, dynamic> json) {
  return _Header.fromJson(json);
}

/// @nodoc
mixin _$Header {
  String? get reqNo => throw _privateConstructorUsedError;
  String? get resultCode => throw _privateConstructorUsedError;
  String? get resultMsg => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

  /// Serializes this Header to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Header
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeaderCopyWith<Header> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeaderCopyWith<$Res> {
  factory $HeaderCopyWith(Header value, $Res Function(Header) then) =
      _$HeaderCopyWithImpl<$Res, Header>;
  @useResult
  $Res call({
    String? reqNo,
    String? resultCode,
    String? resultMsg,
    String? errorMsg,
  });
}

/// @nodoc
class _$HeaderCopyWithImpl<$Res, $Val extends Header>
    implements $HeaderCopyWith<$Res> {
  _$HeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Header
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
abstract class _$$HeaderImplCopyWith<$Res> implements $HeaderCopyWith<$Res> {
  factory _$$HeaderImplCopyWith(
    _$HeaderImpl value,
    $Res Function(_$HeaderImpl) then,
  ) = __$$HeaderImplCopyWithImpl<$Res>;
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
class __$$HeaderImplCopyWithImpl<$Res>
    extends _$HeaderCopyWithImpl<$Res, _$HeaderImpl>
    implements _$$HeaderImplCopyWith<$Res> {
  __$$HeaderImplCopyWithImpl(
    _$HeaderImpl _value,
    $Res Function(_$HeaderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Header
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
      _$HeaderImpl(
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
class _$HeaderImpl implements _Header {
  const _$HeaderImpl({
    this.reqNo,
    this.resultCode,
    this.resultMsg,
    this.errorMsg,
  });

  factory _$HeaderImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeaderImplFromJson(json);

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
    return 'Header(reqNo: $reqNo, resultCode: $resultCode, resultMsg: $resultMsg, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeaderImpl &&
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

  /// Create a copy of Header
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeaderImplCopyWith<_$HeaderImpl> get copyWith =>
      __$$HeaderImplCopyWithImpl<_$HeaderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeaderImplToJson(this);
  }
}

abstract class _Header implements Header {
  const factory _Header({
    final String? reqNo,
    final String? resultCode,
    final String? resultMsg,
    final String? errorMsg,
  }) = _$HeaderImpl;

  factory _Header.fromJson(Map<String, dynamic> json) = _$HeaderImpl.fromJson;

  @override
  String? get reqNo;
  @override
  String? get resultCode;
  @override
  String? get resultMsg;
  @override
  String? get errorMsg;

  /// Create a copy of Header
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeaderImplCopyWith<_$HeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Body _$BodyFromJson(Map<String, dynamic> json) {
  return _Body.fromJson(json);
}

/// @nodoc
mixin _$Body {
  Items? get items => throw _privateConstructorUsedError;
  String? get numOfRows => throw _privateConstructorUsedError;
  String? get pageNo => throw _privateConstructorUsedError;
  String? get totalCount => throw _privateConstructorUsedError;

  /// Serializes this Body to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Body
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BodyCopyWith<Body> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyCopyWith<$Res> {
  factory $BodyCopyWith(Body value, $Res Function(Body) then) =
      _$BodyCopyWithImpl<$Res, Body>;
  @useResult
  $Res call({
    Items? items,
    String? numOfRows,
    String? pageNo,
    String? totalCount,
  });

  $ItemsCopyWith<$Res>? get items;
}

/// @nodoc
class _$BodyCopyWithImpl<$Res, $Val extends Body>
    implements $BodyCopyWith<$Res> {
  _$BodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Body
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
                      as Items?,
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

  /// Create a copy of Body
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemsCopyWith<$Res>? get items {
    if (_value.items == null) {
      return null;
    }

    return $ItemsCopyWith<$Res>(_value.items!, (value) {
      return _then(_value.copyWith(items: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BodyImplCopyWith<$Res> implements $BodyCopyWith<$Res> {
  factory _$$BodyImplCopyWith(
    _$BodyImpl value,
    $Res Function(_$BodyImpl) then,
  ) = __$$BodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Items? items,
    String? numOfRows,
    String? pageNo,
    String? totalCount,
  });

  @override
  $ItemsCopyWith<$Res>? get items;
}

/// @nodoc
class __$$BodyImplCopyWithImpl<$Res>
    extends _$BodyCopyWithImpl<$Res, _$BodyImpl>
    implements _$$BodyImplCopyWith<$Res> {
  __$$BodyImplCopyWithImpl(_$BodyImpl _value, $Res Function(_$BodyImpl) _then)
    : super(_value, _then);

  /// Create a copy of Body
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
      _$BodyImpl(
        items: freezed == items
            ? _value.items
            : items // ignore: cast_nullable_to_non_nullable
                  as Items?,
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
class _$BodyImpl implements _Body {
  const _$BodyImpl({this.items, this.numOfRows, this.pageNo, this.totalCount});

  factory _$BodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyImplFromJson(json);

  @override
  final Items? items;
  @override
  final String? numOfRows;
  @override
  final String? pageNo;
  @override
  final String? totalCount;

  @override
  String toString() {
    return 'Body(items: $items, numOfRows: $numOfRows, pageNo: $pageNo, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyImpl &&
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

  /// Create a copy of Body
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BodyImplCopyWith<_$BodyImpl> get copyWith =>
      __$$BodyImplCopyWithImpl<_$BodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyImplToJson(this);
  }
}

abstract class _Body implements Body {
  const factory _Body({
    final Items? items,
    final String? numOfRows,
    final String? pageNo,
    final String? totalCount,
  }) = _$BodyImpl;

  factory _Body.fromJson(Map<String, dynamic> json) = _$BodyImpl.fromJson;

  @override
  Items? get items;
  @override
  String? get numOfRows;
  @override
  String? get pageNo;
  @override
  String? get totalCount;

  /// Create a copy of Body
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BodyImplCopyWith<_$BodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return _Items.fromJson(json);
}

/// @nodoc
mixin _$Items {
  List<AbandonmentItem>? get item => throw _privateConstructorUsedError;

  /// Serializes this Items to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemsCopyWith<Items> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemsCopyWith<$Res> {
  factory $ItemsCopyWith(Items value, $Res Function(Items) then) =
      _$ItemsCopyWithImpl<$Res, Items>;
  @useResult
  $Res call({List<AbandonmentItem>? item});
}

/// @nodoc
class _$ItemsCopyWithImpl<$Res, $Val extends Items>
    implements $ItemsCopyWith<$Res> {
  _$ItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = freezed}) {
    return _then(
      _value.copyWith(
            item: freezed == item
                ? _value.item
                : item // ignore: cast_nullable_to_non_nullable
                      as List<AbandonmentItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ItemsImplCopyWith<$Res> implements $ItemsCopyWith<$Res> {
  factory _$$ItemsImplCopyWith(
    _$ItemsImpl value,
    $Res Function(_$ItemsImpl) then,
  ) = __$$ItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AbandonmentItem>? item});
}

/// @nodoc
class __$$ItemsImplCopyWithImpl<$Res>
    extends _$ItemsCopyWithImpl<$Res, _$ItemsImpl>
    implements _$$ItemsImplCopyWith<$Res> {
  __$$ItemsImplCopyWithImpl(
    _$ItemsImpl _value,
    $Res Function(_$ItemsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = freezed}) {
    return _then(
      _$ItemsImpl(
        item: freezed == item
            ? _value._item
            : item // ignore: cast_nullable_to_non_nullable
                  as List<AbandonmentItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemsImpl implements _Items {
  const _$ItemsImpl({final List<AbandonmentItem>? item}) : _item = item;

  factory _$ItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemsImplFromJson(json);

  final List<AbandonmentItem>? _item;
  @override
  List<AbandonmentItem>? get item {
    final value = _item;
    if (value == null) return null;
    if (_item is EqualUnmodifiableListView) return _item;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Items(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemsImpl &&
            const DeepCollectionEquality().equals(other._item, _item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_item));

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemsImplCopyWith<_$ItemsImpl> get copyWith =>
      __$$ItemsImplCopyWithImpl<_$ItemsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemsImplToJson(this);
  }
}

abstract class _Items implements Items {
  const factory _Items({final List<AbandonmentItem>? item}) = _$ItemsImpl;

  factory _Items.fromJson(Map<String, dynamic> json) = _$ItemsImpl.fromJson;

  @override
  List<AbandonmentItem>? get item;

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemsImplCopyWith<_$ItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AbandonmentItem _$AbandonmentItemFromJson(Map<String, dynamic> json) {
  return _AbandonmentItem.fromJson(json);
}

/// @nodoc
mixin _$AbandonmentItem {
  String? get noticeNo => throw _privateConstructorUsedError;
  String? get srvcTxt => throw _privateConstructorUsedError;
  String? get popfile4 => throw _privateConstructorUsedError;
  String? get sprtEDate => throw _privateConstructorUsedError;
  String? get desertionNo => throw _privateConstructorUsedError;
  String? get rfidCd => throw _privateConstructorUsedError;
  String? get happenDt => throw _privateConstructorUsedError;
  String? get happenPlace => throw _privateConstructorUsedError;
  String? get kindCd => throw _privateConstructorUsedError;
  String? get colorCd => throw _privateConstructorUsedError;
  String? get age => throw _privateConstructorUsedError;
  String? get weight => throw _privateConstructorUsedError;
  String? get evntImg => throw _privateConstructorUsedError;
  String? get updTm => throw _privateConstructorUsedError;
  String? get endReason => throw _privateConstructorUsedError;
  String? get careRegNo => throw _privateConstructorUsedError;
  String? get noticeSdt => throw _privateConstructorUsedError;
  String? get noticeEdt => throw _privateConstructorUsedError;
  String? get popfile1 => throw _privateConstructorUsedError;
  String? get processState => throw _privateConstructorUsedError;
  String? get sexCd => throw _privateConstructorUsedError;
  String? get neuterYn => throw _privateConstructorUsedError;
  String? get specialMark => throw _privateConstructorUsedError;
  String? get careNm => throw _privateConstructorUsedError;
  String? get careTel => throw _privateConstructorUsedError;
  String? get careAddr => throw _privateConstructorUsedError;
  String? get orgNm => throw _privateConstructorUsedError;
  String? get sfeSoci => throw _privateConstructorUsedError;
  String? get sfeHealth => throw _privateConstructorUsedError;
  String? get etcBigo => throw _privateConstructorUsedError;
  String? get kindFullNm => throw _privateConstructorUsedError;
  String? get upKindCd => throw _privateConstructorUsedError;
  String? get upKindNm => throw _privateConstructorUsedError;
  String? get kindNm => throw _privateConstructorUsedError;
  String? get popfile2 => throw _privateConstructorUsedError;
  String? get popfile3 => throw _privateConstructorUsedError;
  String? get popfile5 => throw _privateConstructorUsedError;
  String? get popfile6 => throw _privateConstructorUsedError;
  String? get popfile7 => throw _privateConstructorUsedError;
  String? get popfile8 => throw _privateConstructorUsedError;
  String? get careOwnerNm => throw _privateConstructorUsedError;
  String? get vaccinationChk => throw _privateConstructorUsedError;
  String? get healthChk => throw _privateConstructorUsedError;
  String? get adptnTitle => throw _privateConstructorUsedError;
  String? get adptnSDate => throw _privateConstructorUsedError;
  String? get adptnEDate => throw _privateConstructorUsedError;
  String? get adptnConditionLimitTxt => throw _privateConstructorUsedError;
  String? get adptnTxt => throw _privateConstructorUsedError;
  String? get adptnImg => throw _privateConstructorUsedError;
  String? get sprtTitle => throw _privateConstructorUsedError;
  String? get sprtSDate => throw _privateConstructorUsedError;
  String? get sprtConditionLimitTxt => throw _privateConstructorUsedError;
  String? get sprtTxt => throw _privateConstructorUsedError;
  String? get sprtImg => throw _privateConstructorUsedError;
  String? get srvcTitle => throw _privateConstructorUsedError;
  String? get srvcSDate => throw _privateConstructorUsedError;
  String? get srvcEDate => throw _privateConstructorUsedError;
  String? get srvcConditionLimitTxt => throw _privateConstructorUsedError;
  String? get srvcImg => throw _privateConstructorUsedError;
  String? get evntTitle => throw _privateConstructorUsedError;
  String? get evntSDate => throw _privateConstructorUsedError;
  String? get evntEDate => throw _privateConstructorUsedError;
  String? get evntConditionLimitTxt => throw _privateConstructorUsedError;
  String? get evntTxt => throw _privateConstructorUsedError;

  /// Serializes this AbandonmentItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AbandonmentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AbandonmentItemCopyWith<AbandonmentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbandonmentItemCopyWith<$Res> {
  factory $AbandonmentItemCopyWith(
    AbandonmentItem value,
    $Res Function(AbandonmentItem) then,
  ) = _$AbandonmentItemCopyWithImpl<$Res, AbandonmentItem>;
  @useResult
  $Res call({
    String? noticeNo,
    String? srvcTxt,
    String? popfile4,
    String? sprtEDate,
    String? desertionNo,
    String? rfidCd,
    String? happenDt,
    String? happenPlace,
    String? kindCd,
    String? colorCd,
    String? age,
    String? weight,
    String? evntImg,
    String? updTm,
    String? endReason,
    String? careRegNo,
    String? noticeSdt,
    String? noticeEdt,
    String? popfile1,
    String? processState,
    String? sexCd,
    String? neuterYn,
    String? specialMark,
    String? careNm,
    String? careTel,
    String? careAddr,
    String? orgNm,
    String? sfeSoci,
    String? sfeHealth,
    String? etcBigo,
    String? kindFullNm,
    String? upKindCd,
    String? upKindNm,
    String? kindNm,
    String? popfile2,
    String? popfile3,
    String? popfile5,
    String? popfile6,
    String? popfile7,
    String? popfile8,
    String? careOwnerNm,
    String? vaccinationChk,
    String? healthChk,
    String? adptnTitle,
    String? adptnSDate,
    String? adptnEDate,
    String? adptnConditionLimitTxt,
    String? adptnTxt,
    String? adptnImg,
    String? sprtTitle,
    String? sprtSDate,
    String? sprtConditionLimitTxt,
    String? sprtTxt,
    String? sprtImg,
    String? srvcTitle,
    String? srvcSDate,
    String? srvcEDate,
    String? srvcConditionLimitTxt,
    String? srvcImg,
    String? evntTitle,
    String? evntSDate,
    String? evntEDate,
    String? evntConditionLimitTxt,
    String? evntTxt,
  });
}

/// @nodoc
class _$AbandonmentItemCopyWithImpl<$Res, $Val extends AbandonmentItem>
    implements $AbandonmentItemCopyWith<$Res> {
  _$AbandonmentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AbandonmentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noticeNo = freezed,
    Object? srvcTxt = freezed,
    Object? popfile4 = freezed,
    Object? sprtEDate = freezed,
    Object? desertionNo = freezed,
    Object? rfidCd = freezed,
    Object? happenDt = freezed,
    Object? happenPlace = freezed,
    Object? kindCd = freezed,
    Object? colorCd = freezed,
    Object? age = freezed,
    Object? weight = freezed,
    Object? evntImg = freezed,
    Object? updTm = freezed,
    Object? endReason = freezed,
    Object? careRegNo = freezed,
    Object? noticeSdt = freezed,
    Object? noticeEdt = freezed,
    Object? popfile1 = freezed,
    Object? processState = freezed,
    Object? sexCd = freezed,
    Object? neuterYn = freezed,
    Object? specialMark = freezed,
    Object? careNm = freezed,
    Object? careTel = freezed,
    Object? careAddr = freezed,
    Object? orgNm = freezed,
    Object? sfeSoci = freezed,
    Object? sfeHealth = freezed,
    Object? etcBigo = freezed,
    Object? kindFullNm = freezed,
    Object? upKindCd = freezed,
    Object? upKindNm = freezed,
    Object? kindNm = freezed,
    Object? popfile2 = freezed,
    Object? popfile3 = freezed,
    Object? popfile5 = freezed,
    Object? popfile6 = freezed,
    Object? popfile7 = freezed,
    Object? popfile8 = freezed,
    Object? careOwnerNm = freezed,
    Object? vaccinationChk = freezed,
    Object? healthChk = freezed,
    Object? adptnTitle = freezed,
    Object? adptnSDate = freezed,
    Object? adptnEDate = freezed,
    Object? adptnConditionLimitTxt = freezed,
    Object? adptnTxt = freezed,
    Object? adptnImg = freezed,
    Object? sprtTitle = freezed,
    Object? sprtSDate = freezed,
    Object? sprtConditionLimitTxt = freezed,
    Object? sprtTxt = freezed,
    Object? sprtImg = freezed,
    Object? srvcTitle = freezed,
    Object? srvcSDate = freezed,
    Object? srvcEDate = freezed,
    Object? srvcConditionLimitTxt = freezed,
    Object? srvcImg = freezed,
    Object? evntTitle = freezed,
    Object? evntSDate = freezed,
    Object? evntEDate = freezed,
    Object? evntConditionLimitTxt = freezed,
    Object? evntTxt = freezed,
  }) {
    return _then(
      _value.copyWith(
            noticeNo: freezed == noticeNo
                ? _value.noticeNo
                : noticeNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            srvcTxt: freezed == srvcTxt
                ? _value.srvcTxt
                : srvcTxt // ignore: cast_nullable_to_non_nullable
                      as String?,
            popfile4: freezed == popfile4
                ? _value.popfile4
                : popfile4 // ignore: cast_nullable_to_non_nullable
                      as String?,
            sprtEDate: freezed == sprtEDate
                ? _value.sprtEDate
                : sprtEDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            desertionNo: freezed == desertionNo
                ? _value.desertionNo
                : desertionNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            rfidCd: freezed == rfidCd
                ? _value.rfidCd
                : rfidCd // ignore: cast_nullable_to_non_nullable
                      as String?,
            happenDt: freezed == happenDt
                ? _value.happenDt
                : happenDt // ignore: cast_nullable_to_non_nullable
                      as String?,
            happenPlace: freezed == happenPlace
                ? _value.happenPlace
                : happenPlace // ignore: cast_nullable_to_non_nullable
                      as String?,
            kindCd: freezed == kindCd
                ? _value.kindCd
                : kindCd // ignore: cast_nullable_to_non_nullable
                      as String?,
            colorCd: freezed == colorCd
                ? _value.colorCd
                : colorCd // ignore: cast_nullable_to_non_nullable
                      as String?,
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as String?,
            weight: freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as String?,
            evntImg: freezed == evntImg
                ? _value.evntImg
                : evntImg // ignore: cast_nullable_to_non_nullable
                      as String?,
            updTm: freezed == updTm
                ? _value.updTm
                : updTm // ignore: cast_nullable_to_non_nullable
                      as String?,
            endReason: freezed == endReason
                ? _value.endReason
                : endReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            careRegNo: freezed == careRegNo
                ? _value.careRegNo
                : careRegNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            noticeSdt: freezed == noticeSdt
                ? _value.noticeSdt
                : noticeSdt // ignore: cast_nullable_to_non_nullable
                      as String?,
            noticeEdt: freezed == noticeEdt
                ? _value.noticeEdt
                : noticeEdt // ignore: cast_nullable_to_non_nullable
                      as String?,
            popfile1: freezed == popfile1
                ? _value.popfile1
                : popfile1 // ignore: cast_nullable_to_non_nullable
                      as String?,
            processState: freezed == processState
                ? _value.processState
                : processState // ignore: cast_nullable_to_non_nullable
                      as String?,
            sexCd: freezed == sexCd
                ? _value.sexCd
                : sexCd // ignore: cast_nullable_to_non_nullable
                      as String?,
            neuterYn: freezed == neuterYn
                ? _value.neuterYn
                : neuterYn // ignore: cast_nullable_to_non_nullable
                      as String?,
            specialMark: freezed == specialMark
                ? _value.specialMark
                : specialMark // ignore: cast_nullable_to_non_nullable
                      as String?,
            careNm: freezed == careNm
                ? _value.careNm
                : careNm // ignore: cast_nullable_to_non_nullable
                      as String?,
            careTel: freezed == careTel
                ? _value.careTel
                : careTel // ignore: cast_nullable_to_non_nullable
                      as String?,
            careAddr: freezed == careAddr
                ? _value.careAddr
                : careAddr // ignore: cast_nullable_to_non_nullable
                      as String?,
            orgNm: freezed == orgNm
                ? _value.orgNm
                : orgNm // ignore: cast_nullable_to_non_nullable
                      as String?,
            sfeSoci: freezed == sfeSoci
                ? _value.sfeSoci
                : sfeSoci // ignore: cast_nullable_to_non_nullable
                      as String?,
            sfeHealth: freezed == sfeHealth
                ? _value.sfeHealth
                : sfeHealth // ignore: cast_nullable_to_non_nullable
                      as String?,
            etcBigo: freezed == etcBigo
                ? _value.etcBigo
                : etcBigo // ignore: cast_nullable_to_non_nullable
                      as String?,
            kindFullNm: freezed == kindFullNm
                ? _value.kindFullNm
                : kindFullNm // ignore: cast_nullable_to_non_nullable
                      as String?,
            upKindCd: freezed == upKindCd
                ? _value.upKindCd
                : upKindCd // ignore: cast_nullable_to_non_nullable
                      as String?,
            upKindNm: freezed == upKindNm
                ? _value.upKindNm
                : upKindNm // ignore: cast_nullable_to_non_nullable
                      as String?,
            kindNm: freezed == kindNm
                ? _value.kindNm
                : kindNm // ignore: cast_nullable_to_non_nullable
                      as String?,
            popfile2: freezed == popfile2
                ? _value.popfile2
                : popfile2 // ignore: cast_nullable_to_non_nullable
                      as String?,
            popfile3: freezed == popfile3
                ? _value.popfile3
                : popfile3 // ignore: cast_nullable_to_non_nullable
                      as String?,
            popfile5: freezed == popfile5
                ? _value.popfile5
                : popfile5 // ignore: cast_nullable_to_non_nullable
                      as String?,
            popfile6: freezed == popfile6
                ? _value.popfile6
                : popfile6 // ignore: cast_nullable_to_non_nullable
                      as String?,
            popfile7: freezed == popfile7
                ? _value.popfile7
                : popfile7 // ignore: cast_nullable_to_non_nullable
                      as String?,
            popfile8: freezed == popfile8
                ? _value.popfile8
                : popfile8 // ignore: cast_nullable_to_non_nullable
                      as String?,
            careOwnerNm: freezed == careOwnerNm
                ? _value.careOwnerNm
                : careOwnerNm // ignore: cast_nullable_to_non_nullable
                      as String?,
            vaccinationChk: freezed == vaccinationChk
                ? _value.vaccinationChk
                : vaccinationChk // ignore: cast_nullable_to_non_nullable
                      as String?,
            healthChk: freezed == healthChk
                ? _value.healthChk
                : healthChk // ignore: cast_nullable_to_non_nullable
                      as String?,
            adptnTitle: freezed == adptnTitle
                ? _value.adptnTitle
                : adptnTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            adptnSDate: freezed == adptnSDate
                ? _value.adptnSDate
                : adptnSDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            adptnEDate: freezed == adptnEDate
                ? _value.adptnEDate
                : adptnEDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            adptnConditionLimitTxt: freezed == adptnConditionLimitTxt
                ? _value.adptnConditionLimitTxt
                : adptnConditionLimitTxt // ignore: cast_nullable_to_non_nullable
                      as String?,
            adptnTxt: freezed == adptnTxt
                ? _value.adptnTxt
                : adptnTxt // ignore: cast_nullable_to_non_nullable
                      as String?,
            adptnImg: freezed == adptnImg
                ? _value.adptnImg
                : adptnImg // ignore: cast_nullable_to_non_nullable
                      as String?,
            sprtTitle: freezed == sprtTitle
                ? _value.sprtTitle
                : sprtTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            sprtSDate: freezed == sprtSDate
                ? _value.sprtSDate
                : sprtSDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            sprtConditionLimitTxt: freezed == sprtConditionLimitTxt
                ? _value.sprtConditionLimitTxt
                : sprtConditionLimitTxt // ignore: cast_nullable_to_non_nullable
                      as String?,
            sprtTxt: freezed == sprtTxt
                ? _value.sprtTxt
                : sprtTxt // ignore: cast_nullable_to_non_nullable
                      as String?,
            sprtImg: freezed == sprtImg
                ? _value.sprtImg
                : sprtImg // ignore: cast_nullable_to_non_nullable
                      as String?,
            srvcTitle: freezed == srvcTitle
                ? _value.srvcTitle
                : srvcTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            srvcSDate: freezed == srvcSDate
                ? _value.srvcSDate
                : srvcSDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            srvcEDate: freezed == srvcEDate
                ? _value.srvcEDate
                : srvcEDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            srvcConditionLimitTxt: freezed == srvcConditionLimitTxt
                ? _value.srvcConditionLimitTxt
                : srvcConditionLimitTxt // ignore: cast_nullable_to_non_nullable
                      as String?,
            srvcImg: freezed == srvcImg
                ? _value.srvcImg
                : srvcImg // ignore: cast_nullable_to_non_nullable
                      as String?,
            evntTitle: freezed == evntTitle
                ? _value.evntTitle
                : evntTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            evntSDate: freezed == evntSDate
                ? _value.evntSDate
                : evntSDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            evntEDate: freezed == evntEDate
                ? _value.evntEDate
                : evntEDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            evntConditionLimitTxt: freezed == evntConditionLimitTxt
                ? _value.evntConditionLimitTxt
                : evntConditionLimitTxt // ignore: cast_nullable_to_non_nullable
                      as String?,
            evntTxt: freezed == evntTxt
                ? _value.evntTxt
                : evntTxt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AbandonmentItemImplCopyWith<$Res>
    implements $AbandonmentItemCopyWith<$Res> {
  factory _$$AbandonmentItemImplCopyWith(
    _$AbandonmentItemImpl value,
    $Res Function(_$AbandonmentItemImpl) then,
  ) = __$$AbandonmentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? noticeNo,
    String? srvcTxt,
    String? popfile4,
    String? sprtEDate,
    String? desertionNo,
    String? rfidCd,
    String? happenDt,
    String? happenPlace,
    String? kindCd,
    String? colorCd,
    String? age,
    String? weight,
    String? evntImg,
    String? updTm,
    String? endReason,
    String? careRegNo,
    String? noticeSdt,
    String? noticeEdt,
    String? popfile1,
    String? processState,
    String? sexCd,
    String? neuterYn,
    String? specialMark,
    String? careNm,
    String? careTel,
    String? careAddr,
    String? orgNm,
    String? sfeSoci,
    String? sfeHealth,
    String? etcBigo,
    String? kindFullNm,
    String? upKindCd,
    String? upKindNm,
    String? kindNm,
    String? popfile2,
    String? popfile3,
    String? popfile5,
    String? popfile6,
    String? popfile7,
    String? popfile8,
    String? careOwnerNm,
    String? vaccinationChk,
    String? healthChk,
    String? adptnTitle,
    String? adptnSDate,
    String? adptnEDate,
    String? adptnConditionLimitTxt,
    String? adptnTxt,
    String? adptnImg,
    String? sprtTitle,
    String? sprtSDate,
    String? sprtConditionLimitTxt,
    String? sprtTxt,
    String? sprtImg,
    String? srvcTitle,
    String? srvcSDate,
    String? srvcEDate,
    String? srvcConditionLimitTxt,
    String? srvcImg,
    String? evntTitle,
    String? evntSDate,
    String? evntEDate,
    String? evntConditionLimitTxt,
    String? evntTxt,
  });
}

/// @nodoc
class __$$AbandonmentItemImplCopyWithImpl<$Res>
    extends _$AbandonmentItemCopyWithImpl<$Res, _$AbandonmentItemImpl>
    implements _$$AbandonmentItemImplCopyWith<$Res> {
  __$$AbandonmentItemImplCopyWithImpl(
    _$AbandonmentItemImpl _value,
    $Res Function(_$AbandonmentItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AbandonmentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noticeNo = freezed,
    Object? srvcTxt = freezed,
    Object? popfile4 = freezed,
    Object? sprtEDate = freezed,
    Object? desertionNo = freezed,
    Object? rfidCd = freezed,
    Object? happenDt = freezed,
    Object? happenPlace = freezed,
    Object? kindCd = freezed,
    Object? colorCd = freezed,
    Object? age = freezed,
    Object? weight = freezed,
    Object? evntImg = freezed,
    Object? updTm = freezed,
    Object? endReason = freezed,
    Object? careRegNo = freezed,
    Object? noticeSdt = freezed,
    Object? noticeEdt = freezed,
    Object? popfile1 = freezed,
    Object? processState = freezed,
    Object? sexCd = freezed,
    Object? neuterYn = freezed,
    Object? specialMark = freezed,
    Object? careNm = freezed,
    Object? careTel = freezed,
    Object? careAddr = freezed,
    Object? orgNm = freezed,
    Object? sfeSoci = freezed,
    Object? sfeHealth = freezed,
    Object? etcBigo = freezed,
    Object? kindFullNm = freezed,
    Object? upKindCd = freezed,
    Object? upKindNm = freezed,
    Object? kindNm = freezed,
    Object? popfile2 = freezed,
    Object? popfile3 = freezed,
    Object? popfile5 = freezed,
    Object? popfile6 = freezed,
    Object? popfile7 = freezed,
    Object? popfile8 = freezed,
    Object? careOwnerNm = freezed,
    Object? vaccinationChk = freezed,
    Object? healthChk = freezed,
    Object? adptnTitle = freezed,
    Object? adptnSDate = freezed,
    Object? adptnEDate = freezed,
    Object? adptnConditionLimitTxt = freezed,
    Object? adptnTxt = freezed,
    Object? adptnImg = freezed,
    Object? sprtTitle = freezed,
    Object? sprtSDate = freezed,
    Object? sprtConditionLimitTxt = freezed,
    Object? sprtTxt = freezed,
    Object? sprtImg = freezed,
    Object? srvcTitle = freezed,
    Object? srvcSDate = freezed,
    Object? srvcEDate = freezed,
    Object? srvcConditionLimitTxt = freezed,
    Object? srvcImg = freezed,
    Object? evntTitle = freezed,
    Object? evntSDate = freezed,
    Object? evntEDate = freezed,
    Object? evntConditionLimitTxt = freezed,
    Object? evntTxt = freezed,
  }) {
    return _then(
      _$AbandonmentItemImpl(
        noticeNo: freezed == noticeNo
            ? _value.noticeNo
            : noticeNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        srvcTxt: freezed == srvcTxt
            ? _value.srvcTxt
            : srvcTxt // ignore: cast_nullable_to_non_nullable
                  as String?,
        popfile4: freezed == popfile4
            ? _value.popfile4
            : popfile4 // ignore: cast_nullable_to_non_nullable
                  as String?,
        sprtEDate: freezed == sprtEDate
            ? _value.sprtEDate
            : sprtEDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        desertionNo: freezed == desertionNo
            ? _value.desertionNo
            : desertionNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        rfidCd: freezed == rfidCd
            ? _value.rfidCd
            : rfidCd // ignore: cast_nullable_to_non_nullable
                  as String?,
        happenDt: freezed == happenDt
            ? _value.happenDt
            : happenDt // ignore: cast_nullable_to_non_nullable
                  as String?,
        happenPlace: freezed == happenPlace
            ? _value.happenPlace
            : happenPlace // ignore: cast_nullable_to_non_nullable
                  as String?,
        kindCd: freezed == kindCd
            ? _value.kindCd
            : kindCd // ignore: cast_nullable_to_non_nullable
                  as String?,
        colorCd: freezed == colorCd
            ? _value.colorCd
            : colorCd // ignore: cast_nullable_to_non_nullable
                  as String?,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as String?,
        weight: freezed == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as String?,
        evntImg: freezed == evntImg
            ? _value.evntImg
            : evntImg // ignore: cast_nullable_to_non_nullable
                  as String?,
        updTm: freezed == updTm
            ? _value.updTm
            : updTm // ignore: cast_nullable_to_non_nullable
                  as String?,
        endReason: freezed == endReason
            ? _value.endReason
            : endReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        careRegNo: freezed == careRegNo
            ? _value.careRegNo
            : careRegNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        noticeSdt: freezed == noticeSdt
            ? _value.noticeSdt
            : noticeSdt // ignore: cast_nullable_to_non_nullable
                  as String?,
        noticeEdt: freezed == noticeEdt
            ? _value.noticeEdt
            : noticeEdt // ignore: cast_nullable_to_non_nullable
                  as String?,
        popfile1: freezed == popfile1
            ? _value.popfile1
            : popfile1 // ignore: cast_nullable_to_non_nullable
                  as String?,
        processState: freezed == processState
            ? _value.processState
            : processState // ignore: cast_nullable_to_non_nullable
                  as String?,
        sexCd: freezed == sexCd
            ? _value.sexCd
            : sexCd // ignore: cast_nullable_to_non_nullable
                  as String?,
        neuterYn: freezed == neuterYn
            ? _value.neuterYn
            : neuterYn // ignore: cast_nullable_to_non_nullable
                  as String?,
        specialMark: freezed == specialMark
            ? _value.specialMark
            : specialMark // ignore: cast_nullable_to_non_nullable
                  as String?,
        careNm: freezed == careNm
            ? _value.careNm
            : careNm // ignore: cast_nullable_to_non_nullable
                  as String?,
        careTel: freezed == careTel
            ? _value.careTel
            : careTel // ignore: cast_nullable_to_non_nullable
                  as String?,
        careAddr: freezed == careAddr
            ? _value.careAddr
            : careAddr // ignore: cast_nullable_to_non_nullable
                  as String?,
        orgNm: freezed == orgNm
            ? _value.orgNm
            : orgNm // ignore: cast_nullable_to_non_nullable
                  as String?,
        sfeSoci: freezed == sfeSoci
            ? _value.sfeSoci
            : sfeSoci // ignore: cast_nullable_to_non_nullable
                  as String?,
        sfeHealth: freezed == sfeHealth
            ? _value.sfeHealth
            : sfeHealth // ignore: cast_nullable_to_non_nullable
                  as String?,
        etcBigo: freezed == etcBigo
            ? _value.etcBigo
            : etcBigo // ignore: cast_nullable_to_non_nullable
                  as String?,
        kindFullNm: freezed == kindFullNm
            ? _value.kindFullNm
            : kindFullNm // ignore: cast_nullable_to_non_nullable
                  as String?,
        upKindCd: freezed == upKindCd
            ? _value.upKindCd
            : upKindCd // ignore: cast_nullable_to_non_nullable
                  as String?,
        upKindNm: freezed == upKindNm
            ? _value.upKindNm
            : upKindNm // ignore: cast_nullable_to_non_nullable
                  as String?,
        kindNm: freezed == kindNm
            ? _value.kindNm
            : kindNm // ignore: cast_nullable_to_non_nullable
                  as String?,
        popfile2: freezed == popfile2
            ? _value.popfile2
            : popfile2 // ignore: cast_nullable_to_non_nullable
                  as String?,
        popfile3: freezed == popfile3
            ? _value.popfile3
            : popfile3 // ignore: cast_nullable_to_non_nullable
                  as String?,
        popfile5: freezed == popfile5
            ? _value.popfile5
            : popfile5 // ignore: cast_nullable_to_non_nullable
                  as String?,
        popfile6: freezed == popfile6
            ? _value.popfile6
            : popfile6 // ignore: cast_nullable_to_non_nullable
                  as String?,
        popfile7: freezed == popfile7
            ? _value.popfile7
            : popfile7 // ignore: cast_nullable_to_non_nullable
                  as String?,
        popfile8: freezed == popfile8
            ? _value.popfile8
            : popfile8 // ignore: cast_nullable_to_non_nullable
                  as String?,
        careOwnerNm: freezed == careOwnerNm
            ? _value.careOwnerNm
            : careOwnerNm // ignore: cast_nullable_to_non_nullable
                  as String?,
        vaccinationChk: freezed == vaccinationChk
            ? _value.vaccinationChk
            : vaccinationChk // ignore: cast_nullable_to_non_nullable
                  as String?,
        healthChk: freezed == healthChk
            ? _value.healthChk
            : healthChk // ignore: cast_nullable_to_non_nullable
                  as String?,
        adptnTitle: freezed == adptnTitle
            ? _value.adptnTitle
            : adptnTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        adptnSDate: freezed == adptnSDate
            ? _value.adptnSDate
            : adptnSDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        adptnEDate: freezed == adptnEDate
            ? _value.adptnEDate
            : adptnEDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        adptnConditionLimitTxt: freezed == adptnConditionLimitTxt
            ? _value.adptnConditionLimitTxt
            : adptnConditionLimitTxt // ignore: cast_nullable_to_non_nullable
                  as String?,
        adptnTxt: freezed == adptnTxt
            ? _value.adptnTxt
            : adptnTxt // ignore: cast_nullable_to_non_nullable
                  as String?,
        adptnImg: freezed == adptnImg
            ? _value.adptnImg
            : adptnImg // ignore: cast_nullable_to_non_nullable
                  as String?,
        sprtTitle: freezed == sprtTitle
            ? _value.sprtTitle
            : sprtTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        sprtSDate: freezed == sprtSDate
            ? _value.sprtSDate
            : sprtSDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        sprtConditionLimitTxt: freezed == sprtConditionLimitTxt
            ? _value.sprtConditionLimitTxt
            : sprtConditionLimitTxt // ignore: cast_nullable_to_non_nullable
                  as String?,
        sprtTxt: freezed == sprtTxt
            ? _value.sprtTxt
            : sprtTxt // ignore: cast_nullable_to_non_nullable
                  as String?,
        sprtImg: freezed == sprtImg
            ? _value.sprtImg
            : sprtImg // ignore: cast_nullable_to_non_nullable
                  as String?,
        srvcTitle: freezed == srvcTitle
            ? _value.srvcTitle
            : srvcTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        srvcSDate: freezed == srvcSDate
            ? _value.srvcSDate
            : srvcSDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        srvcEDate: freezed == srvcEDate
            ? _value.srvcEDate
            : srvcEDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        srvcConditionLimitTxt: freezed == srvcConditionLimitTxt
            ? _value.srvcConditionLimitTxt
            : srvcConditionLimitTxt // ignore: cast_nullable_to_non_nullable
                  as String?,
        srvcImg: freezed == srvcImg
            ? _value.srvcImg
            : srvcImg // ignore: cast_nullable_to_non_nullable
                  as String?,
        evntTitle: freezed == evntTitle
            ? _value.evntTitle
            : evntTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        evntSDate: freezed == evntSDate
            ? _value.evntSDate
            : evntSDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        evntEDate: freezed == evntEDate
            ? _value.evntEDate
            : evntEDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        evntConditionLimitTxt: freezed == evntConditionLimitTxt
            ? _value.evntConditionLimitTxt
            : evntConditionLimitTxt // ignore: cast_nullable_to_non_nullable
                  as String?,
        evntTxt: freezed == evntTxt
            ? _value.evntTxt
            : evntTxt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AbandonmentItemImpl implements _AbandonmentItem {
  const _$AbandonmentItemImpl({
    this.noticeNo,
    this.srvcTxt,
    this.popfile4,
    this.sprtEDate,
    this.desertionNo,
    this.rfidCd,
    this.happenDt,
    this.happenPlace,
    this.kindCd,
    this.colorCd,
    this.age,
    this.weight,
    this.evntImg,
    this.updTm,
    this.endReason,
    this.careRegNo,
    this.noticeSdt,
    this.noticeEdt,
    this.popfile1,
    this.processState,
    this.sexCd,
    this.neuterYn,
    this.specialMark,
    this.careNm,
    this.careTel,
    this.careAddr,
    this.orgNm,
    this.sfeSoci,
    this.sfeHealth,
    this.etcBigo,
    this.kindFullNm,
    this.upKindCd,
    this.upKindNm,
    this.kindNm,
    this.popfile2,
    this.popfile3,
    this.popfile5,
    this.popfile6,
    this.popfile7,
    this.popfile8,
    this.careOwnerNm,
    this.vaccinationChk,
    this.healthChk,
    this.adptnTitle,
    this.adptnSDate,
    this.adptnEDate,
    this.adptnConditionLimitTxt,
    this.adptnTxt,
    this.adptnImg,
    this.sprtTitle,
    this.sprtSDate,
    this.sprtConditionLimitTxt,
    this.sprtTxt,
    this.sprtImg,
    this.srvcTitle,
    this.srvcSDate,
    this.srvcEDate,
    this.srvcConditionLimitTxt,
    this.srvcImg,
    this.evntTitle,
    this.evntSDate,
    this.evntEDate,
    this.evntConditionLimitTxt,
    this.evntTxt,
  });

  factory _$AbandonmentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbandonmentItemImplFromJson(json);

  @override
  final String? noticeNo;
  @override
  final String? srvcTxt;
  @override
  final String? popfile4;
  @override
  final String? sprtEDate;
  @override
  final String? desertionNo;
  @override
  final String? rfidCd;
  @override
  final String? happenDt;
  @override
  final String? happenPlace;
  @override
  final String? kindCd;
  @override
  final String? colorCd;
  @override
  final String? age;
  @override
  final String? weight;
  @override
  final String? evntImg;
  @override
  final String? updTm;
  @override
  final String? endReason;
  @override
  final String? careRegNo;
  @override
  final String? noticeSdt;
  @override
  final String? noticeEdt;
  @override
  final String? popfile1;
  @override
  final String? processState;
  @override
  final String? sexCd;
  @override
  final String? neuterYn;
  @override
  final String? specialMark;
  @override
  final String? careNm;
  @override
  final String? careTel;
  @override
  final String? careAddr;
  @override
  final String? orgNm;
  @override
  final String? sfeSoci;
  @override
  final String? sfeHealth;
  @override
  final String? etcBigo;
  @override
  final String? kindFullNm;
  @override
  final String? upKindCd;
  @override
  final String? upKindNm;
  @override
  final String? kindNm;
  @override
  final String? popfile2;
  @override
  final String? popfile3;
  @override
  final String? popfile5;
  @override
  final String? popfile6;
  @override
  final String? popfile7;
  @override
  final String? popfile8;
  @override
  final String? careOwnerNm;
  @override
  final String? vaccinationChk;
  @override
  final String? healthChk;
  @override
  final String? adptnTitle;
  @override
  final String? adptnSDate;
  @override
  final String? adptnEDate;
  @override
  final String? adptnConditionLimitTxt;
  @override
  final String? adptnTxt;
  @override
  final String? adptnImg;
  @override
  final String? sprtTitle;
  @override
  final String? sprtSDate;
  @override
  final String? sprtConditionLimitTxt;
  @override
  final String? sprtTxt;
  @override
  final String? sprtImg;
  @override
  final String? srvcTitle;
  @override
  final String? srvcSDate;
  @override
  final String? srvcEDate;
  @override
  final String? srvcConditionLimitTxt;
  @override
  final String? srvcImg;
  @override
  final String? evntTitle;
  @override
  final String? evntSDate;
  @override
  final String? evntEDate;
  @override
  final String? evntConditionLimitTxt;
  @override
  final String? evntTxt;

  @override
  String toString() {
    return 'AbandonmentItem(noticeNo: $noticeNo, srvcTxt: $srvcTxt, popfile4: $popfile4, sprtEDate: $sprtEDate, desertionNo: $desertionNo, rfidCd: $rfidCd, happenDt: $happenDt, happenPlace: $happenPlace, kindCd: $kindCd, colorCd: $colorCd, age: $age, weight: $weight, evntImg: $evntImg, updTm: $updTm, endReason: $endReason, careRegNo: $careRegNo, noticeSdt: $noticeSdt, noticeEdt: $noticeEdt, popfile1: $popfile1, processState: $processState, sexCd: $sexCd, neuterYn: $neuterYn, specialMark: $specialMark, careNm: $careNm, careTel: $careTel, careAddr: $careAddr, orgNm: $orgNm, sfeSoci: $sfeSoci, sfeHealth: $sfeHealth, etcBigo: $etcBigo, kindFullNm: $kindFullNm, upKindCd: $upKindCd, upKindNm: $upKindNm, kindNm: $kindNm, popfile2: $popfile2, popfile3: $popfile3, popfile5: $popfile5, popfile6: $popfile6, popfile7: $popfile7, popfile8: $popfile8, careOwnerNm: $careOwnerNm, vaccinationChk: $vaccinationChk, healthChk: $healthChk, adptnTitle: $adptnTitle, adptnSDate: $adptnSDate, adptnEDate: $adptnEDate, adptnConditionLimitTxt: $adptnConditionLimitTxt, adptnTxt: $adptnTxt, adptnImg: $adptnImg, sprtTitle: $sprtTitle, sprtSDate: $sprtSDate, sprtConditionLimitTxt: $sprtConditionLimitTxt, sprtTxt: $sprtTxt, sprtImg: $sprtImg, srvcTitle: $srvcTitle, srvcSDate: $srvcSDate, srvcEDate: $srvcEDate, srvcConditionLimitTxt: $srvcConditionLimitTxt, srvcImg: $srvcImg, evntTitle: $evntTitle, evntSDate: $evntSDate, evntEDate: $evntEDate, evntConditionLimitTxt: $evntConditionLimitTxt, evntTxt: $evntTxt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbandonmentItemImpl &&
            (identical(other.noticeNo, noticeNo) ||
                other.noticeNo == noticeNo) &&
            (identical(other.srvcTxt, srvcTxt) || other.srvcTxt == srvcTxt) &&
            (identical(other.popfile4, popfile4) ||
                other.popfile4 == popfile4) &&
            (identical(other.sprtEDate, sprtEDate) ||
                other.sprtEDate == sprtEDate) &&
            (identical(other.desertionNo, desertionNo) ||
                other.desertionNo == desertionNo) &&
            (identical(other.rfidCd, rfidCd) || other.rfidCd == rfidCd) &&
            (identical(other.happenDt, happenDt) ||
                other.happenDt == happenDt) &&
            (identical(other.happenPlace, happenPlace) ||
                other.happenPlace == happenPlace) &&
            (identical(other.kindCd, kindCd) || other.kindCd == kindCd) &&
            (identical(other.colorCd, colorCd) || other.colorCd == colorCd) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.evntImg, evntImg) || other.evntImg == evntImg) &&
            (identical(other.updTm, updTm) || other.updTm == updTm) &&
            (identical(other.endReason, endReason) ||
                other.endReason == endReason) &&
            (identical(other.careRegNo, careRegNo) ||
                other.careRegNo == careRegNo) &&
            (identical(other.noticeSdt, noticeSdt) ||
                other.noticeSdt == noticeSdt) &&
            (identical(other.noticeEdt, noticeEdt) ||
                other.noticeEdt == noticeEdt) &&
            (identical(other.popfile1, popfile1) ||
                other.popfile1 == popfile1) &&
            (identical(other.processState, processState) ||
                other.processState == processState) &&
            (identical(other.sexCd, sexCd) || other.sexCd == sexCd) &&
            (identical(other.neuterYn, neuterYn) ||
                other.neuterYn == neuterYn) &&
            (identical(other.specialMark, specialMark) ||
                other.specialMark == specialMark) &&
            (identical(other.careNm, careNm) || other.careNm == careNm) &&
            (identical(other.careTel, careTel) || other.careTel == careTel) &&
            (identical(other.careAddr, careAddr) ||
                other.careAddr == careAddr) &&
            (identical(other.orgNm, orgNm) || other.orgNm == orgNm) &&
            (identical(other.sfeSoci, sfeSoci) || other.sfeSoci == sfeSoci) &&
            (identical(other.sfeHealth, sfeHealth) ||
                other.sfeHealth == sfeHealth) &&
            (identical(other.etcBigo, etcBigo) || other.etcBigo == etcBigo) &&
            (identical(other.kindFullNm, kindFullNm) ||
                other.kindFullNm == kindFullNm) &&
            (identical(other.upKindCd, upKindCd) ||
                other.upKindCd == upKindCd) &&
            (identical(other.upKindNm, upKindNm) ||
                other.upKindNm == upKindNm) &&
            (identical(other.kindNm, kindNm) || other.kindNm == kindNm) &&
            (identical(other.popfile2, popfile2) ||
                other.popfile2 == popfile2) &&
            (identical(other.popfile3, popfile3) ||
                other.popfile3 == popfile3) &&
            (identical(other.popfile5, popfile5) ||
                other.popfile5 == popfile5) &&
            (identical(other.popfile6, popfile6) ||
                other.popfile6 == popfile6) &&
            (identical(other.popfile7, popfile7) ||
                other.popfile7 == popfile7) &&
            (identical(other.popfile8, popfile8) ||
                other.popfile8 == popfile8) &&
            (identical(other.careOwnerNm, careOwnerNm) ||
                other.careOwnerNm == careOwnerNm) &&
            (identical(other.vaccinationChk, vaccinationChk) ||
                other.vaccinationChk == vaccinationChk) &&
            (identical(other.healthChk, healthChk) ||
                other.healthChk == healthChk) &&
            (identical(other.adptnTitle, adptnTitle) ||
                other.adptnTitle == adptnTitle) &&
            (identical(other.adptnSDate, adptnSDate) ||
                other.adptnSDate == adptnSDate) &&
            (identical(other.adptnEDate, adptnEDate) ||
                other.adptnEDate == adptnEDate) &&
            (identical(other.adptnConditionLimitTxt, adptnConditionLimitTxt) ||
                other.adptnConditionLimitTxt == adptnConditionLimitTxt) &&
            (identical(other.adptnTxt, adptnTxt) ||
                other.adptnTxt == adptnTxt) &&
            (identical(other.adptnImg, adptnImg) ||
                other.adptnImg == adptnImg) &&
            (identical(other.sprtTitle, sprtTitle) ||
                other.sprtTitle == sprtTitle) &&
            (identical(other.sprtSDate, sprtSDate) ||
                other.sprtSDate == sprtSDate) &&
            (identical(other.sprtConditionLimitTxt, sprtConditionLimitTxt) ||
                other.sprtConditionLimitTxt == sprtConditionLimitTxt) &&
            (identical(other.sprtTxt, sprtTxt) || other.sprtTxt == sprtTxt) &&
            (identical(other.sprtImg, sprtImg) || other.sprtImg == sprtImg) &&
            (identical(other.srvcTitle, srvcTitle) ||
                other.srvcTitle == srvcTitle) &&
            (identical(other.srvcSDate, srvcSDate) ||
                other.srvcSDate == srvcSDate) &&
            (identical(other.srvcEDate, srvcEDate) ||
                other.srvcEDate == srvcEDate) &&
            (identical(other.srvcConditionLimitTxt, srvcConditionLimitTxt) ||
                other.srvcConditionLimitTxt == srvcConditionLimitTxt) &&
            (identical(other.srvcImg, srvcImg) || other.srvcImg == srvcImg) &&
            (identical(other.evntTitle, evntTitle) ||
                other.evntTitle == evntTitle) &&
            (identical(other.evntSDate, evntSDate) ||
                other.evntSDate == evntSDate) &&
            (identical(other.evntEDate, evntEDate) ||
                other.evntEDate == evntEDate) &&
            (identical(other.evntConditionLimitTxt, evntConditionLimitTxt) ||
                other.evntConditionLimitTxt == evntConditionLimitTxt) &&
            (identical(other.evntTxt, evntTxt) || other.evntTxt == evntTxt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    noticeNo,
    srvcTxt,
    popfile4,
    sprtEDate,
    desertionNo,
    rfidCd,
    happenDt,
    happenPlace,
    kindCd,
    colorCd,
    age,
    weight,
    evntImg,
    updTm,
    endReason,
    careRegNo,
    noticeSdt,
    noticeEdt,
    popfile1,
    processState,
    sexCd,
    neuterYn,
    specialMark,
    careNm,
    careTel,
    careAddr,
    orgNm,
    sfeSoci,
    sfeHealth,
    etcBigo,
    kindFullNm,
    upKindCd,
    upKindNm,
    kindNm,
    popfile2,
    popfile3,
    popfile5,
    popfile6,
    popfile7,
    popfile8,
    careOwnerNm,
    vaccinationChk,
    healthChk,
    adptnTitle,
    adptnSDate,
    adptnEDate,
    adptnConditionLimitTxt,
    adptnTxt,
    adptnImg,
    sprtTitle,
    sprtSDate,
    sprtConditionLimitTxt,
    sprtTxt,
    sprtImg,
    srvcTitle,
    srvcSDate,
    srvcEDate,
    srvcConditionLimitTxt,
    srvcImg,
    evntTitle,
    evntSDate,
    evntEDate,
    evntConditionLimitTxt,
    evntTxt,
  ]);

  /// Create a copy of AbandonmentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbandonmentItemImplCopyWith<_$AbandonmentItemImpl> get copyWith =>
      __$$AbandonmentItemImplCopyWithImpl<_$AbandonmentItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AbandonmentItemImplToJson(this);
  }
}

abstract class _AbandonmentItem implements AbandonmentItem {
  const factory _AbandonmentItem({
    final String? noticeNo,
    final String? srvcTxt,
    final String? popfile4,
    final String? sprtEDate,
    final String? desertionNo,
    final String? rfidCd,
    final String? happenDt,
    final String? happenPlace,
    final String? kindCd,
    final String? colorCd,
    final String? age,
    final String? weight,
    final String? evntImg,
    final String? updTm,
    final String? endReason,
    final String? careRegNo,
    final String? noticeSdt,
    final String? noticeEdt,
    final String? popfile1,
    final String? processState,
    final String? sexCd,
    final String? neuterYn,
    final String? specialMark,
    final String? careNm,
    final String? careTel,
    final String? careAddr,
    final String? orgNm,
    final String? sfeSoci,
    final String? sfeHealth,
    final String? etcBigo,
    final String? kindFullNm,
    final String? upKindCd,
    final String? upKindNm,
    final String? kindNm,
    final String? popfile2,
    final String? popfile3,
    final String? popfile5,
    final String? popfile6,
    final String? popfile7,
    final String? popfile8,
    final String? careOwnerNm,
    final String? vaccinationChk,
    final String? healthChk,
    final String? adptnTitle,
    final String? adptnSDate,
    final String? adptnEDate,
    final String? adptnConditionLimitTxt,
    final String? adptnTxt,
    final String? adptnImg,
    final String? sprtTitle,
    final String? sprtSDate,
    final String? sprtConditionLimitTxt,
    final String? sprtTxt,
    final String? sprtImg,
    final String? srvcTitle,
    final String? srvcSDate,
    final String? srvcEDate,
    final String? srvcConditionLimitTxt,
    final String? srvcImg,
    final String? evntTitle,
    final String? evntSDate,
    final String? evntEDate,
    final String? evntConditionLimitTxt,
    final String? evntTxt,
  }) = _$AbandonmentItemImpl;

  factory _AbandonmentItem.fromJson(Map<String, dynamic> json) =
      _$AbandonmentItemImpl.fromJson;

  @override
  String? get noticeNo;
  @override
  String? get srvcTxt;
  @override
  String? get popfile4;
  @override
  String? get sprtEDate;
  @override
  String? get desertionNo;
  @override
  String? get rfidCd;
  @override
  String? get happenDt;
  @override
  String? get happenPlace;
  @override
  String? get kindCd;
  @override
  String? get colorCd;
  @override
  String? get age;
  @override
  String? get weight;
  @override
  String? get evntImg;
  @override
  String? get updTm;
  @override
  String? get endReason;
  @override
  String? get careRegNo;
  @override
  String? get noticeSdt;
  @override
  String? get noticeEdt;
  @override
  String? get popfile1;
  @override
  String? get processState;
  @override
  String? get sexCd;
  @override
  String? get neuterYn;
  @override
  String? get specialMark;
  @override
  String? get careNm;
  @override
  String? get careTel;
  @override
  String? get careAddr;
  @override
  String? get orgNm;
  @override
  String? get sfeSoci;
  @override
  String? get sfeHealth;
  @override
  String? get etcBigo;
  @override
  String? get kindFullNm;
  @override
  String? get upKindCd;
  @override
  String? get upKindNm;
  @override
  String? get kindNm;
  @override
  String? get popfile2;
  @override
  String? get popfile3;
  @override
  String? get popfile5;
  @override
  String? get popfile6;
  @override
  String? get popfile7;
  @override
  String? get popfile8;
  @override
  String? get careOwnerNm;
  @override
  String? get vaccinationChk;
  @override
  String? get healthChk;
  @override
  String? get adptnTitle;
  @override
  String? get adptnSDate;
  @override
  String? get adptnEDate;
  @override
  String? get adptnConditionLimitTxt;
  @override
  String? get adptnTxt;
  @override
  String? get adptnImg;
  @override
  String? get sprtTitle;
  @override
  String? get sprtSDate;
  @override
  String? get sprtConditionLimitTxt;
  @override
  String? get sprtTxt;
  @override
  String? get sprtImg;
  @override
  String? get srvcTitle;
  @override
  String? get srvcSDate;
  @override
  String? get srvcEDate;
  @override
  String? get srvcConditionLimitTxt;
  @override
  String? get srvcImg;
  @override
  String? get evntTitle;
  @override
  String? get evntSDate;
  @override
  String? get evntEDate;
  @override
  String? get evntConditionLimitTxt;
  @override
  String? get evntTxt;

  /// Create a copy of AbandonmentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbandonmentItemImplCopyWith<_$AbandonmentItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
