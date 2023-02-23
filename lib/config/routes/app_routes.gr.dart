// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/foundation.dart' as _i7;
import 'package:flutter/material.dart' as _i6;

import '../../module/login/presentation/screen/login_screen.dart' as _i2;
import '../../module/otp%20verification/presentation/otp_verify_screen.dart'
    as _i3;
import '../../module/profile/presentation/screen/user_profile_screen.dart'
    as _i4;
import '../../module/splash/presentation/splash_screen.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    OtpScreen.name: (routeData) {
      final args = routeData.argsAs<OtpScreenArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.OtpScreen(
          key: args.key,
          verificationId: args.verificationId,
        ),
      );
    },
    UserProfileScreen.name: (routeData) {
      final args = routeData.argsAs<UserProfileScreenArgs>(
          orElse: () => const UserProfileScreenArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.UserProfileScreen(key: args.key),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i5.RouteConfig(
          LoginScreen.name,
          path: '/login-screen',
        ),
        _i5.RouteConfig(
          OtpScreen.name,
          path: '/otp-screen',
        ),
        _i5.RouteConfig(
          UserProfileScreen.name,
          path: '/user-profile-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i5.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i5.PageRouteInfo<void> {
  const LoginScreen()
      : super(
          LoginScreen.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i3.OtpScreen]
class OtpScreen extends _i5.PageRouteInfo<OtpScreenArgs> {
  OtpScreen({
    _i7.Key? key,
    required String verificationId,
  }) : super(
          OtpScreen.name,
          path: '/otp-screen',
          args: OtpScreenArgs(
            key: key,
            verificationId: verificationId,
          ),
        );

  static const String name = 'OtpScreen';
}

class OtpScreenArgs {
  const OtpScreenArgs({
    this.key,
    required this.verificationId,
  });

  final _i7.Key? key;

  final String verificationId;

  @override
  String toString() {
    return 'OtpScreenArgs{key: $key, verificationId: $verificationId}';
  }
}

/// generated route for
/// [_i4.UserProfileScreen]
class UserProfileScreen extends _i5.PageRouteInfo<UserProfileScreenArgs> {
  UserProfileScreen({_i7.Key? key})
      : super(
          UserProfileScreen.name,
          path: '/user-profile-screen',
          args: UserProfileScreenArgs(key: key),
        );

  static const String name = 'UserProfileScreen';
}

class UserProfileScreenArgs {
  const UserProfileScreenArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'UserProfileScreenArgs{key: $key}';
  }
}
