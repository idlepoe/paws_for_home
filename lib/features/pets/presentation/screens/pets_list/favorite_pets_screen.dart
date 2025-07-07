import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'package:paws_for_home/features/pets/data/repositories/pet_repository_impl.dart';
import 'package:paws_for_home/features/pets/data/datasources/pet_remote_data_source.dart';
import 'package:paws_for_home/core/services/abandonment_api_service.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'widgets/pet_thumbnail.dart';

class FavoritePetsScreen extends ConsumerStatefulWidget {
  const FavoritePetsScreen({super.key});

  @override
  ConsumerState<FavoritePetsScreen> createState() => _FavoritePetsScreenState();
}

class _FavoritePetsScreenState extends ConsumerState<FavoritePetsScreen> {
  List<AbandonmentItem> _favoritePets = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavoritePets();
  }

  Future<void> _loadFavoritePets() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      final favoriteDesertionNos = prefs.getStringList('favorite_pets') ?? [];

      if (favoriteDesertionNos.isEmpty) {
        setState(() {
          _favoritePets = [];
          _isLoading = false;
        });
        return;
      }

      // API 서비스를 통해 각 desertionNo로 동물 정보 가져오기
      final apiService = AbandonmentApiService();
      final dataSource = PetRemoteDataSourceImpl(apiService);
      final repository = PetRepositoryImpl(dataSource);

      List<AbandonmentItem> pets = [];
      for (String desertionNo in favoriteDesertionNos) {
        try {
          final petList = await repository.getPets(
            numOfRows: '1',
            pageNo: '1',
            desertionNo: desertionNo,
          );
          if (petList.isNotEmpty) {
            pets.add(petList.first);
          }
        } catch (e) {
          // 개별 API 호출 실패 시 무시하고 계속 진행
          print('Failed to load pet with desertionNo: $desertionNo');
        }
      }

      setState(() {
        _favoritePets = pets;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _formatDate(String? date) {
    if (date == null || date.length != 8) return '';
    return '${date.substring(0, 4)}-${date.substring(4, 6)}-${date.substring(6, 8)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          '관심 동물',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.tossBlue),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
                strokeCap: StrokeCap.round,
              ),
            )
          : _favoritePets.isEmpty
          ? _buildEmptyState()
          : _buildFavoritePetsList(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 64, color: AppColors.textSecondary),
          const SizedBox(height: 16),
          Text(
            '관심 등록한 동물이 없습니다.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            '동물 상세 화면에서 관심 등록을 해보세요.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritePetsList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _favoritePets.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final pet = _favoritePets[index];
        return _buildFavoritePetCard(pet);
      },
    );
  }

  Widget _buildFavoritePetCard(AbandonmentItem pet) {
    return GestureDetector(
      onTap: () {
        context.push('/pets/detail', extra: pet);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.tossBlue, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            PetThumbnail(
              pet: pet,
              width: 170,
              height: 170,
              borderRadius: 12,
              showKindChip: true,
              showStateChip: true,
              padding: const EdgeInsets.all(4),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (pet.happenPlace != null && pet.happenPlace!.isNotEmpty)
                      Text(
                        pet.happenPlace!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (pet.happenDt != null)
                      Text(
                        '발견일: ${_formatDate(pet.happenDt)}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    if (pet.careNm != null && pet.careNm!.isNotEmpty)
                      Text(
                        pet.careNm!,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.tossBlue,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    // 특징 정보
                    if (pet.specialMark != null && pet.specialMark!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '특징: ${pet.specialMark}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    // 색상 정보
                    if (pet.colorCd != null && pet.colorCd!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          '색상: ${pet.colorCd}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    // 나이 정보
                    if (pet.age != null && pet.age!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          '나이: ${pet.age}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: [
                        if (pet.sexCd != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: pet.sexCd == 'M'
                                  ? Colors.orange.withOpacity(0.1)
                                  : Colors.pink.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: pet.sexCd == 'M'
                                    ? Colors.orange.withOpacity(0.3)
                                    : Colors.pink.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              pet.sexCd == 'M' ? '수컷' : '암컷',
                              style: TextStyle(
                                fontSize: 10,
                                color: pet.sexCd == 'M'
                                    ? Colors.orange[700]
                                    : Colors.pink[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        if (pet.neuterYn != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: pet.neuterYn == 'Y'
                                  ? Colors.deepOrange.withOpacity(0.1)
                                  : Colors.orange.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: pet.neuterYn == 'Y'
                                    ? Colors.deepOrange.withOpacity(0.3)
                                    : Colors.orange.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              pet.neuterYn == 'Y' ? '중성화' : '미중성화',
                              style: TextStyle(
                                fontSize: 10,
                                color: pet.neuterYn == 'Y'
                                    ? Colors.deepOrange[700]
                                    : Colors.orange[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.tossBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: AppColors.tossBlue,
                              width: 1,
                            ),
                          ),
                          child: const Text(
                            '관심',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.tossBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
