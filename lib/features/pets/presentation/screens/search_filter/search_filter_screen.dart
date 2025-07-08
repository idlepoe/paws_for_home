import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:logger/logger.dart';
import '../../../domain/entities/pet_search_filter.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/shared/models/sido_response.dart';
import 'package:paws_for_home/shared/models/sigungu_response.dart';
import 'package:paws_for_home/shared/models/shelter_response.dart';
import 'package:paws_for_home/shared/models/kind_response.dart';
import 'package:paws_for_home/features/pets/presentation/providers/search_filter_provider.dart';

final logger = Logger();

class SearchFilterScreen extends ConsumerWidget {
  const SearchFilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(searchFilterProvider);
    final dropdownData = ref.watch(dropdownDataProvider);
    final filterNotifier = ref.read(searchFilterProvider.notifier);

    // 현재 선택된 시도가 없으면 목록에서 선택된 시도를 가져옴
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (filter.uprCd == null) {
        final prefs = SharedPreferences.getInstance();
        prefs.then((prefs) {
          final savedSidoCode = prefs.getString('selected_sido_code');
          if (savedSidoCode != null) {
            filterNotifier.setField('upr_cd', savedSidoCode);
          }
        });
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '검색 조건',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          key: const ValueKey('back'),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            key: const ValueKey('reset'),
            onPressed: () {
              filterNotifier.reset();
            },
            child: const Text(
              '초기화',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 구조일자 선택
            _buildDateRangePicker(context, filter, filterNotifier),
            const SizedBox(height: 24),

            // 시도 선택
            _buildDropdown(
              context,
              ref,
              '시도',
              'upr_cd',
              filter.uprCd,
              dropdownData['sido'] ?? [],
              filterNotifier,
            ),
            const SizedBox(height: 16),

            // 축종 선택
            _buildDropdown(
              context,
              ref,
              '축종',
              'upkind',
              filter.upkind,
              dropdownData['upkind'] ?? [],
              filterNotifier,
            ),
            const SizedBox(height: 16),

            // 품종 선택 (축종에 따라 동적 표시)
            if (filter.upkind != null && filter.upkind!.isNotEmpty)
              _buildKindDropdown(
                context,
                ref,
                filter,
                dropdownData,
                filterNotifier,
              ),
            if (filter.upkind != null && filter.upkind!.isNotEmpty)
              const SizedBox(height: 16),

            // 상태 선택
            _buildDropdown(
              context,
              ref,
              '상태',
              'state',
              filter.state,
              dropdownData['state'] ?? [],
              filterNotifier,
            ),
            const SizedBox(height: 16),

            // 중성화 여부
            _buildDropdown(
              context,
              ref,
              '중성화',
              'neuter_yn',
              filter.neuterYn,
              dropdownData['neuter'] ?? [],
              filterNotifier,
            ),
            const SizedBox(height: 16),

            // 성별
            _buildDropdown(
              context,
              ref,
              '성별',
              'sex_cd',
              filter.sexCd,
              dropdownData['sex'] ?? [],
              filterNotifier,
            ),
            const SizedBox(height: 32),

            // 검색 버튼
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // 시도가 선택되지 않았으면 첫 번째 시도를 기본값으로 설정
                  final currentFilter = ref.read(searchFilterProvider);
                  if (currentFilter.uprCd == null &&
                      dropdownData['sido']?.isNotEmpty == true) {
                    final firstSidoCode = dropdownData['sido']!.first['code']
                        ?.toString();
                    if (firstSidoCode != null) {
                      filterNotifier.setField('upr_cd', firstSidoCode);
                    }
                  }

                  final finalFilter = ref.read(searchFilterProvider);
                  Navigator.of(context).pop(finalFilter);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  '검색하기',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _comboBox(
    BuildContext context,
    WidgetRef ref,
    String label,
    String key,
    List<Map<String, dynamic>> items, {
    String? value,
  }) {
    // 중복 제거 및 안전한 items 생성
    final safeItems = <DropdownMenuItem<String?>>[];
    safeItems.add(
      DropdownMenuItem<String?>(
        value: '',
        child: Text('선택 안함', style: TextStyle(color: AppColors.textSecondary)),
      ),
    );

    final seenValues = <String?>{''};
    for (final item in items) {
      final code = item['code']?.toString();
      if (!seenValues.contains(code)) {
        seenValues.add(code);
        safeItems.add(
          DropdownMenuItem<String?>(
            value: code,
            child: Text(item['name']?.toString() ?? code ?? ''),
          ),
        );
      }
    }

    // value가 items에 존재하는지 확인
    final safeValue = value == null || value.isEmpty
        ? ''
        : (seenValues.contains(value) ? value : '');

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String?>(
        value: safeValue,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primary),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        dropdownColor: Colors.white,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        items: safeItems,
        onChanged: (v) async {
          // 빈 문자열도 그대로 저장
          ref.read(searchFilterProvider.notifier).setField(key, v);

          // 시도 선택 시 SharedPreferences에 저장하여 목록 화면과 동기화
          if (key == 'upr_cd') {
            final prefs = await SharedPreferences.getInstance();
            if (v != null && v.isNotEmpty) {
              await prefs.setString('selected_sido_code', v);
            } else {
              await prefs.remove('selected_sido_code');
            }
          }
        },
      ),
    );
  }

