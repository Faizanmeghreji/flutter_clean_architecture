import 'package:flutter/material.dart';
import 'package:practical_one/models/user_model.dart';
import 'package:practical_one/utils/constants.dart';

class UserTile extends StatefulWidget {
  UserTile(
      {Key? key,
      required this.userModel,
      required this.onEmailClick,
      required this.onItemClick,
      required this.onNumberClick})
      : super(key: key);
  final UserModel? userModel;
  final Function(UserModel userModel) onItemClick;
  final Function(String mobileNumber) onNumberClick;
  final Function(UserModel userModel) onEmailClick;

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  final double padding = 8.0;
  final double spaceBetween = 15.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        decoration: BoxDecoration(
            border:
                Border.all(width: 2, color: Color.fromRGBO(86, 82, 82, 1.0)),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: InkWell(
          onTap: () {
            widget.onItemClick.call(widget.userModel ?? UserModel());
          },
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(child: Text(Constants.name)),
                    SizedBox(
                      width: spaceBetween,
                    ),
                    Flexible(child: Text(widget.userModel?.name ?? '')),
                  ],
                ),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                        child: Text(
                      Constants.email,
                    )),
                    SizedBox(
                      width: spaceBetween,
                    ),
                    Flexible(
                        child: InkWell(
                          onTap: (){
                            widget.onEmailClick
                                .call(widget.userModel ?? UserModel());
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0,4,0,4),
                            child: Text(
                      widget.userModel?.email ?? '',
                      style: TextStyle(color: Colors.blue),
                    ),
                          ),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(child: Text(Constants.phone)),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: InkWell(
                          onTap: (){
                            widget.onNumberClick
                                .call(widget.userModel?.phone ?? '');
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0,4,0,4),
                            child: Text(
                      widget.userModel?.phone ?? '',
                      style: TextStyle(color: Colors.blue),
                    ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
