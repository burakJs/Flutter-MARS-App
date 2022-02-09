import '../../../../../../core/constants/firebase_constants.dart';

abstract class IFlavourRepository {
  FirebaseConstants firebase = FirebaseConstants.instance;
  Future<Map<String, dynamic>?> getTopFlavour();
}
