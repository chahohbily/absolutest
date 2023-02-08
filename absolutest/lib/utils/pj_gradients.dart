import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PjGradients {
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromRGBO(243, 241, 255, 1),
      Color.fromRGBO(171, 169, 255, 1),
    ],
    transform: GradientRotation(pi / 3.5),
  );
}
