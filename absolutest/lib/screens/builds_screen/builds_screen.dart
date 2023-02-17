import 'package:absolutest/global_widgets/logo_animation.dart';
import 'package:absolutest/global_widgets/pj_app_bar.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:absolutest/global_widgets/project_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'cubit/cb_builds_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildsScreen extends StatelessWidget implements AutoRouteWrapper{
  const BuildsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
      appBar: const PjAppBar(title: 'Сборки'),
      body: BlocBuilder<CbBuildsScreen, StBuildsScreen>(
        builder: (context, state) => state.when(
          loading: () => const LogoAnimation(),
          error: (code, message) => const Placeholder(),
          loaded: () => ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(top: 10),
              child: ProjectContainer.builds(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbBuildsScreen>(
      create: (context) => CbBuildsScreen(),
      child: this,
    );
  }
}
