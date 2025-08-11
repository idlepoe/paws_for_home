import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:paws_for_home/core/services/abandonment_api_service.dart';
import 'package:paws_for_home/core/services/pet_cache_service.dart';
import 'package:paws_for_home/features/pets/data/datasources/pet_remote_data_source.dart';
import 'package:paws_for_home/features/pets/data/repositories/pet_repository_impl.dart';
import 'package:paws_for_home/features/pets/domain/entities/pet_search_filter.dart';
import 'package:paws_for_home/features/pets/domain/usecases/get_pets_usecase.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'package:paws_for_home/features/pets/presentation/providers/search_filter_provider.dart';
import 'package:logger/logger.dart';

final logger = Logger();

// 캐시 서비스 프로바이더
final petCacheServiceProvider = Provider<PetCacheService>((ref) {
  return PetCacheService();
});

// API 서비스 프로바이더
final apiServiceProvider = Provider<AbandonmentApiService>((ref) {
  return AbandonmentApiService();
});

// Data Source 프로바이더
final petRemoteDataSourceProvider = Provider<PetRemoteDataSource>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return PetRemoteDataSourceImpl(apiService);
});

// Repository 프로바이더
final petRepositoryProvider = Provider<PetRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(petRemoteDataSourceProvider);
  return PetRepositoryImpl(remoteDataSource);
});

// Use Case 프로바이더
final getPetsUseCaseProvider = Provider<GetPetsUseCase>((ref) {
  final repository = ref.watch(petRepositoryProvider);
  return GetPetsUseCase(repository);
});

// 검색 필터 상태 관리
class PetSearchFilterNotifier extends StateNotifier<PetSearchFilter> {
  PetSearchFilterNotifier() : super(const PetSearchFilter());

  void set(PetSearchFilter filter) => state = filter;
  void reset() => state = const PetSearchFilter();
  void updateFilter(PetSearchFilter filter) => state = filter;
}

final petSearchFilterProvider =
    StateNotifierProvider<PetSearchFilterNotifier, PetSearchFilter>(
      (ref) => PetSearchFilterNotifier(),
    );

// 펫 목록 상태 관리
final petsProvider =
    StateNotifierProvider<PetsNotifier, AsyncValue<List<AbandonmentItem>>>((
      ref,
    ) {
      final useCase = ref.watch(getPetsUseCaseProvider);
      final cacheService = ref.watch(petCacheServiceProvider);
      final filter = ref.watch(searchFilterProvider);
      return PetsNotifier(useCase, cacheService, filter);
    });

class PetsNotifier extends StateNotifier<AsyncValue<List<AbandonmentItem>>> {
  final GetPetsUseCase _useCase;
  final PetCacheService _cacheService;
  PetSearchFilter _filter;
  int _page = 1;
  bool _hasMore = true;
  bool _isLoading = false;
  List<AbandonmentItem> _allPets = [];
  bool _isLoadingFromCache = false;
  bool _isRefreshingInBackground = false;

  PetsNotifier(this._useCase, this._cacheService, this._filter)
    : super(const AsyncValue.loading()) {
    _initializeWithSavedFilter();
  }

