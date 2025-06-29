import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'pets_list_screen.dart';
import 'package:paws_for_home/shared/models/sido_response.dart';
import 'package:paws_for_home/shared/models/sigungu_response.dart';
import 'package:paws_for_home/shared/models/shelter_response.dart';
import 'package:paws_for_home/shared/models/kind_response.dart';

class SearchFilterScreen extends StatefulWidget {
  final PetSearchFilter initial;
  const SearchFilterScreen({super.key, required this.initial});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  late PetSearchFilter filter;
  final _formKey = GlobalKey<FormState>();

  // 드롭다운 데이터
  List<Map<String, dynamic>> sidoList = [];
  List<Map<String, dynamic>> sigunguList = [];
  List<Map<String, dynamic>> shelterList = [];
  List<Map<String, dynamic>> kindList = [];
  final List<Map<String, String>> upkindList = [
    {'code': '417000', 'name': '개'},
    {'code': '422400', 'name': '고양이'},
    {'code': '429900', 'name': '기타'},
  ];
  final List<Map<String, String?>> stateList = [
    {'code': null, 'name': '전체'},
    {'code': '공고중', 'name': '공고중'},
    {'code': '보호중', 'name': '보호중'},
    {'code': '종료(반환)', 'name': '종료(반환)'},
  ];
  final List<Map<String, String?>> neuterList = [
    {'code': null, 'name': '전체'},
    {'code': 'Y', 'name': '예'},
    {'code': 'N', 'name': '아니오'},
    {'code': 'U', 'name': '미상'},
  ];
  final List<Map<String, String?>> sexList = [
    {'code': null, 'name': '전체'},
    {'code': 'M', 'name': '수컷'},
    {'code': 'F', 'name': '암컷'},
    {'code': 'Q', 'name': '미상'},
  ];

  @override
  void initState() {
    super.initState();
    filter = widget.initial;
    _loadDropdownData();
  }

  Future<void> _loadDropdownData() async {
    final prefs = await SharedPreferences.getInstance();

    // 디버깅: SharedPreferences에 저장된 데이터 확인
    final sidoRaw = prefs.getString('sido');
    final sigunguRaw = prefs.getString('sigungu');
    final shelterRaw = prefs.getString('shelter');
    final kindRaw = prefs.getString('kind');

    print('🔍 SharedPreferences 데이터 확인:');
    print('sido: ${sidoRaw?.substring(0, 100)}...');
    print('sigungu: ${sigunguRaw?.substring(0, 100)}...');
    print('shelter: ${shelterRaw?.substring(0, 100)}...');
    print('kind: ${kindRaw?.substring(0, 100)}...');

    setState(() {
      sidoList = _parseList(sidoRaw, 'orgCd', 'orgdownNm');
      sigunguList = _parseList(sigunguRaw, 'orgCd', 'orgdownNm');
      shelterList = _parseList(shelterRaw, 'careRegNo', 'careNm');
      kindList = _parseList(kindRaw, 'kindCd', 'kindNm');
    });

    // 디버깅: 파싱된 데이터 확인
    print('🔍 파싱된 데이터:');
    print('sidoList: ${sidoList.length}개');
    print('sigunguList: ${sigunguList.length}개');
    print('shelterList: ${shelterList.length}개');
    print('kindList: ${kindList.length}개');
  }

