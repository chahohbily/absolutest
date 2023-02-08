import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'restore_password_code_screen.dart';
import 'cubit/cb_restore_password_code_screen.dart';

class RestorePasswordCodeScreenProvider extends StatelessWidget {
  final String email;
  const RestorePasswordCodeScreenProvider({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CbRestorePasswordCodeScreen>(
      create: (context) => CbRestorePasswordCodeScreen(),
      child: RestorePasswordCodeScreen(email: email),
    );
  }
}    
    