import 'package:absolutest/global_widgets/pj_divider.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/material.dart';

class TextAndTitle extends StatelessWidget {
  final String title;
  final String text;

  const TextAndTitle({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: PjTextStyles.interMedium16,
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: PjTextStyles.interRegular14.copyWith(
            color: PjColors.gray2.withOpacity(0.95),
          ),
        ),
        const SizedBox(height: 13),
        const PjDivider(),
      ],
    );
  }
}
