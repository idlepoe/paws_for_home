import 'package:flutter/material.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';

class StateSelector extends StatelessWidget {
  final String? selectedStateCode;
  final Function(String?) onStateSelected;

  const StateSelector({
    super.key,
    required this.selectedStateCode,
    required this.onStateSelected,
  });

  IconData _getStateIcon(String stateName) {
    switch (stateName) {
      case '공고중':
        return Icons.announcement;
      case '보호중':
        return Icons.favorite;
      case '보호종료':
        return Icons.check_circle;
      default:
        return Icons.info;
    }
  }

  List<Map<String, String>> get stateList => [
    {'code': 'notice', 'name': '공고중'},
    {'code': 'protect', 'name': '보호중'},
    {'code': 'finish', 'name': '보호종료'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: stateList.length,
        itemBuilder: (context, index) {
          final state = stateList[index];
          final code = state['code']!;
          final name = state['name']!;
          final isSelected = selectedStateCode == code;
          final icon = _getStateIcon(name);

          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => onStateSelected(isSelected ? null : code),
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
                            offset: const Offset(0, 2),
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
