import 'package:flutter/cupertino.dart';

void pjNavigator({
  required BuildContext context,
  required Widget nextScreenProvider,
  bool isRemoveUntil = false,
}) {
  if (isRemoveUntil) {
    Navigator.of(context).pushAndRemoveUntil(
      CupertinoPageRoute(
        builder: (context) {
          return nextScreenProvider;
        },
      ),
          (Route<dynamic> route) => false,
    );
  } else {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) {
          return nextScreenProvider;
        },
      ),
    );
  }
}
