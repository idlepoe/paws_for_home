// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigungu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SigunguResponseImpl _$$SigunguResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SigunguResponseImpl(
  header: SigunguHeader.fromJson(json['header'] as Map<String, dynamic>),
  body: SigunguBody.fromJson(json['body'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$SigunguResponseImplToJson(
  _$SigunguResponseImpl instance,
) => <String, dynamic>{'header': instance.header, 'body': instance.body};

_$SigunguHeaderImpl _$$SigunguHeaderImplFromJson(Map<String, dynamic> json) =>
    _$SigunguHeaderImpl(
      reqNo: json['reqNo'] as String?,
      resultCode: json['resultCode'] as String?,
      resultMsg: json['resultMsg'] as String?,
      errorMsg: json['errorMsg'] as String?,
    );

Map<String, dynamic> _$$SigunguHeaderImplToJson(_$SigunguHeaderImpl instance) =>
    <String, dynamic>{
      'reqNo': instance.reqNo,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'errorMsg': instance.errorMsg,
    };

_$SigunguBodyImpl _$$SigunguBodyImplFromJson(Map<String, dynamic> json) =>
    _$SigunguBodyImpl(
      pageNo: json['pageNo'] as String?,
      items: json['items'] == null
          ? null
          : SigunguItems.fromJson(json['items'] as Map<String, dynamic>),
      totalCount: json['totalCount'] as String?,
      numOfRows: json['numOfRows'] as String?,
    );

Map<String, dynamic> _$$SigunguBodyImplToJson(_$SigunguBodyImpl instance) =>
    <String, dynamic>{
      'pageNo': instance.pageNo,
      'items': instance.items,
      'totalCount': instance.totalCount,
      'numOfRows': instance.numOfRows,
    };

_$SigunguItemsImpl _$$SigunguItemsImplFromJson(Map<String, dynamic> json) =>
    _$SigunguItemsImpl(
      item: (json['item'] as List<dynamic>?)
          ?.map((e) => SigunguItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SigunguItemsImplToJson(_$SigunguItemsImpl instance) =>
    <String, dynamic>{'item': instance.item};

_$SigunguItemImpl _$$SigunguItemImplFromJson(Map<String, dynamic> json) =>
    _$SigunguItemImpl(
      orgCd: json['orgCd'] as String?,
      orgdownNm: json['orgdownNm'] as String?,
      uprCd: json['uprCd'] as String?,
    );

Map<String, dynamic> _$$SigunguItemImplToJson(_$SigunguItemImpl instance) =>
    <String, dynamic>{
      'orgCd': instance.orgCd,
      'orgdownNm': instance.orgdownNm,
      'uprCd': instance.uprCd,
    };
