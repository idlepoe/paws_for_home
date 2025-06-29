import 'package:freezed_annotation/freezed_annotation.dart';
part 'shelter_response.freezed.dart';
part 'shelter_response.g.dart';

@freezed
class ShelterResponse with _$ShelterResponse {
  const factory ShelterResponse({
    required ShelterHeader header,
    required ShelterBody body,
  }) = _ShelterResponse;

  factory ShelterResponse.fromJson(Map<String, dynamic> json) =>
      _$ShelterResponseFromJson(json);
}

@freezed
class ShelterHeader with _$ShelterHeader {
  const factory ShelterHeader({
    String? errorMsg,
    String? reqNo,
    String? resultCode,
    String? resultMsg,
  }) = _ShelterHeader;

  factory ShelterHeader.fromJson(Map<String, dynamic> json) =>
      _$ShelterHeaderFromJson(json);
}

@freezed
class ShelterBody with _$ShelterBody {
  const factory ShelterBody({
    String? pageNo,
    ShelterItems? items,
    String? totalCount,
    String? numOfRows,
  }) = _ShelterBody;

  factory ShelterBody.fromJson(Map<String, dynamic> json) =>
      _$ShelterBodyFromJson(json);
}

@freezed
class ShelterItems with _$ShelterItems {
  const factory ShelterItems({@JsonKey(name: 'item') List<ShelterItem>? item}) =
      _ShelterItems;

  factory ShelterItems.fromJson(Map<String, dynamic> json) =>
      _$ShelterItemsFromJson(json);
}

@freezed
class ShelterItem with _$ShelterItem {
  const factory ShelterItem({String? careRegNo, String? careNm}) = _ShelterItem;

  factory ShelterItem.fromJson(Map<String, dynamic> json) =>
      _$ShelterItemFromJson(json);
}
