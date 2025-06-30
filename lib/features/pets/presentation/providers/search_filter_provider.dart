import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:paws_for_home/features/pets/domain/entities/pet_search_filter.dart';
import 'dart:convert';

final logger = Logger();

// 드롭다운 데이터 상태 관리
class DropdownDataNotifier
    extends StateNotifier<Map<String, List<Map<String, dynamic>>>> {
  DropdownDataNotifier() : super({}) {
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // SharedPreferences에서 데이터 로드
      final sidoRaw = prefs.getString('sido');

      logger.i('🔍 SharedPreferences 데이터 로드 중...');

      // 시도 리스트 파싱
      final sidoList = _parseJsonList(sidoRaw);

      // 고정 리스트들
      final upkindList = [
        {'code': '417000', 'name': '개'},
        {'code': '422400', 'name': '고양이'},
        {'code': '429900', 'name': '기타'},
      ];

      final stateList = [
        {'code': null, 'name': '전체'},
        {'code': '공고중', 'name': '공고중'},
        {'code': '보호중', 'name': '보호중'},
        {'code': '종료(반환)', 'name': '종료(반환)'},
      ];

      final neuterList = [
        {'code': null, 'name': '전체'},
        {'code': 'Y', 'name': '예'},
        {'code': 'N', 'name': '아니오'},
        {'code': 'U', 'name': '미상'},
      ];

      final sexList = [
        {'code': null, 'name': '전체'},
        {'code': 'M', 'name': '수컷'},
        {'code': 'F', 'name': '암컷'},
        {'code': 'Q', 'name': '미상'},
      ];

      logger.i('✅ 드롭다운 데이터 로드 완료');
      logger.i('시도: ${sidoList.length}개');

      state = {
        'sido': sidoList,
        'upkind': upkindList,
        'state': stateList,
        'neuter': neuterList,
        'sex': sexList,
      };
    } catch (e) {
      logger.e('❌ 드롭다운 데이터 로드 실패: $e');
      state = {
        'sido': [],
        'upkind': [
          {'code': '417000', 'name': '개'},
          {'code': '422400', 'name': '고양이'},
          {'code': '429900', 'name': '기타'},
        ],
        'state': [
          {'code': null, 'name': '전체'},
          {'code': '공고중', 'name': '공고중'},
          {'code': '보호중', 'name': '보호중'},
          {'code': '종료(반환)', 'name': '종료(반환)'},
        ],
        'neuter': [
          {'code': null, 'name': '전체'},
          {'code': 'Y', 'name': '예'},
          {'code': 'N', 'name': '아니오'},
          {'code': 'U', 'name': '미상'},
        ],
        'sex': [
          {'code': null, 'name': '전체'},
          {'code': 'M', 'name': '수컷'},
          {'code': 'F', 'name': '암컷'},
          {'code': 'Q', 'name': '미상'},
        ],
      };
    }
  }

  Future<void> refresh() async {
    await _loadData();
  }
}

final dropdownDataProvider =
    StateNotifierProvider<
      DropdownDataNotifier,
      Map<String, List<Map<String, dynamic>>>
    >((ref) {
      return DropdownDataNotifier();
    });

// JSON 리스트 파싱 함수
List<Map<String, dynamic>> _parseJsonList(String? raw) {
  if (raw == null || raw.isEmpty) {
    logger.w('❌ raw 데이터가 null 또는 비어있음');
    return [];
  }

  try {
    final json = jsonDecode(raw);
    logger.d('🔍 파싱된 JSON: ${json.runtimeType}');

    if (json is List) {
      final result = <Map<String, dynamic>>[];
      for (final item in json) {
        if (item is Map<String, dynamic>) {
          // API 응답 구조에 맞게 변환
          if (item.containsKey('orgCd') && item.containsKey('orgdownNm')) {
            // 시도/시군구 데이터
            result.add({'code': item['orgCd'], 'name': item['orgdownNm']});
          } else if (item.containsKey('careRegNo') &&
              item.containsKey('careNm')) {
            // 보호소 데이터
            result.add({'code': item['careRegNo'], 'name': item['careNm']});
          } else if (item.containsKey('kindCd') && item.containsKey('kindNm')) {
            // 품종 데이터
            result.add({'code': item['kindCd'], 'name': item['kindNm']});
          } else {
            // 기타 데이터 (이미 code/name 형태)
            result.add(item);
          }
        }
      }
      logger.d('🔍 변환된 결과: ${result.length}개 - ${result.take(3)}');
      return result;
    }
    logger.w('❌ JSON이 List 타입이 아님: ${json.runtimeType}');
    return [];
  } catch (e) {
    logger.e('❌ JSON 파싱 오류: $e');
    return [];
  }
}

// 검색 필터 상태 관리
class SearchFilterNotifier extends StateNotifier<PetSearchFilter> {
  SearchFilterNotifier(PetSearchFilter initial) : super(initial);

  void updateFilter(PetSearchFilter newFilter) {
    state = newFilter;
  }

  void setField(String key, String? value) {
    state = state.copyWith(
      bgnde: key == 'bgnde' ? value : state.bgnde,
      endde: key == 'endde' ? value : state.endde,
      upkind: key == 'upkind' ? value : state.upkind,
      kind: key == 'kind' ? value : state.kind,
      uprCd: key == 'upr_cd' ? value : state.uprCd,
      orgCd: key == 'org_cd' ? value : state.orgCd,
      careRegNo: key == 'care_reg_no' ? value : state.careRegNo,
      state: key == 'state' ? value : state.state,
      neuterYn: key == 'neuter_yn' ? value : state.neuterYn,
      sexCd: key == 'sex_cd' ? value : state.sexCd,
      rfidCd: key == 'rfid_cd' ? value : state.rfidCd,
      desertionNo: key == 'desertion_no' ? value : state.desertionNo,
      noticeNo: key == 'notice_no' ? value : state.noticeNo,
    );

    // 연관 필드 초기화
    if (key == 'upr_cd') {
      state = state.copyWith(orgCd: null, careRegNo: null);
    } else if (key == 'org_cd') {
      state = state.copyWith(careRegNo: null);
    }
  }

  void setDateRange(DateTimeRange? range) {
    if (range != null) {
      state = state.copyWith(
        bgnde: _dateToString(range.start),
        endde: _dateToString(range.end),
      );
    } else {
      state = state.copyWith(bgnde: null, endde: null);
    }
  }

  void reset() {
    state = const PetSearchFilter();
  }

  String _dateToString(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';
  }
}

final searchFilterProvider =
    StateNotifierProvider<SearchFilterNotifier, PetSearchFilter>((ref) {
      return SearchFilterNotifier(const PetSearchFilter());
    });
