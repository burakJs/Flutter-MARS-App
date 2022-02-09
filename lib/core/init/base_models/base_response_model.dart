abstract class BaseResponseModel<T> {
  final bool isSuccess;
  final T? data;
  BaseResponseModel({required this.isSuccess, this.data});
}
