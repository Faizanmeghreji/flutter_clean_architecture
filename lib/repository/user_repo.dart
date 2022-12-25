import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:practical_one/api/api_provider.dart';
import 'package:practical_one/api/i_api_provider.dart';
import 'package:practical_one/reponse_model/user_response.dart';
import 'package:practical_one/repository/i_user_repo.dart';

class UserRepo extends IUserRepo {
  final IApi apiProvider;

  UserRepo({required this.apiProvider});

  @override
  Future<Either<Exception, List<UserResponse>>> getUserList() async {
    if (await InternetConnectionChecker().hasConnection) {
      try {
        BaseResponse baseResponse = await apiProvider.getUserList();
        if (baseResponse.statusCode == 200) {
         var mUserList = baseResponse.data.map<UserResponse>((e) {
            return UserResponse.fromJson(e);
          }).toList();
          return Right(mUserList);
        } else {
          return Left(Exception(baseResponse.statusMessage));
        }
      } on DioError catch (e) {
        return Left(Exception(e.message));
      }
    } else {
      return Left(Exception('Please check your internet connection!'));
    }
  }
}
