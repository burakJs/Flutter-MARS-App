import '../../../../../../core/constants/firebase_constants.dart';

abstract class IPopularRepository {
  FirebaseConstants firebase = FirebaseConstants.instance;
  Future<Map<String, dynamic>?> getPopularIceCreams();
}
