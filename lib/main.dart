import 'package:flutter/material.dart';
import 'package:udemy1/src/app/consts.dart';
import 'package:udemy1/src/ui/views/log_in/log_in_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: pink,
      ),
      home: LogInView(),
    );
  }
}
