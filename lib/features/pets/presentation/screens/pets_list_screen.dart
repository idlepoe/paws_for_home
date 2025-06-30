import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/features/pets/domain/entities/pet_search_filter.dart';
import '../providers/pet_providers.dart';
import '../providers/search_filter_provider.dart';
import '../widgets/pet_card.dart';
import 'pet_detail_screen.dart';
import 'search_filter_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetsListScreen extends ConsumerStatefulWidget {
  const PetsListScreen({super.key});

  @override
  ConsumerState<PetsListScreen> createState() => _PetsListScreenState();
}

class _PetsListScreenState extends ConsumerState<PetsListScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;
  String? _selectedSidoCode;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadSavedSidoCode();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMorePets();
    }
  }

  Future<void> _loadMorePets() async {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    try {
      await ref.read(petsProvider.notifier).loadMorePets();
    } finally {
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  Future<void> _refreshPets() async {
    await ref.read(petsProvider.notifier).refreshPets();
  }

  void _onSidoSelected(String? sidoCode) async {
    setState(() {
      _selectedSidoCode = sidoCode;
    });

    // SharedPreferences에 저장
    await _saveSidoCode(sidoCode);

    // 필터 업데이트
    final currentFilter = ref.read(petSearchFilterProvider);
    final newFilter = currentFilter.copyWith(uprCd: sidoCode);
    ref.read(petSearchFilterProvider.notifier).updateFilter(newFilter);

    // 펫 목록 새로고침
    ref.read(petsProvider.notifier).searchPets(newFilter);
  }

  Future<void> _loadSavedSidoCode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCode = prefs.getString('selected_sido_code');
    if (savedCode != null) {
      setState(() {
        _selectedSidoCode = savedCode;
      });
    }
  }

  Future<void> _saveSidoCode(String? sidoCode) async {
    final prefs = await SharedPreferences.getInstance();
    if (sidoCode != null) {
      await prefs.setString('selected_sido_code', sidoCode);
    } else {
      await prefs.remove('selected_sido_code');
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

  Widget _buildSidoSelector(List<Map<String, dynamic>> sidoList) {
    if (sidoList.isEmpty) return SizedBox.shrink();

    // 기본값 설정 (첫 번째 시도)
    if (_selectedSidoCode == null && sidoList.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _onSidoSelected(sidoList.first['code']?.toString());
      });
    }

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
          final isSelected = _selectedSidoCode == code;
          final icon = _getSidoIcon(name);

          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => _onSidoSelected(code),
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

  @override
  Widget build(BuildContext context) {
    final petsAsync = ref.watch(petsProvider);
    final filter = ref.watch(petSearchFilterProvider);
    final dropdownData = ref.watch(dropdownDataProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          '구조동물 목록',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColors.tossBlue),
            onPressed: () async {
              final result = await context.push<PetSearchFilter>(
                '/pets/filter',
                extra: filter,
              );
              if (result != null) {
                ref.read(petSearchFilterProvider.notifier).updateFilter(result);
                await ref.read(petsProvider.notifier).searchPets(result);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 시도 선택기
          _buildSidoSelector(dropdownData['sido'] ?? []),
          // 펫 목록
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshPets,
              color: AppColors.primary,
              child: petsAsync.when(
                data: (pets) {
                  if (pets.isEmpty) {
                    return ListView(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 64,
                                color: AppColors.textSecondary,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '검색 결과가 없습니다',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '검색 조건을 변경해보세요',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  return ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: pets.length + (_isLoadingMore ? 1 : 0),
                    separatorBuilder: (_, __) => SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      if (index == pets.length) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      }

                      final pet = pets[index];
                      return GestureDetector(
                        onTap: () {
                          context.push('/pets/detail', extra: pet);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadow,
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl: pet.popfile1 ?? '',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    width: 80,
                                    height: 80,
                                    color: AppColors.divider,
                                    child: Icon(
                                      Icons.image,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                        width: 80,
                                        height: 80,
                                        color: AppColors.gray,
                                        child: Icon(
                                          Icons.error,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        pet.kindFullNm ?? '품종 미상',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        '발견장소: ${pet.happenPlace ?? '-'}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.textSecondary,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        '보호소: ${pet.careNm ?? '-'}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.tossBlue,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Icon(Icons.chevron_right, color: AppColors.gray),
                              SizedBox(width: 8),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                loading: () => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: AppColors.primary),
                      const SizedBox(height: 16),
                      Text(
                        '펫 목록을 불러오는 중...',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                error: (error, stack) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: AppColors.error,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '오류가 발생했습니다',
                        style: TextStyle(
                          color: AppColors.error,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        error.toString(),
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _refreshPets,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('다시 시도'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
