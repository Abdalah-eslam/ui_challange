import 'package:flutter/material.dart';
import 'package:ui_challange/fistUI/fruit.dart';
import 'package:ui_challange/fistUI/fruit_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const Fruit(),
      routes: {'/fruit_details': (context) => const FruitDetails()},
    );
  }
}
