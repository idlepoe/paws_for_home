import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/features/pets/presentation/providers/search_filter_provider.dart';

class FilterDropdown extends ConsumerWidget {
  final String label;
  final String fieldKey;
  final String? value;
  final List<Map<String, dynamic>> items;

  const FilterDropdown({
    super.key,
    required this.label,
    required this.fieldKey,
    required this.value,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    final safeValue = value == null || value!.isEmpty
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
          ref.read(searchFilterProvider.notifier).setField(fieldKey, v);

          // 시도 선택 시 SharedPreferences에 저장하여 목록 화면과 동기화
          if (fieldKey == 'upr_cd') {
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
}
