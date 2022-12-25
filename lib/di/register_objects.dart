import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:practical_one/api/api_provider.dart';
import 'package:practical_one/api/i_api_provider.dart';
import 'package:practical_one/presentation/bloc/UserBloc.dart';
import 'package:practical_one/repository/i_user_repo.dart';
import 'package:practical_one/repository/user_repo.dart';
import 'package:practical_one/utils/services/i_phone_services.dart';
import 'package:practical_one/utils/services/phone_services.dart';

final sl = GetIt.instance;

Future<void> registerObjectsToDi() async {
  _initPhoneService();
  _initApiClient();
  _initApiProvider();
  _initUserRepo();
  _initUserBloc();
}

_initUserBloc() {
  sl.registerFactory(() => UserCubit(
      userRepo: sl.get<IUserRepo>(), phoneServices: sl.get<IPhoneServices>()));
}

_initUserRepo() {
  sl.registerLazySingleton<IUserRepo>(() => UserRepo(apiProvider: sl.get<IApi>()));
}

_initPhoneService() {
  sl.registerLazySingleton<IPhoneServices>(() => PhoneServices());
}

_initApiProvider(){
  sl.registerLazySingleton<IApi>(() => ApiProvider(dioClient: sl.get<Dio>()));
}
_initApiClient(){
  sl.registerLazySingleton(() => Dio());
}
