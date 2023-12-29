import 'package:flutter/material.dart';

Future<Future> showAlertDialog({
  required BuildContext context,
  required String titleText,
  required String messageText,
}) async {
  // set up the buttons
  final Widget okButton = TextButton(
    onPressed: () => Navigator.pop(context, 'yes'),
    child: const Text('Ok'),
  );

  // set up the AlertDialog
  final alert = AlertDialog(
    title: Text(titleText),
    content: Text(messageText),
    actions: [
      okButton
    ],
  );

  // show the dialog
  return showDialog(
    context: context,
    builder: (context) => alert,
  );
}