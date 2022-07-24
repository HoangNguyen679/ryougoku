import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginInfoProvider =
    StateNotifierProvider<LoginInfoNotifier, LoginInfoModel>(
  (ref) => LoginInfoNotifier(),
);

class LoginInfoModel {
  final bool isLoggedIn;

  const LoginInfoModel(this.isLoggedIn);
}

class LoginInfoNotifier extends StateNotifier<LoginInfoModel> {
  static const _initialValue = LoginInfoModel(false);

  LoginInfoNotifier() : super(_initialValue);

  void setLoginInfo(bool value) {
    state = LoginInfoModel(value);
  }
}
