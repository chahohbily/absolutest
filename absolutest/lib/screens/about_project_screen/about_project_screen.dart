import 'dart:developer';

import 'package:absolutest/global_widgets/logo_animation.dart';
import 'package:absolutest/global_widgets/pj_app_bar.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:absolutest/global_widgets/title_and_text.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'cubit/cb_about_project_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutProjectScreen extends StatelessWidget implements AutoRouteWrapper{
  const AboutProjectScreen({Key? key})
      : tableTitles = const [
          'Разработчик',
          'Дата выхода',
          'Версия',
          'Размер',
          'Совместимость',
        ],
        super(key: key);

  final List<String> tableTitles;

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
      appBar: const PjAppBar(title: 'Сведения о приложении'),
      body: BlocBuilder<CbAboutProjectScreen, StAboutProjectScreen>(
        builder: (context, state) => state.when(
          loading: () => const LogoAnimation(),
          error: (code, message) => const Placeholder(),
          loaded: () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 26),
              const TextAndTitle(
                  title: 'Описание',
                  text:
                      'Какое - то описание описание описаний описание описаний пишет пишет пишет пишет пишет что - то Лера и степа\n'),
              const SizedBox(height: 20),
              const Text(
                'Информация о сборке',
                style: PjTextStyles.interMedium16,
              ),
              Column(
                children: List.generate(
                  5,
                  (index) => Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: PjColors.purple.withOpacity(0.4),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Row(
                        children: [
                          Text(
                            tableTitles[index],
                            style: PjTextStyles.interRegular14.copyWith(
                              color: PjColors.gray2.withOpacity(0.95),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '1.0.0 (7)',
                            style: PjTextStyles.interRegular14.copyWith(
                              color: PjColors.gray2.withOpacity(0.95),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbAboutProjectScreen>(
      create: (context) => CbAboutProjectScreen(),
      child: this,
    );
  }
}
