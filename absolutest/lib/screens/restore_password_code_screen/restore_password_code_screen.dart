import 'package:absolutest/global_widgets/login_screens_layout.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:absolutest/global_widgets/pj_text_form_field.dart';
import 'package:absolutest/screens/new_password_screen/new_password_screen_provider.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/global_functions/pj_navigator.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cubit/cb_restore_password_code_screen.dart';
import 'cubit/st_restore_password_code_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestorePasswordCodeScreen extends StatelessWidget {
  final String email;

  RestorePasswordCodeScreen({Key? key, required this.email}) : super(key: key);

  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
      withWaves: true,
      body:
          BlocBuilder<CbRestorePasswordCodeScreen, StRestorePasswordCodeScreen>(
        builder: (context, state) {
          if (state is StRestorePasswordCodeScreenLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is StRestorePasswordCodeScreenLoaded) {
            return LoginScreensLayout(
              screenTitle: 'Восстановление пароля',
              buttonText: 'Отправить',
              buttonOnTap: () {
                pjNavigator(context: context, nextScreenProvider: const NewPasswordScreenProvider());
              },
              centerContainerContent: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Мы отправили сообщение с кодом на почту ',
                      style: PjTextStyles.abelRegular16.copyWith(
                        color: PjColors.gray2.withOpacity(0.85),
                      ),
                      children: [
                        TextSpan(
                          text: email,
                          style: PjTextStyles.abelRegular16,
                        ),
                      ],
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Введите код:',
                    style: PjTextStyles.abelRegular16.copyWith(
                      color: PjColors.gray2.withOpacity(0.85),
                    ),
                  ),
                  const SizedBox(height: 6),
                  IntrinsicWidth(
                    child: PjTextFormField.pinCode(
                      controller: _pinController,
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is StRestorePasswordCodeScreenError) {
            return Container(color: Colors.red);
          }
          return Container(color: Colors.grey);
        },
      ),
    );
  }
}
