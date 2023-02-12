import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'project_page_screen.dart';
import 'cubit/cb_project_page_screen.dart';
import 'cubit/st_project_page_screen.dart';

class ProjectPageScreenProvider extends StatelessWidget {
  const ProjectPageScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CbProjectPageScreen>(
      create: (context) => CbProjectPageScreen(),
      child: const ProjectPageScreen(),
    );
  }
}    
    