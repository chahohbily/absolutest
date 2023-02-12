import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:absolutest/global_widgets/project_container.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cubit/cb_project_page_screen.dart';
import 'cubit/st_project_page_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectPageScreen extends StatelessWidget {
  const ProjectPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
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
                const SizedBox(height: 80),
                const ProjectContainer.presentation(),
                const SizedBox(height: 25),
                const Text(
                  'Заметки о тестировании',
                  style: PjTextStyles.interRegular16,
                ),
                const SizedBox(height: 10),
                Text(
                  'Тестирование тестирование тестирование тестирование тестирование тестирование тестрование хз что тут писать вообще, надо Рому спросить',
                  style: PjTextStyles.interRegular14.copyWith(
                    color: PjColors.gray2.withOpacity(0.85),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 15),
                Divider(color: PjColors.purple.withOpacity(0.4)),
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
