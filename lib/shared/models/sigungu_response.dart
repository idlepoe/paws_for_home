import 'package:freezed_annotation/freezed_annotation.dart';
part 'sigungu_response.freezed.dart';
part 'sigungu_response.g.dart';

@freezed
class SigunguResponse with _$SigunguResponse {
  const factory SigunguResponse({
    required SigunguHeader header,
    required SigunguBody body,
  }) = _SigunguResponse;

  factory SigunguResponse.fromJson(Map<String, dynamic> json) =>
      _$SigunguResponseFromJson(json);
}

@freezed
class SigunguHeader with _$SigunguHeader {
  const factory SigunguHeader({
    String? reqNo,
    String? resultCode,
    String? resultMsg,
    String? errorMsg,
  }) = _SigunguHeader;

  factory SigunguHeader.fromJson(Map<String, dynamic> json) =>
      _$SigunguHeaderFromJson(json);
}

@freezed
class SigunguBody with _$SigunguBody {
  const factory SigunguBody({
    String? pageNo,
    SigunguItems? items,
    String? totalCount,
    String? numOfRows,
  }) = _SigunguBody;

  factory SigunguBody.fromJson(Map<String, dynamic> json) =>
      _$SigunguBodyFromJson(json);
}

@freezed
class SigunguItems with _$SigunguItems {
  const factory SigunguItems({@JsonKey(name: 'item') List<SigunguItem>? item}) =
      _SigunguItems;

  factory SigunguItems.fromJson(Map<String, dynamic> json) =>
      _$SigunguItemsFromJson(json);
}

@freezed
class SigunguItem with _$SigunguItem {
  const factory SigunguItem({String? orgCd, String? orgdownNm, String? uprCd}) =
      _SigunguItem;

  factory SigunguItem.fromJson(Map<String, dynamic> json) =>
      _$SigunguItemFromJson(json);
}
