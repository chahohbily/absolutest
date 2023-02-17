import 'package:absolutest/global_widgets/logo_animation.dart';
import 'package:absolutest/global_widgets/pj_app_bar.dart';
import 'package:absolutest/global_widgets/pj_button.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cubit/cb_report_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportScreen extends StatelessWidget implements AutoRouteWrapper{
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
      appBar: const PjAppBar(title: 'Добавить отчет'),
      body: BlocBuilder<CbReportScreen, StReportScreen>(
        builder: (context, state) => state.when(
          loading: () => const LogoAnimation(),
          error: (code, message) => const Placeholder(),
          loaded: () => Column(
            children: [
              const SizedBox(height: 10),
              const TextField(),
              const SizedBox(height: 15),
              PjButton.project(
                text: 'Загрузить фото',
                onTap: () {},
                withIcon: true,
              ),
              const SizedBox(height: 15),
              ListView.builder(
                itemBuilder: (context, index) => Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbReportScreen>(
      create: (context) => CbReportScreen(),
      child: this,
    );
  }
}