  List<Map<String, dynamic>> _parseList(
    String? raw,
    String codeKey,
    String nameKey,
  ) {
    if (raw == null) {
      print('❌ raw 데이터가 null입니다');
      return [];
    }

    try {
      // Map 형태의 문자열을 JSON으로 변환 - 더 안전한 방법
      String jsonString = raw;

      // 1단계: 작은따옴표를 큰따옴표로 변경
      jsonString = jsonString.replaceAll("'", '"');

      // 2단계: 키 이름에 큰따옴표 추가 (정규식 대신 단순 치환)
      jsonString = jsonString.replaceAll('response:', '"response":');
      jsonString = jsonString.replaceAll('header:', '"header":');
      jsonString = jsonString.replaceAll('body:', '"body":');
      jsonString = jsonString.replaceAll('items:', '"items":');
      jsonString = jsonString.replaceAll('item:', '"item":');
      jsonString = jsonString.replaceAll('reqNo:', '"reqNo":');
      jsonString = jsonString.replaceAll('resultCode:', '"resultCode":');
      jsonString = jsonString.replaceAll('resultMsg:', '"resultMsg":');
      jsonString = jsonString.replaceAll('errorMsg:', '"errorMsg":');
      jsonString = jsonString.replaceAll('pageNo:', '"pageNo":');
      jsonString = jsonString.replaceAll('totalCount:', '"totalCount":');
      jsonString = jsonString.replaceAll('numOfRows:', '"numOfRows":');

      // 시도/시군구 관련
      jsonString = jsonString.replaceAll('orgCd:', '"orgCd":');
      jsonString = jsonString.replaceAll('orgdownNm:', '"orgdownNm":');
      jsonString = jsonString.replaceAll('uprCd:', '"uprCd":');

      // 보호소 관련
      jsonString = jsonString.replaceAll('careRegNo:', '"careRegNo":');
      jsonString = jsonString.replaceAll('careNm:', '"careNm":');

      // 품종 관련
      jsonString = jsonString.replaceAll('kindCd:', '"kindCd":');
      jsonString = jsonString.replaceAll('kindNm:', '"kindNm":');

      print('🔧 처리된 JSON: ${jsonString.substring(0, 200)}...');

      final json = jsonDecode(jsonString);

      // Freezed 모델을 사용하여 파싱
      if (codeKey == 'orgCd' && nameKey == 'orgdownNm') {
        if (json['response'] != null) {
          final response = json['response'];
          if (response['body'] != null && response['body']['items'] != null) {
            final items = response['body']['items']['item'];
            if (items != null) {
              if (items is List) {
                final result = items
                    .map<Map<String, dynamic>>(
                      (e) => {'code': e['orgCd'], 'name': e['orgdownNm']},
                    )
                    .toList();
                print('✅ 시도/시군구 List로 파싱 완료: ${result.length}개');
                return result;
              } else if (items is Map<String, dynamic>) {
                final result = [
                  {'code': items['orgCd'], 'name': items['orgdownNm']},
                ];
                print('✅ 시도/시군구 Map으로 파싱 완료: ${result.length}개');
                return result;
              }
            }
          }
        }
      } else if (codeKey == 'careRegNo' && nameKey == 'careNm') {
        if (json['response'] != null) {
          final response = json['response'];
          if (response['body'] != null && response['body']['items'] != null) {
            final items = response['body']['items']['item'];
            if (items != null) {
              if (items is List) {
                final result = items
                    .map<Map<String, dynamic>>(
                      (e) => {'code': e['careRegNo'], 'name': e['careNm']},
                    )
                    .toList();
                print('✅ 보호소 List로 파싱 완료: ${result.length}개');
                return result;
              } else if (items is Map<String, dynamic>) {
                final result = [
                  {'code': items['careRegNo'], 'name': items['careNm']},
                ];
                print('✅ 보호소 Map으로 파싱 완료: ${result.length}개');
                return result;
              }
            }
          }
        }
      } else if (codeKey == 'kindCd' && nameKey == 'kindNm') {
        if (json['response'] != null) {
          final response = json['response'];
          if (response['body'] != null && response['body']['items'] != null) {
            final items = response['body']['items']['item'];
            if (items != null) {
              if (items is List) {
                final result = items
                    .map<Map<String, dynamic>>(
                      (e) => {'code': e['kindCd'], 'name': e['kindNm']},
                    )
                    .toList();
                print('✅ 품종 List로 파싱 완료: ${result.length}개');
                return result;
              } else if (items is Map<String, dynamic>) {
                final result = [
                  {'code': items['kindCd'], 'name': items['kindNm']},
                ];
                print('✅ 품종 Map으로 파싱 완료: ${result.length}개');
                return result;
              }
            }
          }
        }
      }
    } catch (e) {
      print('❌ 파싱 오류: $e');
    }
    return [];
  }

