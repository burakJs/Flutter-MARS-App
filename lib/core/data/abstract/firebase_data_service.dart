abstract class FirebaseDataService {
  Future<Map<String, dynamic>?> getDataFromFirebase(String collectionName, String documentName);
  bool setDataToFirebase(String collectionName, String documentName, Map<String, Object?> json);
}
