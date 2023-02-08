import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/material.dart';

class PjButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const PjButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: PjColors.purple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: PjTextStyles.abelRegular18.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
