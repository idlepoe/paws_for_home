import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class CacheSettingsService {
  static const String _cacheExpirationKey = 'cache_expiration_hours';
  static const String _cacheEnabledKey = 'cache_enabled';
  static const int _defaultExpirationHours = 1; // 기본 1시간

  // 캐시 만료 시간 설정 (시간 단위)
  Future<void> setCacheExpirationHours(int hours) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_cacheExpirationKey, hours);
      logger.i('✅ 캐시 만료 시간 설정: ${hours}시간');
    } catch (e) {
      logger.e('❌ 캐시 만료 시간 설정 실패: $e');
    }
  }

  // 캐시 만료 시간 가져오기
  Future<int> getCacheExpirationHours() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt(_cacheExpirationKey) ?? _defaultExpirationHours;
    } catch (e) {
      logger.e('❌ 캐시 만료 시간 가져오기 실패: $e');
      return _defaultExpirationHours;
    }
  }

  // 캐시 활성화/비활성화 설정
  Future<void> setCacheEnabled(bool enabled) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_cacheEnabledKey, enabled);
      logger.i('✅ 캐시 ${enabled ? '활성화' : '비활성화'} 설정');
    } catch (e) {
      logger.e('❌ 캐시 활성화 설정 실패: $e');
    }
  }

  // 캐시 활성화 상태 가져오기
  Future<bool> isCacheEnabled() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_cacheEnabledKey) ?? true; // 기본값은 활성화
    } catch (e) {
      logger.e('❌ 캐시 활성화 상태 가져오기 실패: $e');
      return true;
    }
  }

  // 캐시 설정 초기화
  Future<void> resetCacheSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_cacheExpirationKey);
      await prefs.remove(_cacheEnabledKey);
      logger.i('✅ 캐시 설정 초기화 완료');
    } catch (e) {
      logger.e('❌ 캐시 설정 초기화 실패: $e');
    }
  }

  // 캐시 설정 정보 가져오기
  Future<Map<String, dynamic>> getCacheSettings() async {
    try {
      final expirationHours = await getCacheExpirationHours();
      final isEnabled = await isCacheEnabled();

      return {
        'expirationHours': expirationHours,
        'isEnabled': isEnabled,
        'expirationDuration': Duration(hours: expirationHours),
      };
    } catch (e) {
      logger.e('❌ 캐시 설정 정보 가져오기 실패: $e');
      return {
        'expirationHours': _defaultExpirationHours,
        'isEnabled': true,
        'expirationDuration': Duration(hours: _defaultExpirationHours),
      };
    }
  }
}
