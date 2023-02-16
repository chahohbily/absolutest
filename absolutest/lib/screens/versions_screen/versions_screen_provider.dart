import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'versions_screen.dart';
import 'cubit/cb_versions_screen.dart';

class VersionsScreenProvider extends StatelessWidget {
  const VersionsScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CbVersionsScreen>(
      create: (context) => CbVersionsScreen(),
      child: const VersionsScreen(),
    );
  }
}    
    