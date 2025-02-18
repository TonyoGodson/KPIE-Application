import 'package:flutter/material.dart';

import '../core/utils/helper.dart';

class NotFountScreen extends StatefulWidget {
  static const String routeName = "not_found_screen";
  const NotFountScreen({super.key});

  @override
  State<NotFountScreen> createState() => _NotFountScreenState();
}

class _NotFountScreenState extends State<NotFountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Does not exist.",
          style: specialText(
            context: context,
            fs: 20,
            fw: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
