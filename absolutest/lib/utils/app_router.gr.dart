// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const LoginScreen()),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const HomeScreen()),
      );
    },
    NewPasswordScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const NewPasswordScreen()),
      );
    },
    RestorePasswordCodeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<RestorePasswordCodeScreenRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: RestorePasswordCodeScreen(
          key: args.key,
          email: args.email,
        )),
      );
    },
    ProjectPageScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ProjectPageScreen()),
      );
    },
    AboutProjectScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AboutProjectScreen()),
      );
    },
    BuildsScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const BuildsScreen()),
      );
    },
    ReportScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ReportScreen()),
      );
    },
    VersionsScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const VersionsScreen()),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          LoginScreenRoute.name,
          path: '/',
        ),
        RouteConfig(
          HomeScreenRoute.name,
          path: '/home-screen',
        ),
        RouteConfig(
          NewPasswordScreenRoute.name,
          path: '/new-password-screen',
        ),
        RouteConfig(
          RestorePasswordCodeScreenRoute.name,
          path: '/restore-password-code-screen',
        ),
        RouteConfig(
          ProjectPageScreenRoute.name,
          path: '/project-page-screen',
        ),
        RouteConfig(
          AboutProjectScreenRoute.name,
          path: '/about-project-screen',
        ),
        RouteConfig(
          BuildsScreenRoute.name,
          path: '/builds-screen',
        ),
        RouteConfig(
          ReportScreenRoute.name,
          path: '/report-screen',
        ),
        RouteConfig(
          VersionsScreenRoute.name,
          path: '/versions-screen',
        ),
      ];
}

/// generated route for
/// [LoginScreen]
class LoginScreenRoute extends PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/home-screen',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [NewPasswordScreen]
class NewPasswordScreenRoute extends PageRouteInfo<void> {
  const NewPasswordScreenRoute()
      : super(
          NewPasswordScreenRoute.name,
          path: '/new-password-screen',
        );

  static const String name = 'NewPasswordScreenRoute';
}

/// generated route for
/// [RestorePasswordCodeScreen]
class RestorePasswordCodeScreenRoute
    extends PageRouteInfo<RestorePasswordCodeScreenRouteArgs> {
  RestorePasswordCodeScreenRoute({
    Key? key,
    required String email,
  }) : super(
          RestorePasswordCodeScreenRoute.name,
          path: '/restore-password-code-screen',
          args: RestorePasswordCodeScreenRouteArgs(
            key: key,
            email: email,
          ),
        );

  static const String name = 'RestorePasswordCodeScreenRoute';
}

class RestorePasswordCodeScreenRouteArgs {
  const RestorePasswordCodeScreenRouteArgs({
    this.key,
    required this.email,
  });

  final Key? key;

  final String email;

  @override
  String toString() {
    return 'RestorePasswordCodeScreenRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [ProjectPageScreen]
class ProjectPageScreenRoute extends PageRouteInfo<void> {
  const ProjectPageScreenRoute()
      : super(
          ProjectPageScreenRoute.name,
          path: '/project-page-screen',
        );

  static const String name = 'ProjectPageScreenRoute';
}

/// generated route for
/// [AboutProjectScreen]
class AboutProjectScreenRoute extends PageRouteInfo<void> {
  const AboutProjectScreenRoute()
      : super(
          AboutProjectScreenRoute.name,
          path: '/about-project-screen',
        );

  static const String name = 'AboutProjectScreenRoute';
}

/// generated route for
/// [BuildsScreen]
class BuildsScreenRoute extends PageRouteInfo<void> {
  const BuildsScreenRoute()
      : super(
          BuildsScreenRoute.name,
          path: '/builds-screen',
        );

  static const String name = 'BuildsScreenRoute';
}

/// generated route for
/// [ReportScreen]
class ReportScreenRoute extends PageRouteInfo<void> {
  const ReportScreenRoute()
      : super(
          ReportScreenRoute.name,
          path: '/report-screen',
        );

  static const String name = 'ReportScreenRoute';
}

/// generated route for
/// [VersionsScreen]
class VersionsScreenRoute extends PageRouteInfo<void> {
  const VersionsScreenRoute()
      : super(
          VersionsScreenRoute.name,
          path: '/versions-screen',
        );

  static const String name = 'VersionsScreenRoute';
}
