// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_portifolio/views/home_page.dart';

class SmoothScrollBehavior extends ScrollBehavior {
  

  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child; // Remove o comportamento de rolagem padrão do navegador
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics(); // Suaviza a rolagem
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portifolio',
      debugShowCheckedModeBanner: false,
      scrollBehavior: SmoothScrollBehavior(),
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}