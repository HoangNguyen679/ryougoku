// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_id_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth0IdToken _$Auth0IdTokenFromJson(Map<String, dynamic> json) => Auth0IdToken(
      nickname: json['nickname'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      picture: json['picture'] as String,
      updatedAt: json['updated_at'] as String,
      iss: json['iss'] as String,
      sub: json['sub'] as String,
      aud: json['aud'] as String,
      iat: json['iat'] as int,
      exp: json['exp'] as int,
      authTime: json['auth_time'] as int?,
    );

Map<String, dynamic> _$Auth0IdTokenToJson(Auth0IdToken instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'name': instance.name,
      'picture': instance.picture,
      'updated_at': instance.updatedAt,
      'iss': instance.iss,
      'sub': instance.sub,
      'aud': instance.aud,
      'email': instance.email,
      'iat': instance.iat,
      'exp': instance.exp,
      'auth_time': instance.authTime,
    };
