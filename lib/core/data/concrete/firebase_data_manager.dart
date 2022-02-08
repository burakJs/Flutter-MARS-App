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
}
