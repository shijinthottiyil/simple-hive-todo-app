import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './view/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.yellow[200],
      ),
      home: const HomeScreen(),
    );
  }
}
