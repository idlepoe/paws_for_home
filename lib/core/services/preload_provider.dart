import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:paws_for_home/core/services/abandonment_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

final logger = Logger();

final preloadProvider = Provider<Future<void>>((ref) async {
  final api = AbandonmentApiService();
  final prefs = await SharedPreferences.getInstance();

  try {
    // 시도 정보가 이미 저장되어 있는지 확인
    final existingSido = prefs.getString('sido');
    if (existingSido != null && existingSido.isNotEmpty) {
      logger.i('✅ 시도 정보가 이미 저장되어 있음 - 건너뜀');
    } else {
      logger.i('🔄 시도 리스트 로딩 중...');
      final sido = await api.getSidoList();
      if (sido['response']?['header']?['resultCode'] == '00') {
        final items = sido['response']?['body']?['items']?['item'];
        if (items != null) {
          await prefs.setString('sido', jsonEncode(items));
          logger.i('✅ 시도 리스트 저장 완료: ${items.length}개');

          // 저장 확인
          final savedSido = prefs.getString('sido');
          logger.i('🔍 저장된 시도 데이터 확인: ${savedSido?.substring(0, 100)}...');
        }
      }
    }

    // 축종별 품종 정보 로딩
    await _loadKindData(api, prefs);

    logger.i('🎉 데이터 프리로드 완료!');

    // 최종 확인
    final allKeys = prefs.getKeys();
    logger.i('🔍 SharedPreferences 전체 키: $allKeys');
  } catch (e) {
    logger.e('❌ 데이터 프리로드 중 오류 발생: $e');
  }
});

Future<void> _loadKindData(
  AbandonmentApiService api,
  SharedPreferences prefs,
) async {
  final upkindCodes = [
    {'code': '417000', 'name': '개'},
    {'code': '422400', 'name': '고양이'},
    {'code': '429900', 'name': '기타'},
  ];

  for (final upkind in upkindCodes) {
    final upkindCode = upkind['code']!;
    final upkindName = upkind['name']!;
    final storageKey = 'kind_$upkindCode';

    // 해당 축종의 품종 정보가 이미 저장되어 있는지 확인
    final existingKind = prefs.getString(storageKey);
    if (existingKind != null && existingKind.isNotEmpty) {
      logger.i('✅ ${upkindName} 품종 정보가 이미 저장되어 있음 - 건너뜀');
      continue;
    }

    try {
      logger.i('🔄 ${upkindName} 품종 리스트 로딩 중...');
      final kindData = await api.getKindList(
        upKindCd: upkindCode,
        numOfRows: '1000',
      );

      if (kindData['response']?['header']?['resultCode'] == '00') {
        final items = kindData['response']?['body']?['items']?['item'];
        if (items != null) {
          await prefs.setString(storageKey, jsonEncode(items));
          logger.i('✅ ${upkindName} 품종 리스트 저장 완료: ${items.length}개');

          // 저장 확인
          final savedKind = prefs.getString(storageKey);
          logger.i(
            '🔍 저장된 ${upkindName} 품종 데이터 확인: ${savedKind?.substring(0, 100)}...',
          );
        } else {
          logger.w('⚠️ ${upkindName} 품종 데이터가 비어있음');
        }
      } else {
        logger.w(
          '⚠️ ${upkindName} 품종 API 응답 오류: ${kindData['response']?['header']?['resultMsg']}',
        );
      }
    } catch (e) {
      logger.e('❌ ${upkindName} 품종 데이터 로딩 실패: $e');
    }
  }
}
