import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/features/pets/domain/entities/pet_search_filter.dart';
import '../../providers/pet_providers.dart';
import '../../providers/search_filter_provider.dart';
import 'widgets/pet_card.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/sido_selector.dart';
import 'widgets/search_conditions.dart';
import 'widgets/pet_list_item.dart';

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

    // 검색 조건 변경 시 시도 선택도 업데이트
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final filter = ref.read(searchFilterProvider);
      if (filter.uprCd != null && filter.uprCd != _selectedSidoCode) {
        setState(() {
          _selectedSidoCode = filter.uprCd;
        });
        _saveSidoCode(filter.uprCd);
      }
    });
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

  Future<void> _loadSavedSidoCode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCode = prefs.getString('selected_sido_code');
    if (savedCode != null) {
      setState(() {
        _selectedSidoCode = savedCode;
      });
    }
  }

  void _onSidoSelected(String? sidoCode) async {
    setState(() {
      _selectedSidoCode = sidoCode;
    });

    // SharedPreferences에 저장
    await _saveSidoCode(sidoCode);

    // 필터 업데이트
    final currentFilter = ref.read(searchFilterProvider);
    final newFilter = currentFilter.copyWith(uprCd: sidoCode);
    ref.read(searchFilterProvider.notifier).updateFilter(newFilter);

    // 펫 목록 새로고침
    ref.read(petsProvider.notifier).searchPets(newFilter);
  }

  Future<void> _saveSidoCode(String? sidoCode) async {
    final prefs = await SharedPreferences.getInstance();
    if (sidoCode != null) {
      await prefs.setString('selected_sido_code', sidoCode);
    } else {
      await prefs.remove('selected_sido_code');
    }
  }

  void _ensureSidoSelected(List<Map<String, dynamic>> sidoList) {
    if (_selectedSidoCode == null && sidoList.isNotEmpty) {
      final firstSidoCode = sidoList.first['code']?.toString();
      if (firstSidoCode != null) {
        _onSidoSelected(firstSidoCode);
      }
    }
  }

  void _removeCondition(int index, String condition) {
    final notifier = ref.read(searchFilterProvider.notifier);

    // 조건에 따라 해당 필드 삭제 (빈 문자열로 설정)
    if (condition.startsWith('축종:')) {
      notifier.setField('upkind', '');
    } else if (condition.startsWith('상태:')) {
      notifier.setField('state', '');
    } else if (condition.startsWith('중성화:')) {
      notifier.setField('neuter_yn', '');
    } else if (condition.startsWith('성별:')) {
      notifier.setField('sex_cd', '');
    } else if (condition.startsWith('구조일자:')) {
      notifier.setField('bgnde', '');
      notifier.setField('endde', '');
    }

    // 검색 실행
    // ref.read(petsProvider.notifier).searchPets(newFilter);
  }

  @override
  Widget build(BuildContext context) {
    final petsAsync = ref.watch(petsProvider);
    final filter = ref.watch(searchFilterProvider);
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
                ref.read(searchFilterProvider.notifier).updateFilter(result);
                await ref.read(petsProvider.notifier).searchPets(result);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 시도 선택기
          SidoSelector(
            sidoList: dropdownData['sido'] ?? [],
            selectedSidoCode: _selectedSidoCode,
            onSidoSelected: _onSidoSelected,
          ),
          // 검색 조건 표시
          SearchConditions(onRemoveCondition: _removeCondition),
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
                      return PetListItem(
                        pet: pet,
                        onTap: () {
                          context.push('/pets/detail', extra: pet);
                        },
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
