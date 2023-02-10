import 'dart:developer';
import 'dart:ui';

import 'package:absolutest/global_functions/validator.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/material.dart';

enum TextFieldType {
  PIN_CODE,
  TEXT,
  PASSWORD,
  EMAIL,
}

class PjTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextFieldType type;
  final Function(String)? callback;
  final bool isButtonTapped;

  const PjTextFormField({
    Key? key,
    required this.controller,
    this.callback,
    this.isButtonTapped = false,
  })  : type = TextFieldType.TEXT,
        super(key: key);

  const PjTextFormField.pinCode({
    Key? key,
    required this.controller,
    this.callback,
    this.isButtonTapped = false,
  })  : type = TextFieldType.PIN_CODE,
        super(key: key);

  const PjTextFormField.password({
    Key? key,
    required this.controller,
    this.callback,
    this.isButtonTapped = false,
  })  : type = TextFieldType.PASSWORD,
        super(key: key);

  const PjTextFormField.email({
    Key? key,
    required this.controller,
    this.callback,
    this.isButtonTapped = false,
  })  : type = TextFieldType.EMAIL,
        super(key: key);

  @override
  State<PjTextFormField> createState() => _PjTextFormFieldState();
}

class _PjTextFormFieldState extends State<PjTextFormField> {
  InputBorder inputBorder(bool isValidate) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: !isValidate && widget.isButtonTapped
            ? PjColors.redError
            : Colors.white.withOpacity(0.5),
      ),
      borderRadius: BorderRadius.circular(15),
    );
  }

  bool isValidate = true;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: TextFormField(
          controller: widget.controller,
          cursorHeight: 19,
          obscureText: widget.type == TextFieldType.PASSWORD ? true : false,
          textAlign: TextAlign.start,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          style: PjTextStyles.abelRegular16.copyWith(
            letterSpacing: widget.type == TextFieldType.PIN_CODE
                ? MediaQuery.of(context).size.width / 42
                : null,
          ),
          cursorColor: PjColors.gray.withOpacity(0.85),
          maxLength: widget.type == TextFieldType.PIN_CODE ? 4 : null,
          decoration: InputDecoration(
            filled: true,
            hintText: widget.type == TextFieldType.PIN_CODE ? '0000' : null,
            fillColor: Colors.white.withOpacity(0.3),
            border: inputBorder(isValidate),
            disabledBorder: inputBorder(isValidate),
            enabledBorder: inputBorder(isValidate),
            focusedBorder: inputBorder(isValidate),
            counterText: '',
            isDense: false,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: widget.type == TextFieldType.PIN_CODE ? 15 : 10,
            ),
          ),
          onChanged: (text) {
            if (isValidate != validation(text, widget.type)) {
              setState(() {
                isValidate = !isValidate;
              });
            }
            if (widget.callback != null) {
              widget.callback!(text);
            }
            if (widget.type == TextFieldType.PIN_CODE && text.length == 4) {
              FocusScope.of(context).unfocus();
            }
          },
        ),
      ),
    );
  }
}
