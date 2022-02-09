import '../../../../../core/constants/firebase_constants.dart';
import '../../../../../core/init/base_models/base_response_model.dart';
import '../../../../../models/top_flavour.dart';

abstract class ITopFlavourDetailRepository {
  FirebaseConstants firebase = FirebaseConstants.instance;
  BaseResponseModel<TopFlavour> setLike(TopFlavour topFlavour);
  int setKilos(int kg, bool isAdd);
}
