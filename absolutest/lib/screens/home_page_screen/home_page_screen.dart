import 'package:absolutest/global_functions/pj_navigator.dart';
import 'package:absolutest/global_widgets/pj_app_bar.dart';
import 'package:absolutest/global_widgets/project_container.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:absolutest/screens/project_page_screen/project_page_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cubit/cb_home_page_screen.dart';
import 'cubit/st_home_page_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
      appBar: const PjAppBar.homePage(title: 'Проекты'),
      body: BlocBuilder<CbHomePageScreen, StHomePageScreen>(
        builder: (context, state) {
          if (state is StHomePageScreenLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is StHomePageScreenLoaded) {
            return ListView.builder(
              itemCount: 3,
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 50,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ProjectContainer(
                    callback: () {
                      pjNavigator(
                        context: context,
                        nextScreenProvider: const ProjectPageScreenProvider(),
                      );
                    },
                  ),
                );
              },
            );
          }
          if (state is StHomePageScreenError) {
            return Container(color: Colors.red);
          }
          return Container(color: Colors.grey);
        },
      ),
    );
  }
}
