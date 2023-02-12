import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphismEffect extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double sigma;

  const GlassMorphismEffect({
    Key? key,
    required this.child,
    this.borderRadius = 20,
    this.sigma = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: child,
      ),
    );
  }
}
