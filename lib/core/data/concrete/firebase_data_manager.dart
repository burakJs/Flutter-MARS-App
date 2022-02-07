import 'package:mars_project/core/constants/color_constants.dart';
import 'package:mars_project/core/data/abstract/firebase_data_service.dart';
import 'package:mars_project/models/top_flavour.dart';

class FirebaseDataManager extends FirebaseDataService {
  @override
  TopFlavour getTopFlavourFromFirebase() {
    return TopFlavour(name: 'Vanilla Ice Cream', weight: 1, point: 4.9, cost: 14.60, image: '', color: ColorConstants().randomColor);
  }
}
