import 'base_response_model.dart';

class SuccessResponseModel<T> extends BaseResponseModel<T> {
  SuccessResponseModel({T? data}) : super(isSuccess: true, data: data);
}
