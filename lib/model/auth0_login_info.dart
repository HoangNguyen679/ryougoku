import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auth0_login_info.freezed.dart';

@freezed
class Auth0LoginInfoModel with _$Auth0LoginInfoModel {
  // ignore: todo
  //  TODO: find out about how factory work
  const factory Auth0LoginInfoModel({
    @Default(false) bool isBusy,
    @Default(false) bool isLoggedIn,
    Map? data,
    String? errorMessage,
  }) = _Auth0LoginInfoModel;
}