  // 저장된 필터 정보를 먼저 로드한 후 캐시 로딩 시작
  Future<void> _initializeWithSavedFilter() async {
    try {
      logger.d('🔄 저장된 필터 정보 로드 시작');

      // SharedPreferences에서 저장된 필터 정보 로드
      final prefs = await SharedPreferences.getInstance();
      final savedSidoCode = prefs.getString('selected_sido_code');
      final savedKindCode = prefs.getString('selected_kind_code');
      final savedStateCode = prefs.getString('selected_state_code');

      // 저장된 정보로 필터 업데이트
      PetSearchFilter updatedFilter = _filter;

      if (savedSidoCode != null) {
        updatedFilter = updatedFilter.copyWith(uprCd: savedSidoCode);
        logger.d('💾 저장된 시도 코드 적용: $savedSidoCode');
      } else {
        // 저장된 시도가 없으면 기본값(서울) 설정
        updatedFilter = updatedFilter.copyWith(uprCd: '6110000');
        logger.d('🏙️ 기본 시도(서울) 설정');
      }

      if (savedKindCode != null) {
        updatedFilter = updatedFilter.copyWith(upkind: savedKindCode);
        logger.d('💾 저장된 축종 코드 적용: $savedKindCode');
      } else {
        // 저장된 축종이 없으면 기본값(개) 설정
        updatedFilter = updatedFilter.copyWith(upkind: '417000');
        logger.d('🐕 기본 축종(개) 설정');
      }

      if (savedStateCode != null) {
        updatedFilter = updatedFilter.copyWith(state: savedStateCode);
        logger.d('💾 저장된 상태 코드 적용: $savedStateCode');
      } else {
        // 저장된 상태가 없으면 기본값(공고중) 설정
        updatedFilter = updatedFilter.copyWith(state: 'notice');
        logger.d('📢 기본 상태(공고중) 설정');
      }

      // 필터 업데이트
      _filter = updatedFilter;
      logger.i('✅ 필터 초기화 완료: ${_filter.toJson()}');

      // 이제 캐시 로딩 시작
      await _loadPetsWithCache(reset: true);
    } catch (e) {
      logger.e('❌ 필터 초기화 실패: $e');
      // 실패 시 기본 필터로 진행
      _filter = _filter.copyWith(
        uprCd: '6110000', // 서울
        upkind: '417000', // 개
        state: 'notice', // 공고중
      );
      await _loadPetsWithCache(reset: true);
    }
  }

  Future<void> _loadPetsWithCache({bool reset = false}) async {
    logger.d('loadPetsWithCache - reset: $reset');
    if (_isLoading) return;
    _isLoading = true;

    try {
      if (reset) {
        _page = 1;
        _hasMore = true;
        _allPets = [];
        state = const AsyncValue.loading();
      }

      // 이미 초기화된 필터 사용 (기본값 강제 설정 제거)
      PetSearchFilter filterToUse = _filter;
      logger.d('현재 필터 사용: ${filterToUse.toJson()}');

      // 1. 먼저 캐시에서 데이터 로드 시도
      if (reset && !_isLoadingFromCache) {
        _isLoadingFromCache = true;
        final cachedPets = await _cacheService.getCachedPets();
        final cachedFilter = await _cacheService.getCachedFilter();

        if (cachedPets != null &&
            cachedPets.isNotEmpty &&
            cachedFilter != null) {
          // 캐시된 필터와 현재 필터가 동일한지 확인
          if (_isFilterEqual(cachedFilter, filterToUse)) {
            logger.i('✅ 캐시된 데이터 사용: ${cachedPets.length}개');
            _allPets = List.from(cachedPets);
            state = AsyncValue.data(_allPets);
            _isLoadingFromCache = false;

            // 백그라운드에서 최신 데이터 로드
            _loadFreshDataInBackground(filterToUse);
            return;
          }
        }
        _isLoadingFromCache = false;
      }

      // 2. 캐시가 없거나 필터가 다르면 API에서 직접 로드
      final pets = await _useCase.execute(
        numOfRows: '100',
        pageNo: _page.toString(),
        filter: filterToUse.isEmpty ? null : filterToUse,
      );

      if (reset) {
        _allPets = pets;
        // 새로운 데이터를 캐시에 저장
        await _cacheService.cachePets(pets, filterToUse);
      } else {
        _allPets.addAll(pets);
        // 전체 목록을 캐시에 업데이트
        await _cacheService.cachePets(_allPets, filterToUse);
      }

      _hasMore = pets.isNotEmpty && pets.length == 100;
      state = AsyncValue.data(_allPets);
      _page++;
    } catch (error, stackTrace) {
      _isLoading = false;
      state = AsyncValue.error(error, stackTrace);
    } finally {
      _isLoading = false;
    }
  }

