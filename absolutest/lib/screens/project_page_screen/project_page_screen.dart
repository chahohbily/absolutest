import 'package:absolutest/global_functions/pj_navigator.dart';
import 'package:absolutest/global_widgets/pj_app_bar.dart';
import 'package:absolutest/global_widgets/pj_divider.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:absolutest/global_widgets/project_container.dart';
import 'package:absolutest/global_widgets/title_and_text.dart';
import 'package:absolutest/screens/about_project_screen/about_project_screen_provider.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_icons.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cubit/cb_project_page_screen.dart';
import 'cubit/st_project_page_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectPageScreen extends StatelessWidget {
  const ProjectPageScreen({Key? key}) : super(key: key);

  Widget _buildTextRow({
    required String text,
    bool isWithIcon = true,
    String? version,
    Function()? onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap ?? () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 13),
          Row(
            children: [
              Text(
                text,
                style: PjTextStyles.interRegular14.copyWith(
                  color: PjColors.gray2.withOpacity(0.95),
                ),
              ),
              const Spacer(),
              if (version != null) ...[
                Text(
                  version,
                  style: PjTextStyles.interRegular14.copyWith(
                    color: PjColors.gray2.withOpacity(0.95),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 13),
              ],
              if (!isWithIcon)
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: false,
                    onChanged: (val) {},
                  ),
                )
              else
                PjIcons().nextArrow,
              const SizedBox(width: 13),
            ],
          ),
          const SizedBox(height: 13),
          const PjDivider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
      appBar: const PjAppBar(),
      body: BlocBuilder<CbProjectPageScreen, StProjectPageScreen>(
        builder: (context, state) {
          if (state is StProjectPageScreenLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is StProjectPageScreenLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const ProjectContainer.presentation(),
                const SizedBox(height: 20),
                const TextAndTitle(
                  title: 'Заметки о тестировании',
                  text: 'Тестирование тестирование тестирование',
                ),
                const SizedBox(height: 20),
                const Text(
                  'Информация о приложении',
                  style: PjTextStyles.interMedium16,
                ),
                _buildTextRow(
                    text: 'Сведения о приложении',
                    onTap: () {
                      pjNavigator(
                        context: context,
                        nextScreenProvider: const AboutProjectScreenProvider(),
                      );
                    }),
                _buildTextRow(
                  text: 'Автоматическое обновление',
                  isWithIcon: false,
                ),
                _buildTextRow(
                  text: 'Уведомления',
                ),
                _buildTextRow(
                  text: 'Предыдущие версии',
                  version: '1.0.0 (6)',
                ),
              ],
            );
          }
          if (state is StProjectPageScreenError) {
            return Container(color: Colors.red);
          }
          return Container(color: Colors.grey);
        },
      ),
    );
  }
}
