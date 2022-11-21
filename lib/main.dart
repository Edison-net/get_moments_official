import 'package:flutter/material.dart';
import 'package:get_moments/repository/cadastro_user_repo.dart';
import 'package:get_moments/repository/login_repo.dart';
import 'package:provider/provider.dart';

import 'src/pages/splash/splash.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DataClass()),
      ChangeNotifierProvider(create: (_) => DataLogin()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
