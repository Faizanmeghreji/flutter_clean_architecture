import 'package:flutter/material.dart';
import 'package:practical_one/models/user_model.dart';
import 'package:practical_one/utils/constants.dart';

class UserDetailsPage extends StatefulWidget {
  static const route = "/usersDetails";

  UserDetailsPage({Key? key}) : super(key: key);

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    if (arguments.containsKey('userModel')) {
      userModel = arguments['userModel'] as UserModel;
    }
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: Text(Constants.name),flex: 1,),
                SizedBox(
                  width: 15,
                ),
                Flexible(child: Text(userModel?.name ?? ''),flex: 2,),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: Text(Constants.email)),
                SizedBox(
                  width: 15,
                ),
                Flexible(child: Text(userModel?.email ?? '')),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: Text(Constants.phone)),
                SizedBox(
                  width: 15,
                ),
                Flexible(child: Text(userModel?.phone ?? '')),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: Text(Constants.address)),
                SizedBox(
                  width: 15,
                ),
                Flexible(child: Text(userModel?.address ?? '')),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: Text(Constants.companyName)),
                SizedBox(
                  width: 15,
                ),
                Flexible(child: Text(userModel?.companyName ?? '')),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: Text(Constants.website)),
                SizedBox(
                  width: 15,
                ),
                Flexible(child: Text(userModel?.website ?? '')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
