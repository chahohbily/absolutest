import 'dart:ui';

import 'package:absolutest/global_widgets/pj_button.dart';
import 'package:absolutest/global_widgets/pj_text_form_field.dart';
import 'package:absolutest/global_widgets/screen_layout.dart';
import 'package:absolutest/utils/pj_colors.dart';
import 'package:absolutest/utils/pj_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final double bottomButtonPadding = MediaQuery.of(context).size.height / 8;

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: bottomButtonPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Вход',
                      style: PjTextStyles.interRegular28.copyWith(
                        color: PjColors.purple,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          child: Column(
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
                                  onTap: () {},
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: bottomButtonPadding),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: PjButton(text: 'Войти', onTap: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
