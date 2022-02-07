import 'package:mars_project/core/data/abstract/firebase_data_service.dart';
import 'package:mars_project/core/data/concrete/firebase_data_manager.dart';
import 'package:mars_project/models/top_flavour.dart';

import 'IFlavour_repository.dart';

class FlavourRepository extends IFlavourRepository {
  final FirebaseDataService _firebaseDataService;

  FlavourRepository({FirebaseDataService? firebaseDataService}) : _firebaseDataService = firebaseDataService ?? FirebaseDataManager();

  @override
  TopFlavour getTopFlavour() {
    return _firebaseDataService.getTopFlavourFromFirebase();
  }
}
