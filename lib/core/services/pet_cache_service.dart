import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'package:paws_for_home/features/pets/domain/entities/pet_search_filter.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class PetCacheService {
  static const String _cacheKey = 'cached_pets';
  static const String _cacheFilterKey = 'cached_pets_filter';

  // 펫 목록을 캐시에 저장
  Future<void> cachePets(
    List<AbandonmentItem> pets,
    PetSearchFilter filter,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // 펫 목록을 JSON으로 직렬화
      final petsJson = pets.map((pet) => pet.toJson()).toList();

      await prefs.setString(_cacheKey, jsonEncode(petsJson));
      await prefs.setString(_cacheFilterKey, jsonEncode(filter.toJson()));

      logger.i('✅ 펫 목록 캐시 저장 완료: ${pets.length}개');
    } catch (e) {
      logger.e('❌ 펫 목록 캐시 저장 실패: $e');
    }
  }

  // 캐시된 펫 목록을 가져오기
  Future<List<AbandonmentItem>?> getCachedPets() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // 캐시가 존재하는지 확인
      if (!prefs.containsKey(_cacheKey)) {
        logger.d('📭 캐시된 펫 목록이 없음');
        return null;
      }

      // 캐시된 데이터 파싱
      final petsJson = prefs.getString(_cacheKey);
      if (petsJson != null) {
        final List<dynamic> petsList = jsonDecode(petsJson);
        final pets = petsList
            .map(
              (json) =>
                  AbandonmentItem.fromJson(Map<String, dynamic>.from(json)),
            )
            .toList();

        logger.i('✅ 캐시된 펫 목록 로드 완료: ${pets.length}개');
        return pets;
      }

      return null;
    } catch (e) {
      logger.e('❌ 캐시된 펫 목록 로드 실패: $e');
      return null;
    }
  }

  // 캐시된 필터 정보 가져오기
  Future<PetSearchFilter?> getCachedFilter() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      if (!prefs.containsKey(_cacheFilterKey)) {
        return null;
      }

      final filterJson = prefs.getString(_cacheFilterKey);
      if (filterJson != null) {
        final filterMap = jsonDecode(filterJson);
        return PetSearchFilter.fromJson(Map<String, dynamic>.from(filterMap));
      }

      return null;
    } catch (e) {
      logger.e('❌ 캐시된 필터 로드 실패: $e');
      return null;
    }
  }

  // 캐시 삭제
  Future<void> _clearCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_cacheKey);
      await prefs.remove(_cacheFilterKey);

      logger.i('🗑️ 캐시 삭제 완료');
    } catch (e) {
      logger.e('❌ 캐시 삭제 실패: $e');
    }
  }

  // 캐시 강제 삭제 (수동 새로고침용)
  Future<void> clearCache() async {
    await _clearCache();
  }

  // 캐시 정보 가져오기
  Future<Map<String, dynamic>> getCacheInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final hasCache = prefs.containsKey(_cacheKey);

      return {'hasCache': hasCache, 'isValid': hasCache};
    } catch (e) {
      logger.e('❌ 캐시 정보 가져오기 실패: $e');
      return {'hasCache': false, 'isValid': false};
    }
  }
}
