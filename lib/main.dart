import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomePage/homePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CIVVYS',
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 218, 215, 215),
          scaffoldBackgroundColor: Colors.white),
      home: const MyHomePage(title: 'CIVVYS'),
    );
  }
}
