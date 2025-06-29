// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kind_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KindResponseImpl _$$KindResponseImplFromJson(Map<String, dynamic> json) =>
    _$KindResponseImpl(
      header: KindHeader.fromJson(json['header'] as Map<String, dynamic>),
      body: KindBody.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$KindResponseImplToJson(_$KindResponseImpl instance) =>
    <String, dynamic>{'header': instance.header, 'body': instance.body};

_$KindHeaderImpl _$$KindHeaderImplFromJson(Map<String, dynamic> json) =>
    _$KindHeaderImpl(
      errorMsg: json['errorMsg'] as String?,
      reqNo: json['reqNo'] as String?,
      resultCode: json['resultCode'] as String?,
      resultMsg: json['resultMsg'] as String?,
    );

Map<String, dynamic> _$$KindHeaderImplToJson(_$KindHeaderImpl instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'reqNo': instance.reqNo,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };

_$KindBodyImpl _$$KindBodyImplFromJson(Map<String, dynamic> json) =>
    _$KindBodyImpl(
      pageNo: json['pageNo'] as String?,
      items: json['items'] == null
          ? null
          : KindItems.fromJson(json['items'] as Map<String, dynamic>),
      totalCount: json['totalCount'] as String?,
      numOfRows: json['numOfRows'] as String?,
    );

Map<String, dynamic> _$$KindBodyImplToJson(_$KindBodyImpl instance) =>
    <String, dynamic>{
      'pageNo': instance.pageNo,
      'items': instance.items,
      'totalCount': instance.totalCount,
      'numOfRows': instance.numOfRows,
    };

_$KindItemsImpl _$$KindItemsImplFromJson(Map<String, dynamic> json) =>
    _$KindItemsImpl(
      item: (json['item'] as List<dynamic>?)
          ?.map((e) => KindItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$KindItemsImplToJson(_$KindItemsImpl instance) =>
    <String, dynamic>{'item': instance.item};

_$KindItemImpl _$$KindItemImplFromJson(Map<String, dynamic> json) =>
    _$KindItemImpl(
      kindCd: json['kindCd'] as String?,
      kindNm: json['kindNm'] as String?,
    );

Map<String, dynamic> _$$KindItemImplToJson(_$KindItemImpl instance) =>
    <String, dynamic>{'kindCd': instance.kindCd, 'kindNm': instance.kindNm};
