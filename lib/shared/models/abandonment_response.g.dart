// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abandonment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbandonmentResponseImpl _$$AbandonmentResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AbandonmentResponseImpl(
  header: Header.fromJson(json['header'] as Map<String, dynamic>),
  body: Body.fromJson(json['body'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AbandonmentResponseImplToJson(
  _$AbandonmentResponseImpl instance,
) => <String, dynamic>{'header': instance.header, 'body': instance.body};

_$HeaderImpl _$$HeaderImplFromJson(Map<String, dynamic> json) => _$HeaderImpl(
  reqNo: json['reqNo'] as String?,
  resultCode: json['resultCode'] as String?,
  resultMsg: json['resultMsg'] as String?,
  errorMsg: json['errorMsg'] as String?,
);

Map<String, dynamic> _$$HeaderImplToJson(_$HeaderImpl instance) =>
    <String, dynamic>{
      'reqNo': instance.reqNo,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'errorMsg': instance.errorMsg,
    };

_$BodyImpl _$$BodyImplFromJson(Map<String, dynamic> json) => _$BodyImpl(
  items: json['items'] == null
      ? null
      : Items.fromJson(json['items'] as Map<String, dynamic>),
  numOfRows: json['numOfRows'] as String?,
  pageNo: json['pageNo'] as String?,
  totalCount: json['totalCount'] as String?,
);

Map<String, dynamic> _$$BodyImplToJson(_$BodyImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'numOfRows': instance.numOfRows,
      'pageNo': instance.pageNo,
      'totalCount': instance.totalCount,
    };

_$ItemsImpl _$$ItemsImplFromJson(Map<String, dynamic> json) => _$ItemsImpl(
  item: (json['item'] as List<dynamic>?)
      ?.map((e) => AbandonmentItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ItemsImplToJson(_$ItemsImpl instance) =>
    <String, dynamic>{'item': instance.item};

_$AbandonmentItemImpl _$$AbandonmentItemImplFromJson(
  Map<String, dynamic> json,
) => _$AbandonmentItemImpl(
  noticeNo: json['noticeNo'] as String?,
  srvcTxt: json['srvcTxt'] as String?,
  popfile4: json['popfile4'] as String?,
  sprtEDate: json['sprtEDate'] as String?,
  desertionNo: json['desertionNo'] as String?,
  rfidCd: json['rfidCd'] as String?,
  happenDt: json['happenDt'] as String?,
  happenPlace: json['happenPlace'] as String?,
  kindCd: json['kindCd'] as String?,
  colorCd: json['colorCd'] as String?,
  age: json['age'] as String?,
  weight: json['weight'] as String?,
  evntImg: json['evntImg'] as String?,
  updTm: json['updTm'] as String?,
  endReason: json['endReason'] as String?,
  careRegNo: json['careRegNo'] as String?,
  noticeSdt: json['noticeSdt'] as String?,
  noticeEdt: json['noticeEdt'] as String?,
  popfile1: json['popfile1'] as String?,
  processState: json['processState'] as String?,
  sexCd: json['sexCd'] as String?,
  neuterYn: json['neuterYn'] as String?,
  specialMark: json['specialMark'] as String?,
  careNm: json['careNm'] as String?,
  careTel: json['careTel'] as String?,
  careAddr: json['careAddr'] as String?,
  orgNm: json['orgNm'] as String?,
  sfeSoci: json['sfeSoci'] as String?,
  sfeHealth: json['sfeHealth'] as String?,
  etcBigo: json['etcBigo'] as String?,
  kindFullNm: json['kindFullNm'] as String?,
  upKindCd: json['upKindCd'] as String?,
  upKindNm: json['upKindNm'] as String?,
  kindNm: json['kindNm'] as String?,
  popfile2: json['popfile2'] as String?,
  popfile3: json['popfile3'] as String?,
  popfile5: json['popfile5'] as String?,
  popfile6: json['popfile6'] as String?,
  popfile7: json['popfile7'] as String?,
  popfile8: json['popfile8'] as String?,
  careOwnerNm: json['careOwnerNm'] as String?,
  vaccinationChk: json['vaccinationChk'] as String?,
  healthChk: json['healthChk'] as String?,
  adptnTitle: json['adptnTitle'] as String?,
  adptnSDate: json['adptnSDate'] as String?,
  adptnEDate: json['adptnEDate'] as String?,
  adptnConditionLimitTxt: json['adptnConditionLimitTxt'] as String?,
  adptnTxt: json['adptnTxt'] as String?,
  adptnImg: json['adptnImg'] as String?,
  sprtTitle: json['sprtTitle'] as String?,
  sprtSDate: json['sprtSDate'] as String?,
  sprtConditionLimitTxt: json['sprtConditionLimitTxt'] as String?,
  sprtTxt: json['sprtTxt'] as String?,
  sprtImg: json['sprtImg'] as String?,
  srvcTitle: json['srvcTitle'] as String?,
  srvcSDate: json['srvcSDate'] as String?,
  srvcEDate: json['srvcEDate'] as String?,
  srvcConditionLimitTxt: json['srvcConditionLimitTxt'] as String?,
  srvcImg: json['srvcImg'] as String?,
  evntTitle: json['evntTitle'] as String?,
  evntSDate: json['evntSDate'] as String?,
  evntEDate: json['evntEDate'] as String?,
  evntConditionLimitTxt: json['evntConditionLimitTxt'] as String?,
  evntTxt: json['evntTxt'] as String?,
);

Map<String, dynamic> _$$AbandonmentItemImplToJson(
  _$AbandonmentItemImpl instance,
) => <String, dynamic>{
  'noticeNo': instance.noticeNo,
  'srvcTxt': instance.srvcTxt,
  'popfile4': instance.popfile4,
  'sprtEDate': instance.sprtEDate,
  'desertionNo': instance.desertionNo,
  'rfidCd': instance.rfidCd,
  'happenDt': instance.happenDt,
  'happenPlace': instance.happenPlace,
  'kindCd': instance.kindCd,
  'colorCd': instance.colorCd,
  'age': instance.age,
  'weight': instance.weight,
  'evntImg': instance.evntImg,
  'updTm': instance.updTm,
  'endReason': instance.endReason,
  'careRegNo': instance.careRegNo,
  'noticeSdt': instance.noticeSdt,
  'noticeEdt': instance.noticeEdt,
  'popfile1': instance.popfile1,
  'processState': instance.processState,
  'sexCd': instance.sexCd,
  'neuterYn': instance.neuterYn,
  'specialMark': instance.specialMark,
  'careNm': instance.careNm,
  'careTel': instance.careTel,
  'careAddr': instance.careAddr,
  'orgNm': instance.orgNm,
  'sfeSoci': instance.sfeSoci,
  'sfeHealth': instance.sfeHealth,
  'etcBigo': instance.etcBigo,
  'kindFullNm': instance.kindFullNm,
  'upKindCd': instance.upKindCd,
  'upKindNm': instance.upKindNm,
  'kindNm': instance.kindNm,
  'popfile2': instance.popfile2,
  'popfile3': instance.popfile3,
  'popfile5': instance.popfile5,
  'popfile6': instance.popfile6,
  'popfile7': instance.popfile7,
  'popfile8': instance.popfile8,
  'careOwnerNm': instance.careOwnerNm,
  'vaccinationChk': instance.vaccinationChk,
  'healthChk': instance.healthChk,
  'adptnTitle': instance.adptnTitle,
  'adptnSDate': instance.adptnSDate,
  'adptnEDate': instance.adptnEDate,
  'adptnConditionLimitTxt': instance.adptnConditionLimitTxt,
  'adptnTxt': instance.adptnTxt,
  'adptnImg': instance.adptnImg,
  'sprtTitle': instance.sprtTitle,
  'sprtSDate': instance.sprtSDate,
  'sprtConditionLimitTxt': instance.sprtConditionLimitTxt,
  'sprtTxt': instance.sprtTxt,
  'sprtImg': instance.sprtImg,
  'srvcTitle': instance.srvcTitle,
  'srvcSDate': instance.srvcSDate,
  'srvcEDate': instance.srvcEDate,
  'srvcConditionLimitTxt': instance.srvcConditionLimitTxt,
  'srvcImg': instance.srvcImg,
  'evntTitle': instance.evntTitle,
  'evntSDate': instance.evntSDate,
  'evntEDate': instance.evntEDate,
  'evntConditionLimitTxt': instance.evntConditionLimitTxt,
  'evntTxt': instance.evntTxt,
};
