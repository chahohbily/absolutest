import 'package:absolutest/global_widgets/logo_animation.dart';
import 'package:absolutest/global_widgets/pj_app_bar.dart';
import 'package:absolutest/global_widgets/project_container.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:absolutest/utils/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'cubit/cb_home_page_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget implements AutoRouteWrapper{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
      appBar: const PjAppBar.homePage(title: 'Проекты'),
      body: BlocBuilder<CbHomeScreen, StHomeScreen>(
        builder: (context, state) => state.when(
          loading: () => const LogoAnimation(),
          error: (code, message) => const Placeholder(),
          loaded: () => ListView.builder(
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
                    context.router.push(const ProjectPageScreenRoute());
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbHomeScreen>(
      create: (context) => CbHomeScreen(),
      child: this,
    );
  }
}
