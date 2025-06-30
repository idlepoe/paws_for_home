import 'package:paws_for_home/shared/models/abandonment_response.dart';
import '../../domain/entities/pet_search_filter.dart';
import '../../domain/repositories/pet_repository.dart';
import '../datasources/pet_remote_data_source.dart';

class PetRepositoryImpl implements PetRepository {
  final PetRemoteDataSource remoteDataSource;

  PetRepositoryImpl(this.remoteDataSource);

  @override
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
  }) async {
    final response = await remoteDataSource.getAbandonmentData(
      numOfRows: numOfRows,
      pageNo: pageNo,
      bgnde: bgnde,
      endde: endde,
      upkind: upkind,
      kind: kind,
      uprCd: uprCd,
      orgCd: orgCd,
      careRegNo: careRegNo,
      state: state,
      neuterYn: neuterYn,
      sexCd: sexCd,
      rfidCd: rfidCd,
      desertionNo: desertionNo,
      noticeNo: noticeNo,
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
                  (item) =>
                      AbandonmentItem.fromJson(Map<String, dynamic>.from(item)),
                )
                .toList();
          } else {
            pets = [AbandonmentItem.fromJson(Map<String, dynamic>.from(items))];
          }
        }
      }
    }
    return pets;
  }

  @override
  Future<List<AbandonmentItem>> getPetsWithFilter(
    PetSearchFilter filter, {
    required String numOfRows,
    required String pageNo,
  }) async {
    final query = filter.toQuery();
    return await getPets(
      numOfRows: numOfRows,
      pageNo: pageNo,
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
  }
}
