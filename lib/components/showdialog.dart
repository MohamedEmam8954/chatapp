import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showdialog(BuildContext context, String message) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    desc: message,
  ).show();
}
