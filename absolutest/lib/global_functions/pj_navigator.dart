import 'package:flutter/cupertino.dart';

void pjNavigator(BuildContext context, Widget nextScreenProvider){
  Navigator.of(context).push(
    CupertinoPageRoute(
      builder: (context) {
        return nextScreenProvider;
      },
    ),
  );
}