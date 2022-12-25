import 'package:dio/dio.dart';
import 'package:practical_one/api/i_api_provider.dart';

class ApiProvider implements IApi {
  @override
  Future<BaseResponse> getUserList() async {
    var dio = Dio();
    try {
      var response =
          await dio.get('https://jsonplaceholder.typicode.com/users');
      BaseResponse baseResponse = BaseResponse(
          response.statusCode, response.statusMessage, response.data);
      return baseResponse;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}

class BaseResponse<T> {
  int? statusCode;
  String? statusMessage;
  T? data;

  BaseResponse(this.statusCode, this.statusMessage, this.data);
}
