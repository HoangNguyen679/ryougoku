import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'model/auth0_login_info.dart';
import 'screen/home_screen.dart';
import 'screen/login_screen.dart';
import 'shared_state/auth0_login_info.dart';
// import 'shared_state/login_info.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);
  return GoRouter(
    routes: router._routes,
    refreshListenable: router,
    redirect: router._redirectLogic,
    urlPathStrategy: UrlPathStrategy.path,
    debugLogDiagnostics: true,
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    // _ref.listen<LoginInfoModel>(
    //   loginInfoProvider,
    //   (_, __) => notifyListeners(),
    // );
    _ref.listen<Auth0LoginInfoModel>(
      auth0LoginInfoProvider,
      (_, __) => notifyListeners(),
    );
  }

  String? _redirectLogic(GoRouterState state) {
    // final loginInfo = _ref.read(loginInfoProvider);

    // if (!loginInfo.isLoggedIn) {
    //   return state.location == '/login' ? null : '/login';
    // }

    // if (state.location == '/login') {
    //   return '/';
    // }

    final auth0LoginInfo = _ref.watch(auth0LoginInfoProvider);

    if (!auth0LoginInfo.isLoggedIn) {
      return state.location == '/login' ? null : '/login';
    }

    if (state.location == '/login') {
      return '/';
    }

    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          name: 'home',
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: 'login',
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
      ];
}
