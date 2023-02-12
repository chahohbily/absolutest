import 'package:absolutest/global_widgets/pj_button.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectContainer extends StatelessWidget {
  final bool isPresentationContainer;
  final VoidCallback? callback;

  const ProjectContainer({
    Key? key,
    this.callback,
  }) : isPresentationContainer = false, super(key: key);

  const ProjectContainer.presentation({
    Key? key,
    this.callback,
  }) : isPresentationContainer = true, super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: callback ?? () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: PjColors.whiteOpacity3),
          color: PjColors.whiteOpacity7,
          boxShadow: const [
            BoxShadow(
              color: PjColors.shadow,
              blurRadius: 20,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 13,
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: PjColors.whiteOpacity3),
                      color: PjColors.whiteOpacity5,
                      boxShadow: const [
                        BoxShadow(
                          color: PjColors.shadow,
                          blurRadius: 6.21,
                        )
                      ],
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/logo.svg',
                      height: 1,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Instagram',
                      style: PjTextStyles.interRegular14,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Версия 1.0.0 (5)',
                      style: PjTextStyles.interRegular11.copyWith(
                        color: PjColors.gray2.withOpacity(0.85),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Добавлен 75 дней назад',
                      style: PjTextStyles.interRegular11.copyWith(
                        color: PjColors.gray2.withOpacity(0.85),
                      ),
                    ),
                    if (isPresentationContainer) ...[
                      const SizedBox(height: 19),
                      PjButton.project(
                        text: 'Открыть',
                        onTap: () {},
                      ),
                    ],
                  ],
                ),
                if (!isPresentationContainer) ...[
                  const Spacer(),
                  PjButton.project(
                    text: 'Открыть',
                    onTap: () {},
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
