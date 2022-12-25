import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_one/di/register_objects.dart';
import 'package:practical_one/models/user_model.dart';
import 'package:practical_one/presentation/bloc/user_cubit.dart';
import 'package:practical_one/presentation/bloc/user_state.dart';
import 'package:practical_one/utils/alert_dialog.dart';
import 'package:practical_one/utils/constants.dart';

class UserDetailsPage extends StatefulWidget {
  static const route = "/usersDetails";

  UserDetailsPage({Key? key}) : super(key: key);

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  UserModel? userModel;
  late UserCubit userCubit;

  @override
  void initState() {
    userCubit = sl.get<UserCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    if (arguments.containsKey('userModel')) {
      userModel = arguments['userModel'] as UserModel;
    }
    double spaceBetween = 20;
    double spaceBetweenRow = 8;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: BlocListener(
          bloc: userCubit,
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Color.fromRGBO(86, 82, 82, 1.0)),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(Constants.name),
                          flex: 1,
                        ),
                        SizedBox(
                          width: spaceBetween,
                        ),
                        Expanded(
                          child: Text(userModel?.name ?? ''),
                          flex: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(Constants.email),
                          flex: 1,
                        ),
                        SizedBox(
                          width: spaceBetween,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              userCubit.openEmail(userModel ?? UserModel());
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: Text(userModel?.email ?? '',
                                  style: TextStyle(color: Colors.blue)),
                            ),
                          ),
                          flex: 2,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(Constants.phone),
                          flex: 1,
                        ),
                        SizedBox(
                          width: spaceBetween,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              userCubit.makingPhoneCall(userModel?.phone ?? '');
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: Text(
                                userModel?.phone ?? '',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                          flex: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(Constants.address),
                          flex: 1,
                        ),
                        SizedBox(
                          width: spaceBetween,
                        ),
                        Expanded(
                          child: Text(userModel?.address ?? ''),
                          flex: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spaceBetweenRow,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(Constants.companyName),
                          flex: 1,
                        ),
                        SizedBox(
                          width: spaceBetween,
                        ),
                        Expanded(
                          child: Text(userModel?.companyName ?? ''),
                          flex: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spaceBetweenRow,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(Constants.website),
                          flex: 1,
                        ),
                        SizedBox(
                          width: spaceBetween,
                        ),
                        Expanded(
                          child: Text(userModel?.website ?? ''),
                          flex: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
