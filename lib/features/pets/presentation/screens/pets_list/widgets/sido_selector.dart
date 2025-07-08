import 'package:flutter/material.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';

class SidoSelector extends StatefulWidget {
  final List<Map<String, dynamic>> sidoList;
  final String? selectedSidoCode;
  final Function(String?) onSidoSelected;

  const SidoSelector({
    super.key,
    required this.sidoList,
    required this.selectedSidoCode,
    required this.onSidoSelected,
  });

  @override
  State<SidoSelector> createState() => _SidoSelectorState();
}

class _SidoSelectorState extends State<SidoSelector> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // 위젯이 빌드된 후 선택된 시도까지 스크롤
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedSido();
    });
  }

  @override
  void didUpdateWidget(SidoSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 선택된 시도가 변경되면 해당 위치로 스크롤
    if (oldWidget.selectedSidoCode != widget.selectedSidoCode) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToSelectedSido();
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSelectedSido() {
    if (widget.selectedSidoCode == null || widget.sidoList.isEmpty) return;

    // 선택된 시도의 인덱스 찾기
    final selectedIndex = widget.sidoList.indexWhere(
      (sido) => sido['code']?.toString() == widget.selectedSidoCode,
    );

    if (selectedIndex != -1 && _scrollController.hasClients) {
      // 더 정확한 스크롤을 위해 약간의 지연 후 실행
      Future.delayed(const Duration(milliseconds: 100), () {
        if (!mounted || !_scrollController.hasClients) return;

        // 아이템의 대략적인 너비 계산 (패딩, 마진 포함)
        const itemWidth = 120.0; // 대략적인 아이템 너비
        const margin = 12.0; // 아이템 간 마진
        const padding = 16.0; // ListView 패딩

        // 선택된 아이템의 위치 계산
        final targetOffset = (itemWidth + margin) * selectedIndex - padding;

        // 화면 중앙에 오도록 조정
        final screenWidth = MediaQuery.of(context).size.width;
        final adjustedOffset = targetOffset - (screenWidth - itemWidth) / 2;

        // 스크롤 실행
        _scrollController.animateTo(
          adjustedOffset.clamp(0.0, _scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

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
    if (widget.sidoList.isEmpty) return SizedBox.shrink();

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: widget.sidoList.length,
        itemBuilder: (context, index) {
          final sido = widget.sidoList[index];
          final code = sido['code']?.toString();
          final name = sido['name']?.toString() ?? '';
          final isSelected = widget.selectedSidoCode == code;
          final icon = _getSidoIcon(name);

          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => widget.onSidoSelected(code),
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
