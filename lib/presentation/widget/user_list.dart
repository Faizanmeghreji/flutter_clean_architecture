import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_one/presentation/bloc/UserBloc.dart';
import 'package:practical_one/presentation/bloc/user_state.dart';
import 'package:practical_one/presentation/widget/shimmer_tile.dart';
import 'package:practical_one/presentation/widget/user_details.dart';
import 'package:practical_one/presentation/widget/user_tile.dart';

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
    userBloc = UserCubit();
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
        child: BlocBuilder<UserCubit, UserState>(
          bloc: userBloc,
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
                height: 50,
                width: 50,
                color: Colors.red,
              );
            }
          },
        ),
      ),
    );
  }
}
