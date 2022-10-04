import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_ismail/src/core/utils/colors/colors_manager.dart';
import 'package:flutter_clean_architecture_ismail/src/core/utils/strings_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Components {
  static void defaultDialog(BuildContext context,
          {required String title, required String msg}) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
          content: Text(msg, style: Theme.of(context).textTheme.bodyMedium),
          actions: [
            MaterialButton(
                onPressed: () => Navigator.pop(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: ColorsManager.white,
                child: Text(
                  AppStrings.ok,
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
          ],
        ),
      );

  static void defaultToast(String msg) =>
      Fluttertoast.showToast(
        msg: msg,
        backgroundColor: ColorsManager.primaryColor,
        fontSize: 14,
        textColor: ColorsManager.black,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
}
