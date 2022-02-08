import '../../../../../../core/data/abstract/firebase_data_service.dart';
import 'IPopular_repository.dart';

class PopularRepository extends IPopularRepository {
  final FirebaseDataService firebaseDataService;

  PopularRepository({required this.firebaseDataService});

  @override
  Future<Map<String, dynamic>?> getPopularIceCreams() async {
    return await firebaseDataService.getDataFromFirebase('popular', 'popular_ice_creams');
  }
}
