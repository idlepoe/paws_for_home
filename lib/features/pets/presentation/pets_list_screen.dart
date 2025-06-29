import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paws_for_home/core/services/abandonment_api_service.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'pet_detail_screen.dart';

// API 서비스 프로바이더
final apiServiceProvider = Provider<AbandonmentApiService>((ref) {
  return AbandonmentApiService();
});

// 간단한 상태 관리
final petsProvider =
    StateNotifierProvider<PetsNotifier, AsyncValue<List<AbandonmentItem>>>((
      ref,
    ) {
      final apiService = ref.watch(apiServiceProvider);
      return PetsNotifier(apiService);
    });

class PetsNotifier extends StateNotifier<AsyncValue<List<AbandonmentItem>>> {
  final AbandonmentApiService _apiService;
  int _page = 1;
  bool _hasMore = true;
  bool _isLoading = false;
  List<AbandonmentItem> _allPets = [];

  PetsNotifier(this._apiService) : super(const AsyncValue.loading()) {
    _loadPets(reset: true);
  }

  Future<void> _loadPets({bool reset = false}) async {
    if (_isLoading) return;
    _isLoading = true;
    try {
      if (reset) {
        _page = 1;
        _hasMore = true;
        _allPets = [];
        state = const AsyncValue.loading();
      }
      final response = await _apiService.getAbandonmentData(
        numOfRows: '10',
        pageNo: _page.toString(),
      );
      List<AbandonmentItem> pets = [];
      if (response['response'] != null) {
        final body = response['response']['body'];
        if (body != null && body['items'] != null) {
          final items = body['items']['item'];
          if (items != null) {
            if (items is List) {
              pets = items
                  .map(
                    (item) => AbandonmentItem.fromJson(
                      Map<String, dynamic>.from(item),
                    ),
                  )
                  .toList();
            } else {
              pets = [
                AbandonmentItem.fromJson(Map<String, dynamic>.from(items)),
              ];
            }
          }
        }
      }
      if (reset) {
        _allPets = pets;
      } else {
        _allPets.addAll(pets);
      }
      // 더 이상 데이터가 없으면 _hasMore false
      _hasMore = pets.isNotEmpty && pets.length == 10;
      state = AsyncValue.data(_allPets);
      _page++;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    } finally {
      _isLoading = false;
    }
  }

  Future<void> refresh() async {
    await _loadPets(reset: true);
  }

  Future<void> loadMore() async {
    if (_hasMore && !_isLoading) {
      await _loadPets();
    }
  }

  bool get hasMore => _hasMore;
  bool get isLoading => _isLoading;
}

class PetsListScreen extends ConsumerStatefulWidget {
  const PetsListScreen({super.key});

  @override
  ConsumerState<PetsListScreen> createState() => _PetsListScreenState();
}

class _PetsListScreenState extends ConsumerState<PetsListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final notifier = ref.read(petsProvider.notifier);
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (notifier.hasMore && !notifier.isLoading) {
        notifier.loadMore();
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final petsAsync = ref.watch(petsProvider);
    final notifier = ref.read(petsProvider.notifier);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '구조동물 목록',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: theme.colorScheme.background,
        foregroundColor: theme.colorScheme.primary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => notifier.refresh(),
          ),
        ],
      ),
      body: Container(
        color: theme.colorScheme.background,
        child: RefreshIndicator(
          onRefresh: () => notifier.refresh(),
          child: petsAsync.when(
            data: (pets) {
              if (pets.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.pets, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        '구조동물이 없습니다',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: pets.length + (notifier.hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == pets.length) {
                    // 로딩 인디케이터 (무한 스크롤)
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  final pet = pets[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => PetDetailScreen(item: pet),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: theme.colorScheme.surface,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (pet.popfile1 != null && pet.popfile1!.isNotEmpty)
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.network(
                                pet.popfile1!,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      height: 200,
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.error),
                                    ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      pet.upKindCd == '417000'
                                          ? Icons.pets
                                          : Icons.pets_outlined,
                                      color: theme.colorScheme.primary,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        pet.kindFullNm ?? '품종 미상',
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                if (pet.happenPlace != null)
                                  Text(
                                    '발견장소: ${pet.happenPlace}',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                if (pet.happenDt != null)
                                  Text(
                                    '발견일: ${pet.happenDt}',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                if (pet.careNm != null)
                                  Text(
                                    '보호소: ${pet.careNm}',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    if (pet.sexCd != null)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: pet.sexCd == 'M'
                                              ? Colors.orange[100]
                                              : Colors.pink[100],
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Text(
                                          pet.sexCd == 'M' ? '수컷' : '암컷',
                                          style: TextStyle(
                                            color: pet.sexCd == 'M'
                                                ? Colors.orange[800]
                                                : Colors.pink[800],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    const SizedBox(width: 8),
                                    if (pet.neuterYn != null)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: pet.neuterYn == 'Y'
                                              ? Colors.deepOrange[100]
                                              : Colors.orange[50],
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Text(
                                          pet.neuterYn == 'Y' ? '중성화' : '미중성화',
                                          style: TextStyle(
                                            color: pet.neuterYn == 'Y'
                                                ? Colors.deepOrange[800]
                                                : Colors.orange[800],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    '오류가 발생했습니다: $error',
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
