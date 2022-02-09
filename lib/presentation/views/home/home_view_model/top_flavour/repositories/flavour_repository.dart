import '../../../../../../core/data/abstract/firebase_data_service.dart';
import 'IFlavour_repository.dart';

class FlavourRepository extends IFlavourRepository {
  final FirebaseDataService firebaseDataService;

  FlavourRepository({required this.firebaseDataService});

  @override
  Future<Map<String, dynamic>?> getTopFlavour() async {
    return await firebaseDataService.getDataFromFirebase(firebase.TOP_FLAVOUR_COLLECTION, firebase.TOP_FLAVOUR_DOCUMENT);
  }
}
