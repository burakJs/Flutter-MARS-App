import '../../init/base_models/base_response_model.dart';

abstract class FirebaseDataService {
  Future<Map<String, dynamic>?> getDataFromFirebase(String collectionName, String documentName);
  BaseResponseModel<void> setDataToFirebase(String collectionName, String documentName, Map<String, Object?> json);
}
