import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'builds_screen.dart';
import 'cubit/cb_builds_screen.dart';

class BuildsScreenProvider extends StatelessWidget {
  const BuildsScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CbBuildsScreen>(
      create: (context) => CbBuildsScreen(),
      child: const BuildsScreen(),
    );
  }
}    
    