abstract class FirebaseDataService {
  Future<Map<String, dynamic>?> getDataFromFirebase(String collectionName, String documentName);
}
