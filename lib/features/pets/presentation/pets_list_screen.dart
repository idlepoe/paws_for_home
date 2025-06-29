import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paws_for_home/core/services/abandonment_api_service.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'pet_detail_screen.dart';
import 'search_filter_screen.dart';

// API 서비스 프로바이더
final apiServiceProvider = Provider<AbandonmentApiService>((ref) {
  return AbandonmentApiService();
});

// 검색 조건 모델
class PetSearchFilter {
  final String? bgnde;
  final String? endde;
  final String? upkind;
  final String? kind;
  final String? uprCd;
  final String? orgCd;
  final String? careRegNo;
  final String? state;
  final String? neuterYn;
  final String? sexCd;
  final String? rfidCd;
  final String? desertionNo;
  final String? noticeNo;

  const PetSearchFilter({
    this.bgnde,
    this.endde,
    this.upkind,
    this.kind,
    this.uprCd,
    this.orgCd,
    this.careRegNo,
    this.state,
    this.neuterYn,
    this.sexCd,
    this.rfidCd,
    this.desertionNo,
    this.noticeNo,
  });

  PetSearchFilter copyWith({
    String? bgnde,
    String? endde,
    String? upkind,
    String? kind,
    String? uprCd,
    String? orgCd,
    String? careRegNo,
    String? state,
    String? neuterYn,
    String? sexCd,
    String? rfidCd,
    String? desertionNo,
    String? noticeNo,
  }) {
    return PetSearchFilter(
      bgnde: bgnde ?? this.bgnde,
      endde: endde ?? this.endde,
      upkind: upkind ?? this.upkind,
      kind: kind ?? this.kind,
      uprCd: uprCd ?? this.uprCd,
      orgCd: orgCd ?? this.orgCd,
      careRegNo: careRegNo ?? this.careRegNo,
      state: state ?? this.state,
      neuterYn: neuterYn ?? this.neuterYn,
      sexCd: sexCd ?? this.sexCd,
      rfidCd: rfidCd ?? this.rfidCd,
      desertionNo: desertionNo ?? this.desertionNo,
      noticeNo: noticeNo ?? this.noticeNo,
    );
  }

  bool get isEmpty =>
      bgnde == null &&
      endde == null &&
      upkind == null &&
      kind == null &&
      uprCd == null &&
      orgCd == null &&
      careRegNo == null &&
      state == null &&
      neuterYn == null &&
      sexCd == null &&
      rfidCd == null &&
      desertionNo == null &&
      noticeNo == null;

  Map<String, String?> toQuery() => {
    'bgnde': bgnde,
    'endde': endde,
    'upkind': upkind,
    'kind': kind,
    'upr_cd': uprCd,
    'org_cd': orgCd,
    'care_reg_no': careRegNo,
    'state': state,
    'neuter_yn': neuterYn,
    'sex_cd': sexCd,
    'rfid_cd': rfidCd,
    'desertion_no': desertionNo,
    'notice_no': noticeNo,
  }..removeWhere((key, value) => value == null || value.isEmpty);

  @override
  String toString() {
    final conditions = <String>[];

    // 축종
    if (upkind != null) {
      final upkindName = _getUpkindName(upkind!);
      conditions.add('축종: $upkindName');
    }

    // 시도
    if (uprCd != null) {
      conditions.add('시도: $uprCd');
    }

    // 시군구
    if (orgCd != null) {
      conditions.add('시군구: $orgCd');
    }

    // 보호소
    if (careRegNo != null) {
      conditions.add('보호소: $careRegNo');
    }

    // 품종
    if (kind != null) {
      conditions.add('품종: $kind');
    }

    // 상태
    if (state != null) {
      final stateName = _getStateName(state!);
      conditions.add('상태: $stateName');
    }

    // 중성화
    if (neuterYn != null) {
      final neuterName = _getNeuterName(neuterYn!);
      conditions.add('중성화: $neuterName');
    }

    // 성별
    if (sexCd != null) {
      final sexName = _getSexName(sexCd!);
      conditions.add('성별: $sexName');
    }

    // 구조일자
    if (bgnde != null && endde != null) {
      conditions.add('구조일자: $bgnde ~ $endde');
    }

    // 기타 텍스트 필드들
    if (rfidCd != null && rfidCd!.isNotEmpty) conditions.add('RFID: $rfidCd');
    if (desertionNo != null && desertionNo!.isNotEmpty)
      conditions.add('유기번호: $desertionNo');
    if (noticeNo != null && noticeNo!.isNotEmpty)
      conditions.add('공고번호: $noticeNo');

    return conditions.isEmpty ? '전체' : conditions.join(', ');
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
        return code;
    }
  }

  String _getStateName(String code) {
    switch (code) {
      case 'notice':
        return '공고중';
      case 'protect':
        return '보호중';
      case '공고중':
        return '공고중';
      case '보호중':
        return '보호중';
      case '종료(반환)':
        return '종료(반환)';
      default:
        return code;
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
        return code;
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
        return code;
    }
  }
}

