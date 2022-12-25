import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:practical_one/api/i_api_provider.dart';
import 'package:practical_one/presentation/bloc/user_cubit.dart';
import 'package:practical_one/repository/i_user_repo.dart';
import 'package:practical_one/utils/services/i_phone_services.dart';

@GenerateMocks([
  IPhoneServices,
  Dio,
  IApi,
  IUserRepo,
])
void main() {

}
