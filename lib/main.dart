import 'package:CIVVYS/Auth/options.dart';
import 'package:CIVVYS/Pages/Cart/cartProd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Pages/HomePage/homePage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final cartProducts cartprods = cartProducts();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CIVVYS',
        theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 218, 215, 215),
            scaffoldBackgroundColor: Colors.white),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MyHomePage(
                  cartproducts: cartprods,
                );
              } else {
                return options();
              }
            })
        // const MyHomePage(title: 'CIVVYS'),
        );
  }
}
