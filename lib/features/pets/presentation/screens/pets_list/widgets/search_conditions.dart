import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/features/pets/presentation/providers/search_filter_provider.dart';

class SearchConditions extends ConsumerWidget {
  final Function(int, String) onRemoveCondition;

  const SearchConditions({super.key, required this.onRemoveCondition});

  String _formatDate(String dateStr) {
    if (dateStr.isEmpty) return '-';
    try {
      // YYYYMMDD 형식을 YYYY-MM-DD로 변환
      if (dateStr.length == 8) {
        return '${dateStr.substring(0, 4)}-${dateStr.substring(4, 6)}-${dateStr.substring(6, 8)}';
      }
      return dateStr;
    } catch (e) {
      return dateStr;
    }
  }

  String _getUpkindName(String code) {
    switch (code) {
      case '417000':
        return '개';
      case '422400':
        return '고양이';
      case '429900':
        return '기타';
      default:
        return '';
    }
  }

  String _getStateName(String code) {
    switch (code) {
      case 'notice':
        return '공고중';
      case 'protect':
        return '보호중';
      case 'finish':
        return '보호종료';
      default:
        return '';
    }
  }

  String _getNeuterName(String code) {
    switch (code) {
      case 'Y':
        return '예';
      case 'N':
        return '아니오';
      case 'U':
        return '미상';
      default:
        return '';
    }
  }

  String _getSexName(String code) {
    switch (code) {
      case 'M':
        return '수컷';
      case 'F':
        return '암컷';
      case 'Q':
        return '미상';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(searchFilterProvider);
    final conditions = <String>[];

    // 축종 조건
    if (filter.upkind != null) {
      final upkindName = _getUpkindName(filter.upkind!);
      if (upkindName.isNotEmpty) {
        conditions.add('축종: $upkindName');
      }
    }

    // 상태 조건
    if (filter.state != null) {
      final stateName = _getStateName(filter.state!);
      if (stateName.isNotEmpty) {
        conditions.add('상태: $stateName');
      }
    }

    // 중성화 조건
    if (filter.neuterYn != null) {
      final neuterName = _getNeuterName(filter.neuterYn!);
      if (neuterName.isNotEmpty) {
        conditions.add('중성화: $neuterName');
      }
    }

    // 성별 조건
    if (filter.sexCd != null) {
      final sexName = _getSexName(filter.sexCd!);
      if (sexName.isNotEmpty) {
        conditions.add('성별: $sexName');
      }
    }

    // 구조일자 조건
    if (filter.bgnde != null &&
        filter.endde != null &&
        filter.bgnde!.isNotEmpty &&
        filter.endde!.isNotEmpty) {
      conditions.add(
        '구조일자: ${_formatDate(filter.bgnde!)} ~ ${_formatDate(filter.endde!)}',
      );
    }

    if (conditions.isEmpty) return SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(
            '검색 조건',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: conditions.asMap().entries.map((entry) {
                  final index = entry.key;
                  final condition = entry.value;
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => onRemoveCondition(index, condition),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.tossBlue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.tossBlue.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              condition,
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.tossBlue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.close,
                              size: 14,
                              color: AppColors.tossBlue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
