import 'package:absolutest/global_widgets/pj_button.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProjectContainer extends StatelessWidget {
  final bool isPresentationContainer;
  final bool isWithAvatar;
  final VoidCallback? callback;

  const ProjectContainer({
    Key? key,
    this.callback,
  })  : isPresentationContainer = false,
        isWithAvatar = true,
        super(key: key);

  const ProjectContainer.presentation({
    Key? key,
    this.callback,
  })  : isPresentationContainer = true,
        isWithAvatar = true,
        super(key: key);

  const ProjectContainer.builds({
    Key? key,
    this.callback,
  })  : isPresentationContainer = false,
        isWithAvatar = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      //behavior: HitTestBehavior.translucent,
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
                if (isWithAvatar)
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
                    Text(
                      'Instagram',
                      style: isPresentationContainer
                          ? PjTextStyles.interMedium18
                          : PjTextStyles.interRegular14.copyWith(
                              fontWeight: isWithAvatar
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                            ),
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
