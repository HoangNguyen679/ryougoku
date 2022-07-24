import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../helper/auth0.dart';
import '../model/auth0_login_info.dart';
import '../model/constant.dart';

final auth0LoginInfoProvider =
    StateNotifierProvider<Auth0LoginInfoNotifier, Auth0LoginInfoModel>(
  (ref) => Auth0LoginInfoNotifier(),
);

class Auth0LoginInfoNotifier extends StateNotifier<Auth0LoginInfoModel> {
  Auth0LoginInfoNotifier() : super(_initialValue);

  static const _initialValue = Auth0LoginInfoModel();

  final secureStorage = const FlutterSecureStorage();

  final auth0Helper = Auth0Helper();

  Future<void> initAction() async {
    state = state.copyWith(isBusy: true);
    try {
      final storedRefreshToken =
          await secureStorage.read(key: REFRESH_TOKEN_KEY);

      if (storedRefreshToken == null) {
        state = state.copyWith(isBusy: false);
        return;
      }

      final data = await auth0Helper.initAction(storedRefreshToken);

      state = state.copyWith(isBusy: false, isLoggedIn: true, data: data);
    } on Exception catch (e, s) {
      debugPrint('login error: $e - stack: $s');
      logout();
    }
  }

  Future<void> login() async {
    state = state.copyWith(isBusy: true);
    try {
      final data = await auth0Helper.login();
      state = state.copyWith(isBusy: false, isLoggedIn: true, data: data);
    } on Exception catch (e, s) {
      debugPrint('login error: $e - stack: $s');
      state = state.copyWith(
        isBusy: false,
        isLoggedIn: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isBusy: true);
    await secureStorage.delete(key: REFRESH_TOKEN_KEY);
    state = state.copyWith(isBusy: false, isLoggedIn: false);
  }
}
