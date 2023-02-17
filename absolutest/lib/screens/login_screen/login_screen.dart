import 'package:absolutest/global_functions/validator.dart';
import 'package:absolutest/global_widgets/login_screens_layout.dart';
import 'package:absolutest/global_widgets/logo_animation.dart';
import 'package:absolutest/global_widgets/pj_text_form_field.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:absolutest/global_widgets/pj_tooltip.dart';
import 'package:absolutest/utils/app_router.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'cubit/cb_login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbLoginScreen>(
      create: (context) => CbLoginScreen(),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final JustTheController _emailTooltipController = JustTheController();
  final JustTheController _passwordTooltipController = JustTheController();

  bool isButtonTapped = false;
  List<String> emailValidatesErrors = emailValidation('');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordTooltipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
      withWaves: true,
      body: BlocBuilder<CbLoginScreen, StLoginScreen>(
        builder: (context, state) => state.when(
          loading: () => const LogoAnimation(),
          error: (code, message) => const Placeholder(),
          loaded: () => LoginScreensLayout(
            screenTitle: 'Вход',
            buttonText: 'Войти',
            buttonOnTap: () {
              context.router.replaceAll([const HomeScreenRoute()]);
            },
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
                PjTextFormField.email(
                  controller: _emailController,
                  callback: (text) {
                    setState(() {
                      emailValidatesErrors = emailValidation(text);
                    });
                  },
                  isButtonTapped: isButtonTapped,
                ),
                const SizedBox(height: 5),
                PjTooltip(
                  tooltipController: _emailTooltipController,
                  isButtonTapped: isButtonTapped,
                  errorsList: emailValidatesErrors,
                ),
                const SizedBox(height: 1),
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
                PjTooltip(
                  tooltipController: _passwordTooltipController,
                  isButtonTapped: isButtonTapped,
                  errorsList: [],
                  maintainSize: false,
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      if (emailValidatesErrors.isEmpty) {
                        context.router.push(
                          RestorePasswordCodeScreenRoute(
                              email: _emailController.text),
                        );
                      } else {
                        setState(() {
                          isButtonTapped = true;
                        });
                        _emailTooltipController.showTooltip();
                      }
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
          ),
        ),
      ),
    );
  }
}