  void _set(String key, String? value) {
    setState(() {
      filter = filter.copyWith(
        bgnde: key == 'bgnde' ? value : filter.bgnde,
        endde: key == 'endde' ? value : filter.endde,
        upkind: key == 'upkind' ? value : filter.upkind,
        kind: key == 'kind' ? value : filter.kind,
        uprCd: key == 'upr_cd' ? value : filter.uprCd,
        orgCd: key == 'org_cd' ? value : filter.orgCd,
        careRegNo: key == 'care_reg_no' ? value : filter.careRegNo,
        state: key == 'state' ? value : filter.state,
        neuterYn: key == 'neuter_yn' ? value : filter.neuterYn,
        sexCd: key == 'sex_cd' ? value : filter.sexCd,
        rfidCd: key == 'rfid_cd' ? value : filter.rfidCd,
        desertionNo: key == 'desertion_no' ? value : filter.desertionNo,
        noticeNo: key == 'notice_no' ? value : filter.noticeNo,
      );
      if (key == 'upr_cd') {
        filter = filter.copyWith(orgCd: null, careRegNo: null);
      } else if (key == 'org_cd') {
        filter = filter.copyWith(careRegNo: null);
      }
    });
  }

  Widget _comboBox(
    String label,
    String key,
    List<Map<String, dynamic>> items, {
    String? value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: value,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        items: [
          const DropdownMenuItem<String>(value: null, child: Text('선택 안함')),
          ...items.map(
            (e) => DropdownMenuItem<String>(
              value: e['code'],
              child: Text(e['name'] ?? e['code']),
            ),
          ),
        ],
        onChanged: (v) => _set(key, v),
      ),
    );
  }

  Widget _comboBoxString(
    String label,
    String key,
    List<Map<String, String?>> items, {
    String? value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String?>(
        value: value,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        items: items
            .map(
              (e) => DropdownMenuItem<String?>(
                value: e['code'],
                child: Text(e['name'] ?? ''),
              ),
            )
            .toList(),
        onChanged: (v) => _set(key, v),
      ),
    );
  }

  Widget _dateRangePicker(BuildContext context) {
    String? start = filter.bgnde;
    String? end = filter.endde;
    String label = '구조일자';
    String display = (start != null && end != null)
        ? '$start ~ $end'
        : '기간을 선택하세요';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () async {
          final now = DateTime.now();
          final picked = await showDateRangePicker(
            context: context,
            firstDate: DateTime(now.year - 5),
            lastDate: DateTime(now.year + 1),
            initialDateRange: (start != null && end != null)
                ? DateTimeRange(
                    start: DateTime.parse(start),
                    end: DateTime.parse(end),
                  )
                : null,
            builder: (context, child) => Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Colors.deepOrange,
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            ),
          );
          if (picked != null) {
            setState(() {
              filter = filter.copyWith(
                bgnde: _dateToString(picked.start),
                endde: _dateToString(picked.end),
              );
            });
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.white,
          ),
          child: Row(
            children: [
              Icon(Icons.date_range, color: Colors.deepOrange),
              const SizedBox(width: 8),
              Text(display, style: const TextStyle(fontSize: 16)),
              if (start != null && end != null)
                IconButton(
                  icon: const Icon(Icons.close, size: 18),
                  onPressed: () {
                    setState(() {
                      filter = filter.copyWith(bgnde: null, endde: null);
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _dateToString(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';
  }

  Widget _inputField(
    String label,
    String key, {
    String? hint,
    TextInputType? type,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        initialValue: filter.toQuery()[key] ?? '',
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (v) => _set(key, v.isEmpty ? null : v),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: const Text(
          '검색 조건',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: theme.colorScheme.background,
        foregroundColor: theme.colorScheme.primary,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(const PetSearchFilter());
            },
            child: const Text(
              '초기화',
              style: TextStyle(color: Colors.deepOrange),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            _dateRangePicker(context),
            _comboBox('축종', 'upkind', upkindList, value: filter.upkind),
            _comboBox('시도', 'upr_cd', sidoList, value: filter.uprCd),
            _comboBox('시군구', 'org_cd', sigunguList, value: filter.orgCd),
            _comboBox(
              '보호소',
              'care_reg_no',
              shelterList,
              value: filter.careRegNo,
            ),
            _comboBox('품종', 'kind', kindList, value: filter.kind),
            _comboBoxString('상태', 'state', stateList, value: filter.state),
            _comboBoxString(
              '중성화',
              'neuter_yn',
              neuterList,
              value: filter.neuterYn,
            ),
            _comboBoxString('성별', 'sex_cd', sexList, value: filter.sexCd),
            _inputField('RFID', 'rfid_cd'),
            _inputField('유기번호', 'desertion_no'),
            _inputField('공고번호', 'notice_no'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(filter);
                },
                child: const Text('검색하기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
