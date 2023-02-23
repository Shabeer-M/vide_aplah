import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:videalpha/constants/app_color.dart';
import 'package:videalpha/constants/app_contants.dart';
import 'package:videalpha/module/login/presentation/screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext(context);
  }

  Future<void> _navigateToNext(context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(splashScreenImage),
              ),
            ),
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.8),
                child: GradientText(
                  appName,
                  style: GoogleFonts.sacramento(
                    fontSize: 60,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                  colors: [
                    appRed,
                    bluishGrey,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
