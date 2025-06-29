import 'package:freezed_annotation/freezed_annotation.dart';

part 'abandonment_response.freezed.dart';
part 'abandonment_response.g.dart';

@freezed
class AbandonmentResponse with _$AbandonmentResponse {
  const factory AbandonmentResponse({
    required Header header,
    required Body body,
  }) = _AbandonmentResponse;

  factory AbandonmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AbandonmentResponseFromJson(json);
}

@freezed
class Header with _$Header {
  const factory Header({
    String? reqNo,
    String? resultCode,
    String? resultMsg,
    String? errorMsg,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}

@freezed
class Body with _$Body {
  const factory Body({
    Items? items,
    String? numOfRows,
    String? pageNo,
    String? totalCount,
  }) = _Body;

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);
}

@freezed
class Items with _$Items {
  const factory Items({@JsonKey(name: 'item') List<AbandonmentItem>? item}) =
      _Items;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}

@freezed
class AbandonmentItem with _$AbandonmentItem {
  const factory AbandonmentItem({
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
  }) = _AbandonmentItem;

  factory AbandonmentItem.fromJson(Map<String, dynamic> json) =>
      _$AbandonmentItemFromJson(json);
}
