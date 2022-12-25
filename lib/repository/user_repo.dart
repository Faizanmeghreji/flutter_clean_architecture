import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:practical_one/api/api_provider.dart';
import 'package:practical_one/reponse_model/user_response.dart';
import 'package:practical_one/repository/i_user_repo.dart';

class UserRepo extends IUserRepo {
  var apiProvide = ApiProvider();

  @override
  Future<Either<Exception, List<UserResponse>>> getUserList() async {
    try {
      BaseResponse baseResponse = await apiProvide.getUserList();
      var mUserList;
      if (baseResponse.statusCode == 200) {
        mUserList = baseResponse.data.map<UserResponse>((e) {
          return UserResponse.fromJson(e);
        }).toList();
        return Right(mUserList);
      } else {
        return Left(Exception(baseResponse.statusMessage));
      }
    } on DioError catch (e) {
      return Left(Exception(e.message));
    }
  }
}
