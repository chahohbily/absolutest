import 'package:absolutest/global_widgets/pj_app_bar.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cubit/cb_builds_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildsScreen extends StatelessWidget {
  const BuildsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
      appBar: const PjAppBar(),
      body: BlocBuilder<CbBuildsScreen, StBuildsScreen>(
        builder: (context, state) => state.when(
          loading: () => const Center(
            child: CupertinoActivityIndicator(),
          ),
          error: (code, message) => const Placeholder(),
          loaded: () => ListView.builder(
            itemBuilder: (context, index) => Container(),
          ),
        ),
      ),
    );
  }
}
