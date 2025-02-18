import 'package:flutter/material.dart';
import 'package:kpie_app/core/routers/router.dart';
import 'package:kpie_app/views/login_screen.dart';
import 'package:kpie_app/views/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KPIE App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignUpScreen(),
      onGenerateRoute: generateRoute,
    );
  }
}

