import 'package:absolutest/global_widgets/login_screens_layout.dart';
import 'package:absolutest/global_widgets/logo_animation.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:absolutest/global_widgets/pj_text_form_field.dart';
import 'package:absolutest/utils/app_router.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'cubit/cb_restore_password_code_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestorePasswordCodeScreen extends StatelessWidget implements AutoRouteWrapper{
  final String email;

  RestorePasswordCodeScreen({Key? key, required this.email}) : super(key: key);

  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
      withWaves: true,
      body:
          BlocBuilder<CbRestorePasswordCodeScreen, StRestorePasswordCodeScreen>(
        builder: (context, state) => state.when(
          loading: () => const LogoAnimation(),
          error: (code, message) => const Placeholder(),
          loaded: () => LoginScreensLayout(
            screenTitle: 'Восстановление пароля',
            buttonText: 'Отправить',
            buttonOnTap: () {
              context.router.push(const NewPasswordScreenRoute());
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
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbRestorePasswordCodeScreen>(
      create: (context) => CbRestorePasswordCodeScreen(),
      child: this,
    );
  }
}
