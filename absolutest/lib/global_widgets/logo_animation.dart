import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogoAnimation extends StatefulWidget {
  const LogoAnimation({Key? key}) : super(key: key);

  @override
  State<LogoAnimation> createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: 0.6,
        child: Lottie.asset(
          'assets/lottie/logo.json',
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = const Duration(milliseconds: 1700)
              ..forward()
              ..repeat();
          },
        ),
      ),
    );
  }
}
