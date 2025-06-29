// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShelterResponseImpl _$$ShelterResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ShelterResponseImpl(
  header: ShelterHeader.fromJson(json['header'] as Map<String, dynamic>),
  body: ShelterBody.fromJson(json['body'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ShelterResponseImplToJson(
  _$ShelterResponseImpl instance,
) => <String, dynamic>{'header': instance.header, 'body': instance.body};

_$ShelterHeaderImpl _$$ShelterHeaderImplFromJson(Map<String, dynamic> json) =>
    _$ShelterHeaderImpl(
      errorMsg: json['errorMsg'] as String?,
      reqNo: json['reqNo'] as String?,
      resultCode: json['resultCode'] as String?,
      resultMsg: json['resultMsg'] as String?,
    );

Map<String, dynamic> _$$ShelterHeaderImplToJson(_$ShelterHeaderImpl instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'reqNo': instance.reqNo,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };

_$ShelterBodyImpl _$$ShelterBodyImplFromJson(Map<String, dynamic> json) =>
    _$ShelterBodyImpl(
      pageNo: json['pageNo'] as String?,
      items: json['items'] == null
          ? null
          : ShelterItems.fromJson(json['items'] as Map<String, dynamic>),
      totalCount: json['totalCount'] as String?,
      numOfRows: json['numOfRows'] as String?,
    );

Map<String, dynamic> _$$ShelterBodyImplToJson(_$ShelterBodyImpl instance) =>
    <String, dynamic>{
      'pageNo': instance.pageNo,
      'items': instance.items,
      'totalCount': instance.totalCount,
      'numOfRows': instance.numOfRows,
    };

_$ShelterItemsImpl _$$ShelterItemsImplFromJson(Map<String, dynamic> json) =>
    _$ShelterItemsImpl(
      item: (json['item'] as List<dynamic>?)
          ?.map((e) => ShelterItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ShelterItemsImplToJson(_$ShelterItemsImpl instance) =>
    <String, dynamic>{'item': instance.item};

_$ShelterItemImpl _$$ShelterItemImplFromJson(Map<String, dynamic> json) =>
    _$ShelterItemImpl(
      careRegNo: json['careRegNo'] as String?,
      careNm: json['careNm'] as String?,
    );

Map<String, dynamic> _$$ShelterItemImplToJson(_$ShelterItemImpl instance) =>
    <String, dynamic>{
      'careRegNo': instance.careRegNo,
      'careNm': instance.careNm,
    };
