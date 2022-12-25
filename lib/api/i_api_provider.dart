
import 'package:practical_one/api/api_provider.dart';

abstract class IApi {
  Future<BaseResponse> getUserList();
}
