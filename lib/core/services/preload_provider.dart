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
      return;
    }

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

    logger.i('🎉 시도 데이터 프리로드 완료!');

    // 최종 확인
    final allKeys = prefs.getKeys();
    logger.i('🔍 SharedPreferences 전체 키: $allKeys');
  } catch (e) {
    logger.e('❌ 데이터 프리로드 중 오류 발생: $e');
  }
});
