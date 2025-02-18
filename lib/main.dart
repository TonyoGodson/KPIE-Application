import 'package:flutter/material.dart';
import 'package:kpie_app/controllers/create_account_controller.dart';
import 'package:kpie_app/controllers/login_controller.dart';
import 'package:kpie_app/core/routers/router.dart';
import 'package:kpie_app/views/login_screen.dart';
import 'package:kpie_app/views/sign_up_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CreateAccountController()),
      ChangeNotifierProvider(create: (context) => LoginController()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KPIE App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SignUpScreen(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}