  // 백그라운드에서 최신 데이터 로드
  Future<void> _loadFreshDataInBackground(PetSearchFilter filter) async {
    // 이미 백그라운드 새로고침 중이면 중복 실행 방지
    if (_isRefreshingInBackground) {
      logger.d('🔄 이미 백그라운드 새로고침 중, 중복 실행 방지');
      return;
    }

    try {
      logger.d('🔄 백그라운드에서 최신 데이터 로드 중...');
      _isRefreshingInBackground = true;
      // 상태 변경을 UI에 알리기 위해 state 업데이트 (강제 리빌드)
      state = AsyncValue.data(_allPets);

      final freshPets = await _useCase.execute(
        numOfRows: '100',
        pageNo: '1',
        filter: filter.isEmpty ? null : filter,
      );

      if (freshPets.isNotEmpty) {
        // 데이터가 변경되었는지 확인
        if (_hasDataChanged(_allPets, freshPets)) {
          logger.i('🔄 새로운 데이터 발견, 목록 업데이트');
          _allPets = freshPets;
          state = AsyncValue.data(_allPets);
          await _cacheService.cachePets(freshPets, filter);
        } else {
          logger.d('✅ 데이터 변경 없음');
        }
      }
    } catch (e) {
      logger.e('❌ 백그라운드 데이터 로드 실패: $e');
    } finally {
      _isRefreshingInBackground = false;
      // 상태 변경을 UI에 알리기 위해 state 업데이트 (강제 리빌드)
      state = AsyncValue.data(_allPets);
      logger.d('🔄 백그라운드 데이터 로드 완료, 상태: $_isRefreshingInBackground');
    }
  }

  // 필터가 동일한지 확인
  bool _isFilterEqual(PetSearchFilter filter1, PetSearchFilter filter2) {
    return filter1.toJson().toString() == filter2.toJson().toString();
  }

  // 데이터가 변경되었는지 확인
  bool _hasDataChanged(
    List<AbandonmentItem> oldPets,
    List<AbandonmentItem> newPets,
  ) {
    if (oldPets.length != newPets.length) return true;

    for (int i = 0; i < oldPets.length; i++) {
      if (oldPets[i].desertionNo != newPets[i].desertionNo ||
          oldPets[i].processState != newPets[i].processState ||
          oldPets[i].updTm != newPets[i].updTm) {
        return true;
      }
    }
    return false;
  }

  Future<void> refreshPets() async {
    // 캐시 삭제 후 새로 로드
    await _cacheService.clearCache();
    await _loadPetsWithCache(reset: true);
  }

  // 백그라운드에서 새로고침 (UI 블로킹 없이)
  Future<void> refreshPetsInBackground() async {
    // 이미 백그라운드 새로고침 중이면 중복 실행 방지
    if (_isRefreshingInBackground) {
      logger.d('🔄 이미 백그라운드 새로고침 중, 중복 실행 방지');
      return;
    }

    try {
      logger.d('🔄 백그라운드 새로고침 시작');
      _isRefreshingInBackground = true;
      // 상태 변경을 UI에 알리기 위해 state 업데이트 (강제 리빌드)
      state = AsyncValue.data(_allPets);

      // 시도 정보가 없으면 기본 시도(서울특별시)로 설정
      PetSearchFilter filterToUse = _filter;
      if (_filter.isEmpty || _filter.uprCd == null) {
        filterToUse = _filter.copyWith(uprCd: '6110000');
      }

      // 최신 데이터 로드
      final freshPets = await _useCase.execute(
        numOfRows: '100',
        pageNo: '1',
        filter: filterToUse.isEmpty ? null : filterToUse,
      );

      if (freshPets.isNotEmpty) {
        // 데이터가 변경되었는지 확인
        if (_hasDataChanged(_allPets, freshPets)) {
          logger.i('🔄 백그라운드 새로고침: 새로운 데이터 발견');
          _allPets = freshPets;
          state = AsyncValue.data(_allPets);
          await _cacheService.cachePets(freshPets, filterToUse);
        } else {
          logger.d('✅ 백그라운드 새로고침: 데이터 변경 없음');
        }
      }
    } catch (e) {
      logger.e('❌ 백그라운드 새로고침 실패: $e');
    } finally {
      _isRefreshingInBackground = false;
      // 상태 변경을 UI에 알리기 위해 state 업데이트 (강제 리빌드)
      state = AsyncValue.data(_allPets);
      logger.d('🔄 백그라운드 새로고침 완료, 상태: $_isRefreshingInBackground');
    }
  }

  Future<void> loadMorePets() async {
    if (_hasMore && !_isLoading) {
      await _loadPetsWithCache();
    }
  }

  Future<void> searchPets(PetSearchFilter filter) async {
    logger.d('searchPets');
    _filter = filter;
    await _loadPetsWithCache(reset: true);
  }

  bool get hasMore => _hasMore;
  bool get isLoading => _isLoading;
  bool get isRefreshingInBackground => _isRefreshingInBackground;
}
