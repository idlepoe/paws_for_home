import 'package:paws_for_home/shared/models/abandonment_response.dart';
import '../entities/pet_search_filter.dart';

abstract class PetRepository {
  Future<List<AbandonmentItem>> getPets({
    required String numOfRows,
    required String pageNo,
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
  });

  Future<List<AbandonmentItem>> getPetsWithFilter(
    PetSearchFilter filter, {
    required String numOfRows,
    required String pageNo,
  });
}
