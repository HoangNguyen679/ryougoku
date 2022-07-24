// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth0_login_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Auth0LoginInfoModel {
  bool get isBusy => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;
  Map<dynamic, dynamic>? get data => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $Auth0LoginInfoModelCopyWith<Auth0LoginInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Auth0LoginInfoModelCopyWith<$Res> {
  factory $Auth0LoginInfoModelCopyWith(
          Auth0LoginInfoModel value, $Res Function(Auth0LoginInfoModel) then) =
      _$Auth0LoginInfoModelCopyWithImpl<$Res>;
  $Res call(
      {bool isBusy,
      bool isLoggedIn,
      Map<dynamic, dynamic>? data,
      String? errorMessage});
}

/// @nodoc
class _$Auth0LoginInfoModelCopyWithImpl<$Res>
    implements $Auth0LoginInfoModelCopyWith<$Res> {
  _$Auth0LoginInfoModelCopyWithImpl(this._value, this._then);

  final Auth0LoginInfoModel _value;
  // ignore: unused_field
  final $Res Function(Auth0LoginInfoModel) _then;

  @override
  $Res call({
    Object? isBusy = freezed,
    Object? isLoggedIn = freezed,
    Object? data = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: isBusy == freezed
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_Auth0LoginInfoModelCopyWith<$Res>
    implements $Auth0LoginInfoModelCopyWith<$Res> {
  factory _$$_Auth0LoginInfoModelCopyWith(_$_Auth0LoginInfoModel value,
          $Res Function(_$_Auth0LoginInfoModel) then) =
      __$$_Auth0LoginInfoModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isBusy,
      bool isLoggedIn,
      Map<dynamic, dynamic>? data,
      String? errorMessage});
}

/// @nodoc
class __$$_Auth0LoginInfoModelCopyWithImpl<$Res>
    extends _$Auth0LoginInfoModelCopyWithImpl<$Res>
    implements _$$_Auth0LoginInfoModelCopyWith<$Res> {
  __$$_Auth0LoginInfoModelCopyWithImpl(_$_Auth0LoginInfoModel _value,
      $Res Function(_$_Auth0LoginInfoModel) _then)
      : super(_value, (v) => _then(v as _$_Auth0LoginInfoModel));

  @override
  _$_Auth0LoginInfoModel get _value => super._value as _$_Auth0LoginInfoModel;

  @override
  $Res call({
    Object? isBusy = freezed,
    Object? isLoggedIn = freezed,
    Object? data = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_Auth0LoginInfoModel(
      isBusy: isBusy == freezed
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Auth0LoginInfoModel
    with DiagnosticableTreeMixin
    implements _Auth0LoginInfoModel {
  const _$_Auth0LoginInfoModel(
      {this.isBusy = false,
      this.isLoggedIn = false,
      final Map<dynamic, dynamic>? data,
      this.errorMessage})
      : _data = data;

  @override
  @JsonKey()
  final bool isBusy;
  @override
  @JsonKey()
  final bool isLoggedIn;
  final Map<dynamic, dynamic>? _data;
  @override
  Map<dynamic, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0LoginInfoModel(isBusy: $isBusy, isLoggedIn: $isLoggedIn, data: $data, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Auth0LoginInfoModel'))
      ..add(DiagnosticsProperty('isBusy', isBusy))
      ..add(DiagnosticsProperty('isLoggedIn', isLoggedIn))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Auth0LoginInfoModel &&
            const DeepCollectionEquality().equals(other.isBusy, isBusy) &&
            const DeepCollectionEquality()
                .equals(other.isLoggedIn, isLoggedIn) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isBusy),
      const DeepCollectionEquality().hash(isLoggedIn),
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_Auth0LoginInfoModelCopyWith<_$_Auth0LoginInfoModel> get copyWith =>
      __$$_Auth0LoginInfoModelCopyWithImpl<_$_Auth0LoginInfoModel>(
          this, _$identity);
}

abstract class _Auth0LoginInfoModel implements Auth0LoginInfoModel {
  const factory _Auth0LoginInfoModel(
      {final bool isBusy,
      final bool isLoggedIn,
      final Map<dynamic, dynamic>? data,
      final String? errorMessage}) = _$_Auth0LoginInfoModel;

  @override
  bool get isBusy;
  @override
  bool get isLoggedIn;
  @override
  Map<dynamic, dynamic>? get data;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_Auth0LoginInfoModelCopyWith<_$_Auth0LoginInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
