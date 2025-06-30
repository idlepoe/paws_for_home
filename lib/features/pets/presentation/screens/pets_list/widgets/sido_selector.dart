import 'package:flutter/material.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';

class SidoSelector extends StatelessWidget {
  final List<Map<String, dynamic>> sidoList;
  final String? selectedSidoCode;
  final Function(String?) onSidoSelected;

  const SidoSelector({
    super.key,
    required this.sidoList,
    required this.selectedSidoCode,
    required this.onSidoSelected,
  });

  IconData _getSidoIcon(String sidoName) {
    switch (sidoName) {
      case '서울특별시':
        return Icons.location_city;
      case '부산광역시':
        return Icons.beach_access;
      case '대구광역시':
        return Icons.landscape;
      case '인천광역시':
        return Icons.water;
      case '광주광역시':
        return Icons.wb_sunny;
      case '대전광역시':
        return Icons.forest;
      case '울산광역시':
        return Icons.factory;
      case '세종특별자치시':
        return Icons.account_balance;
      case '경기도':
        return Icons.home;
      case '강원도':
        return Icons.ac_unit;
      case '충청북도':
        return Icons.terrain;
      case '충청남도':
        return Icons.agriculture;
      case '전라북도':
        return Icons.grass;
      case '전라남도':
        return Icons.local_florist;
      case '경상북도':
        return Icons.landscape;
      case '경상남도':
        return Icons.sailing;
      case '제주특별자치도':
        return Icons.volcano;
      default:
        return Icons.location_on;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (sidoList.isEmpty) return SizedBox.shrink();

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: sidoList.length,
        itemBuilder: (context, index) {
          final sido = sidoList[index];
          final code = sido['code']?.toString();
          final name = sido['name']?.toString() ?? '';
          final isSelected = selectedSidoCode == code;
          final icon = _getSidoIcon(name);

          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => onSidoSelected(code),
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
