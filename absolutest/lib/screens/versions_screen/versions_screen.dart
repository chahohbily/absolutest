import 'dart:developer';

import 'package:absolutest/global_widgets/logo_animation.dart';
import 'package:absolutest/global_widgets/pj_app_bar.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:absolutest/utils/app_router.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_icons.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'cubit/cb_versions_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VersionsScreen extends StatelessWidget implements AutoRouteWrapper{
  const VersionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
      appBar: const PjAppBar(title: 'Версии'),
      body: BlocBuilder<CbVersionsScreen, StVersionsScreen>(
        builder: (ctx, state) => state.when(
          loading: () => const LogoAnimation(),
          error: (code, message) => const Placeholder(),
          loaded: () => ListView.builder(
            itemCount: 8,
            itemBuilder: (ctx, index) => GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                context.router.push(const BuildsScreenRoute());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: PjColors.purple.withOpacity(0.4),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      '1.0.0',
                      style: PjTextStyles.interRegular14.copyWith(
                        color: PjColors.gray2.withOpacity(0.95),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '6 сборок',
                      style: PjTextStyles.interRegular14.copyWith(
                        color: PjColors.gray2.withOpacity(0.95),
                      ),
                    ),
                    const SizedBox(width: 13),
                    PjIcons().nextArrow,
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbVersionsScreen>(
      create: (context) => CbVersionsScreen(),
      child: this,
    );
  }
}
