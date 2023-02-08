import 'package:absolutest/utils/pj_gradients.dart';
import 'package:absolutest/utils/pj_icons.dart';
import 'package:flutter/material.dart';

class ScreenLayout extends StatelessWidget {
  final Widget child;

  const ScreenLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: PjGradients.backgroundGradient,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: PjIcons().logo,
                ),
              ),
              Positioned(
                top: -150,
                left: -100,
                child: PjIcons().background,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: PjIcons().secondBackground,
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
