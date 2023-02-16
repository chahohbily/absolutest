import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page_screen.dart';
import 'cubit/cb_home_page_screen.dart';

class HomeScreenProvider extends StatelessWidget {
  const HomeScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CbHomeScreen>(
      create: (context) => CbHomeScreen(),
      child: const HomeScreen(),
    );
  }
}    
    