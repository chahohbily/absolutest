import 'package:absolutest/global_widgets/login_screens_layout.dart';
import 'package:absolutest/utils/pj_navigator.dart';
import 'package:absolutest/global_widgets/pj_text_form_field.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:absolutest/screens/restore_password_code_screen/restore_password_code_screen_provider.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cubit/cb_login_screen.dart';
import 'cubit/st_login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
      body: BlocBuilder<CbLoginScreen, StLoginScreen>(
        builder: (context, state) {
          if (state is StLoginScreenLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is StLoginScreenLoaded) {
            return LoginScreensLayout(
              screenTitle: 'Вход',
              buttonText: 'Войти',
              buttonOnTap: () {},
              centerContainerContent: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Почта',
                    style: PjTextStyles.abelRegular16.copyWith(
                      color: PjColors.gray.withOpacity(0.85),
                    ),
                  ),
                  const SizedBox(height: 10),
                  PjTextFormField(
                    controller: _emailController,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Пароль',
                    style: PjTextStyles.abelRegular16.copyWith(
                      color: PjColors.gray.withOpacity(0.85),
                    ),
                  ),
                  const SizedBox(height: 10),
                  PjTextFormField(
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        pjNavigator(
                          context,
                          RestorePasswordCodeScreenProvider(email: _emailController.text,),
                        );
                      },
                      child: Text(
                        'Забыли пароль?',
                        style: PjTextStyles.abelRegular14
                            .copyWith(color: PjColors.gray),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is StLoginScreenError) {
            return Container(color: Colors.red);
          }
          return Container(color: Colors.grey);
        },
      ),
    );
  }
}
