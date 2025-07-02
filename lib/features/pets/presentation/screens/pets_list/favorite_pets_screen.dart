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
            // 이미지 + 상태 칩 Stack
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: pet.popfile1 ?? '',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      width: 100,
                      height: 100,
                      color: AppColors.divider,
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: 100,
                      height: 100,
                      color: AppColors.gray,
                      child: const Icon(
                        Icons.error,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
                // 상태 칩 (우측 상단)
                if (pet.processState != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: pet.processState == '공고중'
                            ? Colors.blue.withOpacity(0.9)
                            : Colors.green.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        pet.processState!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            // 정보 섹션
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 품종
                    Text(
                      pet.kindFullNm ?? pet.kindNm ?? '품종 미상',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    // 공고번호
                    if (pet.noticeNo != null)
                      Text(
                        '공고번호: ${pet.noticeNo}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    const SizedBox(height: 4),
                    // 발견장소
                    if (pet.happenPlace != null && pet.happenPlace!.isNotEmpty)
                      Text(
                        pet.happenPlace!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    const SizedBox(height: 4),
                    // 발견일
                    if (pet.happenDt != null)
                      Text(
                        '발견일: ${_formatDate(pet.happenDt)}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    const SizedBox(height: 8),
                    // 하단 칩들
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
