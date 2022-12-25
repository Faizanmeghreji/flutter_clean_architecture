

class BaseObjectResponse<T>{
  late final int? responseCode;
  late final String? responseMessage;
  late final List<T> response;
}