import 'package:cloud_firestore/cloud_firestore.dart';
import '../../init/base_models/base_response_model.dart';
import '../../init/base_models/error_response_model.dart';
import '../../init/base_models/success_response_model.dart';

import '../abstract/firebase_data_service.dart';

class FirebaseDataManager extends FirebaseDataService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<Map<String, dynamic>?> getDataFromFirebase(String collectionName, String documentName) async {
    final result = await firestore.collection(collectionName).doc(documentName).get();
    final data = result.data();
    return data;
  }

  @override
  BaseResponseModel<void> setDataToFirebase(String collectionName, String documentName, Map<String, Object?> json) {
    firestore.collection(collectionName).doc(documentName).update(json).then((value) {}).catchError((error) {
      // ignore: invalid_return_type_for_catch_error
      return ErrorResponseModel(error: error);
    });
    return SuccessResponseModel();
  }
}
