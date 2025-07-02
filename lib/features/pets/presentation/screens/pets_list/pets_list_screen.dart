import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/features/pets/domain/entities/pet_search_filter.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import '../../providers/pet_providers.dart';
import '../../providers/search_filter_provider.dart';
import 'widgets/pet_card.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/sido_selector.dart';
import 'widgets/kind_selector.dart';
import 'widgets/search_conditions.dart';
import 'widgets/pet_list_item.dart';

// 뷰 타입을 관리하는 프로바이더
final viewTypeProvider = StateProvider<ViewType>((ref) => ViewType.grid);

enum ViewType { list, grid }

class PetsListScreen extends ConsumerStatefulWidget {
  const PetsListScreen({super.key});

  @override
  ConsumerState<PetsListScreen> createState() => _PetsListScreenState();
}

class _PetsListScreenState extends ConsumerState<PetsListScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;
  String? _selectedSidoCode;
  String? _selectedKindCode;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadSavedSidoCode();
    _loadSavedKindCode();
    _loadSavedViewType();

    // 검색 조건 변경 시 시도 선택도 업데이트
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ensureSidoSelectedAndSearch();
      _ensureKindSelectedAndSearch();
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
    } else {
      // 저장된 시도 코드가 없으면 기본 시도(서울특별시)로 설정
      setState(() {
        _selectedSidoCode = '6110000';
      });
      await _saveSidoCode('6110000');
    }
  }

  Future<void> _loadSavedKindCode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCode = prefs.getString('selected_kind_code');
    if (savedCode != null) {
      setState(() {
        _selectedKindCode = savedCode;
      });
    } else {
      // 저장된 축종 코드가 없으면 기본 축종(개)으로 설정
      setState(() {
        _selectedKindCode = '417000';
      });
      await _saveKindCode('417000');
    }
  }

  Future<void> _loadSavedViewType() async {
    final prefs = await SharedPreferences.getInstance();
    final savedViewType = prefs.getString('view_type');
    if (savedViewType != null) {
      final viewType = savedViewType == 'list' ? ViewType.list : ViewType.grid;
      ref.read(viewTypeProvider.notifier).state = viewType;
    } else {
      // 저장된 뷰 타입이 없으면 기본값(그리드)으로 설정
      ref.read(viewTypeProvider.notifier).state = ViewType.grid;
      await _saveViewType(ViewType.grid);
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

  void _onKindSelected(String? kindCode) async {
    setState(() {
      _selectedKindCode = kindCode;
    });

    // SharedPreferences에 저장
    await _saveKindCode(kindCode);

    // 필터 업데이트
    final currentFilter = ref.read(searchFilterProvider);
    final newFilter = currentFilter.copyWith(upkind: kindCode);
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

  Future<void> _saveKindCode(String? kindCode) async {
    final prefs = await SharedPreferences.getInstance();
    if (kindCode != null) {
      await prefs.setString('selected_kind_code', kindCode);
    } else {
      await prefs.remove('selected_kind_code');
    }
  }

  Future<void> _saveViewType(ViewType viewType) async {
    final prefs = await SharedPreferences.getInstance();
    final viewTypeString = viewType == ViewType.list ? 'list' : 'grid';
    await prefs.setString('view_type', viewTypeString);
  }

  void _ensureSidoSelectedAndSearch() {
    final dropdownData = ref.read(dropdownDataProvider);
    final sidoList = dropdownData['sido'] ?? [];

    // 저장된 시도 코드가 있으면 사용
    if (_selectedSidoCode != null) {
      final currentFilter = ref.read(searchFilterProvider);
      if (currentFilter.uprCd != _selectedSidoCode) {
        final newFilter = currentFilter.copyWith(uprCd: _selectedSidoCode);
        ref.read(searchFilterProvider.notifier).updateFilter(newFilter);
        ref.read(petsProvider.notifier).searchPets(newFilter);
      }
    }
    // 저장된 시도 코드가 없고 시도 리스트가 있으면 첫 번째 시도로 설정
    else if (sidoList.isNotEmpty) {
      final firstSidoCode = sidoList.first['code']?.toString();
      if (firstSidoCode != null) {
        _onSidoSelected(firstSidoCode);
      }
    }
    // 시도 리스트가 비어있으면 기본 시도(서울특별시)로 설정
    else {
      _onSidoSelected('6110000');
    }
  }

  void _ensureKindSelectedAndSearch() {
    final dropdownData = ref.read(dropdownDataProvider);
    final kindList = dropdownData['upkind'] ?? [];

    // 저장된 축종 코드가 있으면 사용
    if (_selectedKindCode != null) {
      final currentFilter = ref.read(searchFilterProvider);
      if (currentFilter.upkind != _selectedKindCode) {
        final newFilter = currentFilter.copyWith(upkind: _selectedKindCode);
        ref.read(searchFilterProvider.notifier).updateFilter(newFilter);
        ref.read(petsProvider.notifier).searchPets(newFilter);
      }
    }
    // 저장된 축종 코드가 없고 축종 리스트가 있으면 첫 번째 축종으로 설정
    else if (kindList.isNotEmpty) {
      final firstKindCode = kindList.first['code']?.toString();
      if (firstKindCode != null) {
        _onKindSelected(firstKindCode);
      }
    }
    // 축종 리스트가 비어있으면 기본 축종(개)으로 설정
    else {
      _onKindSelected('417000');
    }
  }

  void _removeCondition(int index, String condition) {
    final notifier = ref.read(searchFilterProvider.notifier);

    // 조건에 따라 해당 필드 삭제 (빈 문자열로 설정)
    if (condition.startsWith('상태:')) {
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

  Widget _buildDrawer() {
    final viewType = ref.watch(viewTypeProvider);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.tossBlue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.pets, color: Colors.white, size: 48),
                const SizedBox(height: 8),
                const Text(
                  'Paws for Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '구조동물 찾기',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.grid_view, color: AppColors.textPrimary),
            title: const Text('그리드 보기'),
            selected: viewType == ViewType.grid,
            selectedTileColor: AppColors.tossBlue.withOpacity(0.1),
            onTap: () async {
              ref.read(viewTypeProvider.notifier).state = ViewType.grid;
              await _saveViewType(ViewType.grid);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.view_list, color: AppColors.textPrimary),
            title: const Text('리스트 보기'),
            selected: viewType == ViewType.list,
            selectedTileColor: AppColors.tossBlue.withOpacity(0.1),
            onTap: () async {
              ref.read(viewTypeProvider.notifier).state = ViewType.list;
              await _saveViewType(ViewType.list);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: AppColors.tossBlue),
            title: const Text('관심 동물'),
            onTap: () {
              Navigator.pop(context);
              Future.delayed(const Duration(milliseconds: 250), () {
                context.push('/pets/favorites');
              });
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.settings, color: AppColors.textPrimary),
            title: const Text('설정'),
            onTap: () {
              Navigator.pop(context);
              // TODO: 설정 화면으로 이동
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: AppColors.textPrimary),
            title: const Text('정보'),
            onTap: () {
              Navigator.pop(context);
              // TODO: 정보 화면으로 이동
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPetList(List<AbandonmentItem> pets) {
    final viewType = ref.watch(viewTypeProvider);

    if (viewType == ViewType.grid) {
      return MasonryGridView.count(
        controller: _scrollController,
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(12),
        itemCount: pets.length + (_isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == pets.length) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                  strokeCap: StrokeCap.round,
                ),
              ),
            );
          }

          final pet = pets[index];
          return PetCard(pet: pet);
        },
      );
    } else {
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
                  strokeCap: StrokeCap.round,
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final petsAsync = ref.watch(petsProvider);
    final filter = ref.watch(searchFilterProvider);
    final dropdownData = ref.watch(dropdownDataProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: _buildDrawer(),
      appBar: MorphingAppBar(
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
            key: const ValueKey('search'),
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
          // 축종 선택기
          KindSelector(
            kindList: dropdownData['upkind'] ?? [],
            selectedKindCode: _selectedKindCode,
            onKindSelected: _onKindSelected,
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

                  return _buildPetList(pets);
                },
                loading: () => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: AppColors.primary,
                        strokeCap: StrokeCap.round,
                      ),
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
