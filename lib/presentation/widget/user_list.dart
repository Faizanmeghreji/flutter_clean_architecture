import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_one/di/register_objects.dart';
import 'package:practical_one/presentation/bloc/user_cubit.dart';
import 'package:practical_one/presentation/bloc/user_state.dart';
import 'package:practical_one/presentation/widget/shimmer_tile.dart';
import 'package:practical_one/presentation/widget/user_details.dart';
import 'package:practical_one/presentation/widget/user_tile.dart';
import 'package:practical_one/utils/alert_dialog.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);
  static const route = "/usersPage";

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late var userBloc;

  @override
  void initState() {
    userBloc = sl.get<UserCubit>();
    userBloc.getUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User list demo'),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is ErrorOperationState) {
              showAlertDialog(
                  context: context,
                  title: 'Error',
                  description: state.errorMessage,
                  onPositiveClick: () {
                    Navigator.of(context).pop();
                  },
                  positiveButton: 'Ok');
            }
          },
          bloc: userBloc,
          buildWhen: (preState, curState) {
            return (curState is UserLoadingState ||
                curState is UserSuccessState ||
                curState is ErrorState);
          },
          builder: (context, state) {
            if (state is UserLoadingState) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ShimmerTile();
                    },
                    itemCount: 5,
                  ),
                ),
              );
            } else if (state is UserSuccessState) {
              return ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return UserTile(
                    userModel: state.mUserList[index],
                    onEmailClick: (userModel) {
                      userBloc.openEmail(userModel);
                    },
                    onItemClick: (userModel) {
                      Navigator.of(context).pushNamed(UserDetailsPage.route,
                          arguments: {'userModel': userModel});
                    },
                    onNumberClick: (userPhone) {
                      userBloc.makingPhoneCall(userPhone);
                    },
                  );
                },
                itemCount: state.mUserList.length,
              );
            } else {
              return Container(
                child: Center(
                  child: Text(
                    'oops, error',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
