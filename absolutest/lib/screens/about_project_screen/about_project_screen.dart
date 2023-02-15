import 'package:absolutest/global_widgets/pj_app_bar.dart';
import 'package:absolutest/global_widgets/pj_divider.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:absolutest/global_widgets/title_and_text.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cubit/cb_about_project_screen.dart';
import 'cubit/st_about_project_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutProjectScreen extends StatelessWidget {
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
        builder: (context, state) {
          if (state is StAboutProjectScreenLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is StAboutProjectScreenLoaded) {
            return Column(
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
            );
          }
          if (state is StAboutProjectScreenError) {
            return Container(color: Colors.red);
          }
          return Container(color: Colors.grey);
        },
      ),
    );
  }
}
