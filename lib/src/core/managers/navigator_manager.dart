import 'package:flutter/material.dart';
import 'package:movies_app/src/core/constants/movies_text.dart';
import 'package:movies_app/src/core/constants/routes.dart';

class NavigatorManager {
  static final GlobalKey<NavigatorState> navKey = AppRoutes.navKey;

  static Future<void> openDialog(
    Widget dialog, {
    bool dismissable = true,
  }) {
    return showDialog(
      context: navKey.currentContext!,
      builder: (context) {
        return WillPopScope(
            child: dialog,
            onWillPop: () {
              return Future.value(dismissable);
            });
      },
    );
  }

  static void closeDialog() {
    if (Navigator.of(navKey.currentContext!).canPop()) {
      Navigator.of(navKey.currentContext!).pop();
    }
  }

  static void errorDialog() {
    NavigatorManager.openDialog(
      Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(GeneralText.error),
            ElevatedButton(
              onPressed: NavigatorManager.closeDialog,
              child: Text(GeneralText.close),
            )
          ],
        ),
      ),
      dismissable: true,
    );
  }
}
