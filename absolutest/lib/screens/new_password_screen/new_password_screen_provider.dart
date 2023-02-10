import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'new_password_screen.dart';
import 'cubit/cb_new_password_screen.dart';

class NewPasswordScreenProvider extends StatelessWidget {
  const NewPasswordScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CbNewPasswordScreen>(
      create: (context) => CbNewPasswordScreen(),
      child: NewPasswordScreen(),
    );
  }
}    
    