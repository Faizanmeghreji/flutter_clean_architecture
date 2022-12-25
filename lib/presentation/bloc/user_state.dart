import 'package:equatable/equatable.dart';
import 'package:practical_one/models/user_model.dart';
import 'package:practical_one/reponse_model/user_response.dart';

abstract class UserState extends Equatable {}

class InitialUserState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserSuccessState extends UserState {
  final List<UserModel> mUserList;

  UserSuccessState({ required this.mUserList});

  @override
  List<Object?> get props => [mUserList];
}

class ErrorState extends UserState {
  final String errorMessage;
  ErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class UserLoadingState extends UserState {
  UserLoadingState();

  @override
  List<Object?> get props => [];
}
