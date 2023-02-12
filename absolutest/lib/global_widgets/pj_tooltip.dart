import 'dart:ui';

import 'package:absolutest/global_widgets/glassmorphism_effect.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_icons.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class PjTooltip extends StatelessWidget {
  final JustTheController tooltipController;
  final List<String> errorsList;
  final bool isButtonTapped;
  final bool maintainSize;

  const PjTooltip({
    Key? key,
    required this.tooltipController,
    required this.isButtonTapped,
    required this.errorsList,
    this.maintainSize = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: errorsList.isNotEmpty && isButtonTapped,
      maintainSize: maintainSize,
      maintainAnimation: maintainSize,
      maintainState: maintainSize,
      child: JustTheTooltip(
        backgroundColor: Colors.white.withOpacity(0.3),
        tailLength: 0,
        offset: 5,
        shadow: const Shadow(color: Colors.transparent),
        controller: tooltipController,
        borderRadius: BorderRadius.circular(13),
        content: GlassMorphismEffect(
          borderRadius: 13,
          sigma: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: PjColors.redError),
              borderRadius: BorderRadius.circular(13),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                errorsList.length,
                (index) => Text(
                  errorsList[index],
                  style: PjTextStyles.errorAbel11,
                ),
              ),
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              tooltipController.showTooltip();
            },
            child: PjIcons().errorCircleRounded,
          ),
        ),
      ),
    );
  }
}
