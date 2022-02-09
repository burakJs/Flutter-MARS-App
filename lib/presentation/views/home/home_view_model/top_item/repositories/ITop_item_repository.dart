import '../../../../../../core/constants/firebase_constants.dart';

abstract class ITopItemRepository {
  FirebaseConstants firebase = FirebaseConstants.instance;
  Future<Map<String, dynamic>?> getTopItem();
}
