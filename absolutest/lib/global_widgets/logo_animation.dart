import 'package:absolutest/utils/pj_icons.dart';
import 'package:flutter/material.dart';

class LogoAnimation extends StatefulWidget {
  const LogoAnimation({Key? key}) : super(key: key);

  @override
  State<LogoAnimation> createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation> {
  @override
  Widget build(BuildContext context) {
    return PjIcons().logo;
  }
}
