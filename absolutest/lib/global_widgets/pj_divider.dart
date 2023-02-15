import 'package:absolutest/utils/pj_colors.dart';
import 'package:flutter/material.dart';

class PjDivider extends StatelessWidget {
  const PjDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: PjColors.purple.withOpacity(0.4),
    );
  }
}
