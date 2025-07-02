import 'package:flutter/material.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';

class KindSelector extends StatelessWidget {
  final List<Map<String, dynamic>> kindList;
  final String? selectedKindCode;
  final Function(String?) onKindSelected;

  const KindSelector({
    super.key,
    required this.kindList,
    required this.selectedKindCode,
    required this.onKindSelected,
  });

  IconData _getKindIcon(String kindName) {
    switch (kindName) {
      case '개':
        return Icons.pets;
      case '고양이':
        return Icons.pets_outlined;
      case '기타':
        return Icons.pets;
      default:
        return Icons.pets;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kindList.isEmpty) return SizedBox.shrink();

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: kindList.length,
        itemBuilder: (context, index) {
          final kind = kindList[index];
          final code = kind['code']?.toString();
          final name = kind['name']?.toString() ?? '';
          final isSelected = selectedKindCode == code;
          final icon = _getKindIcon(name);

          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => onKindSelected(code),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.border,
                    width: 1,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      size: 16,
                      color: isSelected
                          ? Colors.white
                          : AppColors.textSecondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      name,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
