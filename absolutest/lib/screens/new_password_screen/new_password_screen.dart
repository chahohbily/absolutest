import 'package:absolutest/global_functions/validator.dart';
import 'package:absolutest/global_widgets/login_screens_layout.dart';
import 'package:absolutest/global_widgets/logo_animation.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:absolutest/global_widgets/pj_text_form_field.dart';
import 'package:absolutest/global_widgets/pj_tooltip.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'cubit/cb_new_password_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordScreen extends StatefulWidget implements AutoRouteWrapper{
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbNewPasswordScreen>(
      create: (context) => CbNewPasswordScreen(),
      child: this,
    );
  }
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPasswordRepeatController =
      TextEditingController();
  final passwordTooltipController = JustTheController();
  final passwordRepeatTooltipController = JustTheController();

  bool isButtonTapped = false;
  List<String> passwordValidatesErrors = passwordValidation('');
  List<String> passwordRepeatValidatesErrors = [];

  @override
  void dispose() {
    passwordTooltipController.dispose();
    passwordRepeatTooltipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
      withWaves: true,
      body: BlocBuilder<CbNewPasswordScreen, StNewPasswordScreen>(
        builder: (context, state) => state.when(
          loading: () => const LogoAnimation(),
          error: (code, message) => const Placeholder(),
          loaded: () => LoginScreensLayout(
            screenTitle: 'Восстановление пароля',
            buttonText: 'Восстановить',
            buttonOnTap: () {
              setState(() {
                isButtonTapped = true;
              });
              passwordTooltipController.showTooltip();
              passwordRepeatTooltipController.showTooltip();
            },
            centerContainerContent: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Введите новый пароль',
                  style: PjTextStyles.abelRegular16
                      .copyWith(color: PjColors.gray),
                ),
                const SizedBox(height: 10),
                PjTextFormField.password(
                  controller: _newPasswordController,
                  callback: (text) {
                    setState(() {
                      passwordValidatesErrors = passwordValidation(text);
                    });
                  },
                  isButtonTapped: isButtonTapped,
                ),
                const SizedBox(height: 5),
                PjTooltip(
                  tooltipController: passwordTooltipController,
                  isButtonTapped: isButtonTapped,
                  errorsList: passwordValidatesErrors,
                ),
                const SizedBox(height: 1),
                Text(
                  'Повторите пароль',
                  style: PjTextStyles.abelRegular16
                      .copyWith(color: PjColors.gray),
                ),
                const SizedBox(height: 10),
                PjTextFormField.password(
                  controller: _newPasswordRepeatController,
                  callback: (text) {
                    setState(() {
                      passwordRepeatValidatesErrors =
                          passwordRepeatValidation(
                              _newPasswordController.text, text);
                    });
                  },
                  isButtonTapped: isButtonTapped,
                ),
                const SizedBox(height: 5),
                PjTooltip(
                  tooltipController: passwordRepeatTooltipController,
                  isButtonTapped: isButtonTapped,
                  errorsList: passwordRepeatValidatesErrors,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
