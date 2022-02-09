import '../../../../../../core/data/abstract/firebase_data_service.dart';
import 'ITop_item_repository.dart';

class TopItemRepository extends ITopItemRepository {
  final FirebaseDataService firebaseDataService;

  TopItemRepository({required this.firebaseDataService});

  @override
  Future<Map<String, dynamic>?> getTopItem() async {
    return await firebaseDataService.getDataFromFirebase(firebase.TOP_ITEM_COLLECTION, firebase.TOP_ITEM_DOCUMENT);
  }
}
