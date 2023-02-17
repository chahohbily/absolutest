import 'package:absolutest/screens/about_project_screen/about_project_screen.dart';
import 'package:absolutest/screens/builds_screen/builds_screen.dart';
import 'package:absolutest/screens/home_page_screen/home_page_screen.dart';
import 'package:absolutest/screens/login_screen/login_screen.dart';
import 'package:absolutest/screens/new_password_screen/new_password_screen.dart';
import 'package:absolutest/screens/project_page_screen/project_page_screen.dart';
import 'package:absolutest/screens/report_screen/report_screen.dart';
import 'package:absolutest/screens/restore_password_code_screen/restore_password_code_screen.dart';
import 'package:absolutest/screens/versions_screen/versions_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen,Provider',
  routes: <AutoRoute>[
    AutoRoute(page: LoginScreen, initial: true),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: NewPasswordScreen),
    AutoRoute(page: RestorePasswordCodeScreen),
    AutoRoute(page: ProjectPageScreen),
    AutoRoute(page: AboutProjectScreen),
    AutoRoute(page: BuildsScreen),
    AutoRoute(page: ReportScreen),
    AutoRoute(page: VersionsScreen),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter{}
