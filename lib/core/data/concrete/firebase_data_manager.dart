import 'package:cloud_firestore/cloud_firestore.dart';

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
  bool setDataToFirebase(String collectionName, String documentName, Map<String, Object?> json) {
    bool isSuccess = false;
    firestore
        .collection(collectionName)
        .doc(documentName)
        .update(json)
        .then(
          (value) => isSuccess = true,
        )
        .catchError(
          (error) => isSuccess = false,
        );
    return isSuccess;
  }
}
