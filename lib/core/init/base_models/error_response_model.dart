import 'base_response_model.dart';

class ErrorResponseModel<T> extends BaseResponseModel<T> {
  final String error;
  ErrorResponseModel({required this.error, T? data}) : super(isSuccess: false, data: data);
}
