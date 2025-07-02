import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paws_for_home/core/services/abandonment_api_service.dart';
import 'package:paws_for_home/features/pets/data/datasources/pet_remote_data_source.dart';
import 'package:paws_for_home/features/pets/data/repositories/pet_repository_impl.dart';
import 'package:paws_for_home/features/pets/domain/entities/pet_search_filter.dart';
import 'package:paws_for_home/features/pets/domain/usecases/get_pets_usecase.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'package:paws_for_home/features/pets/presentation/providers/search_filter_provider.dart';
import 'package:logger/logger.dart';

final logger = Logger();

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
      final filter = ref.watch(searchFilterProvider);
      return PetsNotifier(useCase, filter);
    });

class PetsNotifier extends StateNotifier<AsyncValue<List<AbandonmentItem>>> {
  final GetPetsUseCase _useCase;
  PetSearchFilter _filter;
  int _page = 1;
  bool _hasMore = true;
  bool _isLoading = false;
  List<AbandonmentItem> _allPets = [];

  PetsNotifier(this._useCase, this._filter)
    : super(const AsyncValue.loading()) {
    _loadPets(reset: true);
  }

  Future<void> _loadPets({bool reset = false}) async {
    logger.d('loadPets');
    if (_isLoading) return;
    _isLoading = true;

    try {
      if (reset) {
        _page = 1;
        _hasMore = true;
        _allPets = [];
        state = const AsyncValue.loading();
      }

      // 시도 정보가 없으면 기본 시도(서울특별시)로 설정
      PetSearchFilter filterToUse = _filter;
      if (_filter.isEmpty || _filter.uprCd == null) {
        filterToUse = _filter.copyWith(uprCd: '6110000'); // 서울특별시 코드
        logger.d('시도 정보가 없어서 기본 시도(서울특별시)로 설정');
      }

      final pets = await _useCase.execute(
        numOfRows: '10',
        pageNo: _page.toString(),
        filter: filterToUse.isEmpty ? null : filterToUse,
      );

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

  Future<void> refreshPets() async {
    await _loadPets(reset: true);
  }

  Future<void> loadMorePets() async {
    if (_hasMore && !_isLoading) {
      await _loadPets();
    }
  }

  Future<void> searchPets(PetSearchFilter filter) async {
    logger.d('searchPets');
    _filter = filter;
    await _loadPets(reset: true);
  }

  bool get hasMore => _hasMore;
  bool get isLoading => _isLoading;
}
