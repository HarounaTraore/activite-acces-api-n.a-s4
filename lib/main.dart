import 'package:flutter/material.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Application Météo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeView(),
    );
  }
}
