import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/src/core/constants/movies_text.dart';
import 'package:movies_app/src/core/managers/navigator_manager.dart';

class LoadingOverlay {
  static void showLoader() {
    NavigatorManager.openDialog(const FullScreenLoader());
  }

  static void hideLoader() {
    NavigatorManager.closeDialog();
  }

  static Future<T> whileFuture<T>(Future<T> future,
      {bool loader = true}) async {
    if (!loader) {
      return future;
    }
    try {
      showLoader();
      return await future.timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          throw TimeoutException(GeneralText.timeout);
        },
      ).catchError(
        (error) {
          throw error;
        },
      );
    } catch (error) {
      rethrow;
    } finally {
      hideLoader();
    }
  }
}

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Center(
        child: Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .35,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CupertinoActivityIndicator(),
                const SizedBox(
                  height: 15,
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(GeneralText.loading),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
