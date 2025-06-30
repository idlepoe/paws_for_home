import 'package:paws_for_home/shared/models/abandonment_response.dart';
import '../entities/pet_search_filter.dart';
import '../repositories/pet_repository.dart';

class GetPetsUseCase {
  final PetRepository repository;

  GetPetsUseCase(this.repository);

  Future<List<AbandonmentItem>> execute({
    required String numOfRows,
    required String pageNo,
    PetSearchFilter? filter,
  }) async {
    if (filter != null) {
      return await repository.getPetsWithFilter(
        filter,
        numOfRows: numOfRows,
        pageNo: pageNo,
      );
    } else {
      return await repository.getPets(numOfRows: numOfRows, pageNo: pageNo);
    }
  }
}
