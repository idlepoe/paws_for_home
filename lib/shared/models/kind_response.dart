import 'package:freezed_annotation/freezed_annotation.dart';
part 'kind_response.freezed.dart';
part 'kind_response.g.dart';

@freezed
class KindResponse with _$KindResponse {
  const factory KindResponse({
    required KindHeader header,
    required KindBody body,
  }) = _KindResponse;

  factory KindResponse.fromJson(Map<String, dynamic> json) =>
      _$KindResponseFromJson(json);
}

@freezed
class KindHeader with _$KindHeader {
  const factory KindHeader({
    String? errorMsg,
    String? reqNo,
    String? resultCode,
    String? resultMsg,
  }) = _KindHeader;

  factory KindHeader.fromJson(Map<String, dynamic> json) =>
      _$KindHeaderFromJson(json);
}

@freezed
class KindBody with _$KindBody {
  const factory KindBody({
    String? pageNo,
    KindItems? items,
    String? totalCount,
    String? numOfRows,
  }) = _KindBody;

  factory KindBody.fromJson(Map<String, dynamic> json) =>
      _$KindBodyFromJson(json);
}

@freezed
class KindItems with _$KindItems {
  const factory KindItems({@JsonKey(name: 'item') List<KindItem>? item}) =
      _KindItems;

  factory KindItems.fromJson(Map<String, dynamic> json) =>
      _$KindItemsFromJson(json);
}

@freezed
class KindItem with _$KindItem {
  const factory KindItem({String? kindCd, String? kindNm}) = _KindItem;

  factory KindItem.fromJson(Map<String, dynamic> json) =>
      _$KindItemFromJson(json);
}