  Widget _comboBoxString(
    BuildContext context,
    WidgetRef ref,
    String label,
    String key,
    List<Map<String, String?>> items, {
    String? value,
  }) {
    // 중복 제거 및 안전한 items 생성
    final safeItems = <DropdownMenuItem<String?>>[];
    safeItems.add(
      DropdownMenuItem<String?>(
        value: '',
        child: Text('선택 안함', style: TextStyle(color: AppColors.textSecondary)),
      ),
    );

    final seenValues = <String?>{''};
    for (final item in items) {
      final code = item['code'];
      if (!seenValues.contains(code)) {
        seenValues.add(code);
        safeItems.add(
          DropdownMenuItem<String?>(
            value: code,
            child: Text(item['name'] ?? ''),
          ),
        );
      }
    }

    // value가 items에 존재하는지 확인
    final safeValue = value == null || value.isEmpty
        ? ''
        : (seenValues.contains(value) ? value : '');

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String?>(
        value: safeValue,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primary),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        dropdownColor: Colors.white,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        items: safeItems,
        onChanged: (v) async {
          // 빈 문자열도 그대로 저장
          ref.read(searchFilterProvider.notifier).setField(key, v);

          // 시도 선택 시 SharedPreferences에 저장하여 목록 화면과 동기화
          if (key == 'upr_cd') {
            final prefs = await SharedPreferences.getInstance();
            if (v != null && v.isNotEmpty) {
              await prefs.setString('selected_sido_code', v);
            } else {
              await prefs.remove('selected_sido_code');
            }
          }
        },
      ),
    );
  }

  Widget _buildDateRangePicker(
    BuildContext context,
    PetSearchFilter filter,
    SearchFilterNotifier notifier,
  ) {
    String? start = filter.bgnde;
    String? end = filter.endde;
    String display = (start != null && end != null)
        ? '$start ~ $end'
        : '기간을 선택하세요';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
                  primary: AppColors.primary,
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: AppColors.textPrimary,
                ),
              ),
              child: child!,
            ),
          );
          if (picked != null) {
            notifier.setDateRange(picked);
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: '구조일자',
            labelStyle: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.date_range, color: AppColors.primary, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  display,
                  style: TextStyle(
                    fontSize: 16,
                    color: (start != null && end != null)
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (start != null && end != null)
                IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () {
                    notifier.setDateRange(null);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(
    BuildContext context,
    WidgetRef ref,
    String label,
    String key, {
    String? hint,
    TextInputType? type,
  }) {
    final filter = ref.watch(searchFilterProvider);
    final currentValue = filter.toQuery()[key] ?? '';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        initialValue: currentValue,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primary),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        onChanged: (v) {
          ref
              .read(searchFilterProvider.notifier)
              .setField(key, v.isEmpty ? null : v);
        },
      ),
    );
  }

  Widget _buildDropdown(
    BuildContext context,
    WidgetRef ref,
    String label,
    String key,
    String? value,
    List<Map<String, dynamic>> items,
    SearchFilterNotifier notifier,
  ) {
    // 중복 제거 및 안전한 items 생성
    final safeItems = <DropdownMenuItem<String?>>[];

    // 축종 선택 시에는 '선택 안함' 옵션을 제거
    if (key != 'upkind') {
      safeItems.add(
        DropdownMenuItem<String?>(
          value: '',
          child: Text(
            '선택 안함',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ),
      );
    }

    final seenValues = <String?>{key != 'upkind' ? '' : null};
    for (final item in items) {
      final code = item['code']?.toString();
      if (!seenValues.contains(code)) {
        seenValues.add(code);
        safeItems.add(
          DropdownMenuItem<String?>(
            value: code,
            child: Text(item['name']?.toString() ?? code ?? ''),
          ),
        );
      }
    }

    // 축종 선택 시 기본값 설정
    String? safeValue;
    if (key == 'upkind') {
      // 축종이 선택되지 않았거나 빈 값이면 첫 번째 축종을 기본값으로 설정
      if (value == null || value.isEmpty) {
        if (items.isNotEmpty) {
          final firstCode = items.first['code']?.toString();
          if (firstCode != null) {
            safeValue = firstCode;
            // 기본값을 필터에 설정
            WidgetsBinding.instance.addPostFrameCallback((_) {
              notifier.setField(key, firstCode);
            });
          }
        }
      } else {
        safeValue = seenValues.contains(value) ? value : null;
      }
    } else {
      // 다른 필드들은 기존 로직 유지
      safeValue = value == null || value.isEmpty
          ? ''
          : (seenValues.contains(value) ? value : '');
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String?>(
        value: safeValue,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primary),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        dropdownColor: Colors.white,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        items: safeItems,
        onChanged: (v) async {
          // 빈 문자열도 그대로 저장
          ref.read(searchFilterProvider.notifier).setField(key, v);

          // 시도 선택 시 SharedPreferences에 저장하여 목록 화면과 동기화
          if (key == 'upr_cd') {
            final prefs = await SharedPreferences.getInstance();
            if (v != null && v.isNotEmpty) {
              await prefs.setString('selected_sido_code', v);
            } else {
              await prefs.remove('selected_sido_code');
            }
          }

          // 축종 선택 시 SharedPreferences에 저장하여 목록 화면과 동기화
          if (key == 'upkind') {
            final prefs = await SharedPreferences.getInstance();
            if (v != null && v.isNotEmpty) {
              await prefs.setString('selected_kind_code', v);
            } else {
              await prefs.remove('selected_kind_code');
            }
          }
        },
      ),
    );
  }

  Widget _buildKindDropdown(
    BuildContext context,
    WidgetRef ref,
    PetSearchFilter filter,
    Map<String, dynamic> dropdownData,
    SearchFilterNotifier notifier,
  ) {
    // 선택된 축종에 따른 품종 데이터 가져오기
    final kindData =
        dropdownData['kind_data'] as Map<String, List<Map<String, dynamic>>>?;
    final selectedUpkind = filter.upkind;

    if (kindData == null ||
        selectedUpkind == null ||
        !kindData.containsKey(selectedUpkind)) {
      return const SizedBox.shrink();
    }

    final kindList = kindData[selectedUpkind] ?? [];
    final currentKind = filter.kind;

    // 중복 제거 및 안전한 items 생성
    final safeItems = <Map<String, dynamic>>[];
    for (final item in kindList) {
      final code = item['code']?.toString();
      final name = item['name']?.toString() ?? code ?? '';
      if (code != null &&
          !safeItems.any((element) => element['code'] == code)) {
        safeItems.add({'code': code, 'name': name});
      }
    }

    // 현재 선택된 값 찾기
    Map<String, dynamic>? selectedItem;
    if (currentKind != null && currentKind.isNotEmpty) {
      selectedItem = safeItems.firstWhere(
        (item) => item['code'] == currentKind,
        orElse: () => {'code': '', 'name': ''},
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<String?>(
              value: currentKind,
              isExpanded: true,
              menuMaxHeight: MediaQuery.of(context).size.height * 0.3,
              decoration: InputDecoration(
                labelText: '품종',
                labelStyle: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              dropdownColor: Colors.white,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              items: [
                DropdownMenuItem<String?>(
                  value: '',
                  child: Text(
                    '선택 안함',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ),
                ...safeItems.map(
                  (item) => DropdownMenuItem<String?>(
                    value: item['code']?.toString(),
                    child: Text(item['name']?.toString() ?? ''),
                  ),
                ),
              ],
              onChanged: (String? value) {
                ref.read(searchFilterProvider.notifier).setField('kind', value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
