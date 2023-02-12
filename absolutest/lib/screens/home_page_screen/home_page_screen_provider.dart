import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page_screen.dart';
import 'cubit/cb_home_page_screen.dart';
import 'cubit/st_home_page_screen.dart';

class HomePageScreenProvider extends StatelessWidget {
  const HomePageScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CbHomePageScreen>(
      create: (context) => CbHomePageScreen(),
      child: const HomePageScreen(),
    );
  }
}    
    