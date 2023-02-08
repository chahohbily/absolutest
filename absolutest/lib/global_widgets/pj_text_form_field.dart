import 'dart:ui';

import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/material.dart';

class PjTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const PjTextFormField({Key? key, required this.controller}) : super(key: key);

  InputBorder inputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white.withOpacity(0.5),
      ),
      borderRadius: BorderRadius.circular(15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: TextFormField(
          controller: controller,
          cursorHeight: 19,
          style: PjTextStyles.abelRegular16.copyWith(color: PjColors.gray2),
          cursorColor: PjColors.gray.withOpacity(0.85),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.3),
            border: inputBorder(),
            disabledBorder: inputBorder(),
            enabledBorder: inputBorder(),
            focusedBorder: inputBorder(),
            isDense: false,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
          ),
        ),
      ),
    );
  }
}
