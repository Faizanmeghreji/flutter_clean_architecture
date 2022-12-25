import 'package:either_dart/either.dart';
import 'package:practical_one/reponse_model/user_response.dart';

abstract class IUserRepo{
  Future<Either<Exception,List<UserResponse>>> getUserList();
}