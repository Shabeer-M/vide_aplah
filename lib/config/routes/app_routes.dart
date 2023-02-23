import 'package:auto_route/annotations.dart';
import 'package:videalpha/module/login/presentation/screen/login_screen.dart';
import 'package:videalpha/module/otp%20verification/presentation/otp_verify_screen.dart';
import 'package:videalpha/module/profile/presentation/screen/user_profile_screen.dart';
import 'package:videalpha/module/splash/presentation/splash_screen.dart';

@MaterialAutoRouter(
    routes: [AutoRoute(page: SplashScreen, initial: true), AutoRoute(page: LoginScreen), AutoRoute(page: OtpScreen), AutoRoute(page: UserProfileScreen)], replaceInRouteName: "Page,Route")
class $AppRouter {}
