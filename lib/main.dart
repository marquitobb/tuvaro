import 'package:flutter/material.dart';
import 'package:tuvaro/pages/principal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tuVaro',
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}
