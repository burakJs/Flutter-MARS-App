import '../../../../../core/data/abstract/firebase_data_service.dart';
import '../../../../../core/init/base_models/base_response_model.dart';
import '../../../../../core/init/base_models/error_response_model.dart';
import '../../../../../core/init/base_models/success_response_model.dart';
import '../../../../../models/top_flavour.dart';
import 'ITop_flavour_detail_repository.dart';

class TopFlavourDetailRepository extends ITopFlavourDetailRepository {
  final FirebaseDataService service;

  TopFlavourDetailRepository({required this.service});

  @override
  int setKilos(int kg, bool isAdd) {
    return isAdd
        ? kg + 1
        : kg > 1
            ? kg - 1
            : kg;
  }

  @override
  BaseResponseModel<TopFlavour> setLike(TopFlavour topFlavour) {
    topFlavour.isLiked = !topFlavour.isLiked;
    var isSuccess = service.setDataToFirebase(firebase.TOP_FLAVOUR_COLLECTION, firebase.TOP_FLAVOUR_DOCUMENT, topFlavour.toJson());

    if (isSuccess is SuccessResponseModel) {
      return SuccessResponseModel<TopFlavour>();
    } else {
      return ErrorResponseModel<TopFlavour>(error: (isSuccess as ErrorResponseModel).error);
    }
  }
}
