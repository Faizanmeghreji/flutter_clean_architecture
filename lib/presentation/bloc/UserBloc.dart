import 'package:bloc/bloc.dart';
import 'package:practical_one/models/user_model.dart';
import 'package:practical_one/presentation/bloc/user_state.dart';
import 'package:practical_one/repository/user_repo.dart';
import 'package:practical_one/utils/services/phone_services.dart';

class UserCubit extends Cubit<UserState> {
  var userRepo = UserRepo();
  var phoneServices = PhoneServices();

  UserCubit() : super(InitialUserState());

  void getUserList() async {
    emit(UserLoadingState());
    var response = await userRepo.getUserList();
    if (response.isRight) {
      emit(UserSuccessState(
          mUserList: response.right.map((e) => e.toData()).toList()));
    } else if (response.isLeft) {
      emit(ErrorState(response.left.toString()));
    }
  }

  void makingPhoneCall(String mobileNumber) async {
    try {
      phoneServices.openDialer(mobileNumber);
    } on Exception catch (e) {
      emit(ErrorOperationState(e.toString()));
    }
  }

  void openEmail(UserModel userModel) {
    try {
      phoneServices.openEmail(userModel);
    } on Exception catch (e) {
      emit(ErrorOperationState(e.toString()));
    }
  }
}
