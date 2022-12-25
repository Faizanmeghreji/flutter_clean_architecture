import 'package:bloc/bloc.dart';
import 'package:practical_one/models/user_model.dart';
import 'package:practical_one/presentation/bloc/user_state.dart';
import 'package:practical_one/repository/i_user_repo.dart';
import 'package:practical_one/utils/services/i_phone_services.dart';

class UserCubit extends Cubit<UserState> {
  final IUserRepo userRepo;
  final IPhoneServices phoneServices;

  UserCubit({required this.userRepo, required this.phoneServices})
      : super(InitialUserState());

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
      phoneServices.openDialer(mobileNumber
          .replaceAll('.', '')
          .replaceAll('x', '')
          .replaceAll('-', '').replaceAll(' ', ''));
    } on UnimplementedError catch (e) {
      emit(ErrorOperationState(
          errorMessage: e.message ?? 'unable to call',
          timeStamp: DateTime.now().millisecond));
    }
  }

  void openEmail(UserModel userModel) {
    try {
      phoneServices.openEmail(userModel);
    } on Exception catch (e) {
      emit(ErrorOperationState(
          errorMessage: e.toString(), timeStamp: DateTime.now().millisecond));
    }
  }
}
