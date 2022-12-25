import 'package:flutter/material.dart';

showAlertDialog(
    {required BuildContext context,
    required String title,
    required String description,
    required String positiveButton,
    required Function onPositiveClick}) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(positiveButton),
    onPressed: () {
      onPositiveClick.call();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(description),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
