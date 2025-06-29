import 'package:freezed_annotation/freezed_annotation.dart';
part 'sido_response.freezed.dart';
part 'sido_response.g.dart';

@freezed
class SidoResponse with _$SidoResponse {
  const factory SidoResponse({
    required SidoHeader header,
    required SidoBody body,
  }) = _SidoResponse;

  factory SidoResponse.fromJson(Map<String, dynamic> json) =>
      _$SidoResponseFromJson(json);
}

@freezed
class SidoHeader with _$SidoHeader {
  const factory SidoHeader({
    String? reqNo,
    String? resultCode,
    String? resultMsg,
    String? errorMsg,
  }) = _SidoHeader;

  factory SidoHeader.fromJson(Map<String, dynamic> json) =>
      _$SidoHeaderFromJson(json);
}

@freezed
class SidoBody with _$SidoBody {
  const factory SidoBody({
    SidoItems? items,
    String? numOfRows,
    String? pageNo,
    String? totalCount,
  }) = _SidoBody;

  factory SidoBody.fromJson(Map<String, dynamic> json) =>
      _$SidoBodyFromJson(json);
}

@freezed
class SidoItems with _$SidoItems {
  const factory SidoItems({@JsonKey(name: 'item') List<SidoItem>? item}) =
      _SidoItems;

  factory SidoItems.fromJson(Map<String, dynamic> json) =>
      _$SidoItemsFromJson(json);
}

@freezed
class SidoItem with _$SidoItem {
  const factory SidoItem({String? orgCd, String? orgdownNm}) = _SidoItem;

  factory SidoItem.fromJson(Map<String, dynamic> json) =>
      _$SidoItemFromJson(json);
}
