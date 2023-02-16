import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'about_project_screen.dart';
import 'cubit/cb_about_project_screen.dart';

class AboutProjectScreenProvider extends StatelessWidget {
  const AboutProjectScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CbAboutProjectScreen>(
      create: (context) => CbAboutProjectScreen(),
      child: const AboutProjectScreen(),
    );
  }
}    
    