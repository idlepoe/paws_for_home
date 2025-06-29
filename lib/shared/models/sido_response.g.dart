// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sido_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SidoResponseImpl _$$SidoResponseImplFromJson(Map<String, dynamic> json) =>
    _$SidoResponseImpl(
      header: SidoHeader.fromJson(json['header'] as Map<String, dynamic>),
      body: SidoBody.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SidoResponseImplToJson(_$SidoResponseImpl instance) =>
    <String, dynamic>{'header': instance.header, 'body': instance.body};

_$SidoHeaderImpl _$$SidoHeaderImplFromJson(Map<String, dynamic> json) =>
    _$SidoHeaderImpl(
      reqNo: json['reqNo'] as String?,
      resultCode: json['resultCode'] as String?,
      resultMsg: json['resultMsg'] as String?,
      errorMsg: json['errorMsg'] as String?,
    );

Map<String, dynamic> _$$SidoHeaderImplToJson(_$SidoHeaderImpl instance) =>
    <String, dynamic>{
      'reqNo': instance.reqNo,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'errorMsg': instance.errorMsg,
    };

_$SidoBodyImpl _$$SidoBodyImplFromJson(Map<String, dynamic> json) =>
    _$SidoBodyImpl(
      items: json['items'] == null
          ? null
          : SidoItems.fromJson(json['items'] as Map<String, dynamic>),
      numOfRows: json['numOfRows'] as String?,
      pageNo: json['pageNo'] as String?,
      totalCount: json['totalCount'] as String?,
    );

Map<String, dynamic> _$$SidoBodyImplToJson(_$SidoBodyImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'numOfRows': instance.numOfRows,
      'pageNo': instance.pageNo,
      'totalCount': instance.totalCount,
    };

_$SidoItemsImpl _$$SidoItemsImplFromJson(Map<String, dynamic> json) =>
    _$SidoItemsImpl(
      item: (json['item'] as List<dynamic>?)
          ?.map((e) => SidoItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SidoItemsImplToJson(_$SidoItemsImpl instance) =>
    <String, dynamic>{'item': instance.item};

_$SidoItemImpl _$$SidoItemImplFromJson(Map<String, dynamic> json) =>
    _$SidoItemImpl(
      orgCd: json['orgCd'] as String?,
      orgdownNm: json['orgdownNm'] as String?,
    );

Map<String, dynamic> _$$SidoItemImplToJson(_$SidoItemImpl instance) =>
    <String, dynamic>{'orgCd': instance.orgCd, 'orgdownNm': instance.orgdownNm};
