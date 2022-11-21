import 'package:flutter/material.dart';
import 'package:get_moments/src/components/backgroudcolor.dart';
import 'package:get_moments/src/components/logo_get_moments.dart';

import '../login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Backgroundcolor(
        child: LogoGetMoments(),
      ),
    );
  }
}
