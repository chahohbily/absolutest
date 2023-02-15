import 'dart:ui';

import 'package:absolutest/global_widgets/glassmorphism_effect.dart';
import 'package:absolutest/global_widgets/pj_button.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/material.dart';

class LoginScreensLayout extends StatefulWidget {
  final String screenTitle;
  final Column centerContainerContent;
  final String buttonText;
  final VoidCallback buttonOnTap;

  const LoginScreensLayout({
    Key? key,
    required this.screenTitle,
    required this.buttonText,
    required this.buttonOnTap,
    required this.centerContainerContent,
  }) : super(key: key);

  @override
  State<LoginScreensLayout> createState() => _LoginScreensLayoutState();
}

class _LoginScreensLayoutState extends State<LoginScreensLayout> {
  late final double bottomButtonPadding =
      MediaQuery.of(context).size.height / 8;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomButtonPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 275,
                    child: Text(
                      widget.screenTitle,
                      style: PjTextStyles.interRegular28.copyWith(
                        color: PjColors.purple,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  GlassMorphismEffect(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      child: widget.centerContainerContent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: bottomButtonPadding,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PjButton(
                text: widget.buttonText,
                onTap: widget.buttonOnTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