class PetSearchFilterNotifier extends StateNotifier<PetSearchFilter> {
  PetSearchFilterNotifier() : super(const PetSearchFilter());
  void set(PetSearchFilter filter) => state = filter;
  void reset() => state = const PetSearchFilter();
}

final petSearchFilterProvider =
    StateNotifierProvider<PetSearchFilterNotifier, PetSearchFilter>(
      (ref) => PetSearchFilterNotifier(),
    );

// 간단한 상태 관리
final petsProvider =
    StateNotifierProvider<PetsNotifier, AsyncValue<List<AbandonmentItem>>>((
      ref,
    ) {
      final apiService = ref.watch(apiServiceProvider);
      final filter = ref.watch(petSearchFilterProvider);
      return PetsNotifier(apiService, filter);
    });

class PetsNotifier extends StateNotifier<AsyncValue<List<AbandonmentItem>>> {
  final AbandonmentApiService _apiService;
  final PetSearchFilter _filter;
  int _page = 1;
  bool _hasMore = true;
  bool _isLoading = false;
  List<AbandonmentItem> _allPets = [];

  PetsNotifier(this._apiService, this._filter)
    : super(const AsyncValue.loading()) {
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
      final query = _filter.toQuery();
      final response = await _apiService.getAbandonmentData(
        numOfRows: '10',
        pageNo: _page.toString(),
        bgnde: query['bgnde'],
        endde: query['endde'],
        upkind: query['upkind'],
        kind: query['kind'],
        uprCd: query['upr_cd'],
        orgCd: query['org_cd'],
        careRegNo: query['care_reg_no'],
        state: query['state'],
        neuterYn: query['neuter_yn'],
        sexCd: query['sex_cd'],
        rfidCd: query['rfid_cd'],
        desertionNo: query['desertion_no'],
        noticeNo: query['notice_no'],
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
    final filter = ref.watch(petSearchFilterProvider);
    final filterNotifier = ref.read(petSearchFilterProvider.notifier);
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
            icon: const Icon(Icons.search),
            onPressed: () async {
              final result = await Navigator.of(context).push<PetSearchFilter>(
                MaterialPageRoute(
                  builder: (_) => SearchFilterScreen(initial: filter),
                ),
              );
              if (result != null) {
                filterNotifier.set(result);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => notifier.refresh(),
          ),
        ],
      ),
      body: Container(
        color: theme.colorScheme.background,
        child: Column(
          children: [
            if (!filter.isEmpty)
              Container(
                width: double.infinity,
                color: Colors.orange[50],
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        filter.toString(),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    TextButton(
                      onPressed: () => filterNotifier.reset(),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.deepOrange,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      child: const Text('초기화'),
                    ),
                  ],
                ),
              ),
            Expanded(
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
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
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
                            elevation: 2,
                            margin: const EdgeInsets.only(bottom: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: pet.processState == '공고중'
                                    ? Colors.blue.withOpacity(0.3)
                                    : Colors.green.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            color: pet.processState == '공고중'
                                ? Colors.blue[50]
                                : Colors.green[50],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (pet.popfile1 != null &&
                                    pet.popfile1!.isNotEmpty)
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(16),
                                    ),
                                    child: Image.network(
                                      pet.popfile1!,
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                color: Colors.grey[700],
                                              ),
                                        ),
                                      if (pet.happenDt != null)
                                        Text(
                                          '발견일: ${_formatDate(pet.happenDt!)}',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                color: Colors.grey[700],
                                              ),
                                        ),
                                      if (pet.careNm != null)
                                        Text(
                                          '보호소: ${pet.careNm}',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                color: Colors.grey[700],
                                              ),
                                        ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          // processState chip을 제일 왼쪽에 우선 표시
                                          if (pet.processState != null)
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 4,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: pet.processState == '공고중'
                                                    ? Colors.blue[100]
                                                    : Colors.green[100],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Text(
                                                pet.processState ?? '상태미상',
                                                style: TextStyle(
                                                  color:
                                                      pet.processState == '공고중'
                                                      ? Colors.blue[800]
                                                      : Colors.green[800],
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          if (pet.processState != null)
                                            const SizedBox(width: 8),
                                          if (pet.sexCd != null)
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 4,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: pet.sexCd == 'M'
                                                    ? Colors.orange[100]
                                                    : Colors.pink[100],
                                                borderRadius:
                                                    BorderRadius.circular(12),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 4,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: pet.neuterYn == 'Y'
                                                    ? Colors.deepOrange[100]
                                                    : Colors.orange[50],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Text(
                                                pet.neuterYn == 'Y'
                                                    ? '중성화'
                                                    : '미중성화',
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
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, size: 64, color: Colors.red),
                        const SizedBox(height: 16),
                        Text(
                          '오류가 발생했습니다: $error',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String date) {
    if (date.length == 8) {
      // YYYYMMDD 형식을 YYYY-MM-DD로 변환
      return '${date.substring(0, 4)}-${date.substring(4, 6)}-${date.substring(6, 8)}';
    }
    return date;
  }
}
