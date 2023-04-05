import 'package:CIVVYS/Auth/signup.dart';
import 'package:CIVVYS/HomePage/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firebase.dart';
import 'login.dart';

class options extends StatefulWidget {
  const options({super.key});

  @override
  State<options> createState() => _optionsState();
}

class _optionsState extends State<options> {
  bool touched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/man woman onboarding 3.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [Colors.black54, Colors.black54])),
            ),
            Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 130),
                      child: Text(
                        'C I V V Y S',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 38),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                    ),
                    Container(
                      height: 48,
                      width: 312,
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side:
                                          const BorderSide(color: Colors.white),
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) => signUp())),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 48,
                      width: 312,
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.white),
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => login()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 48,
                      width: 312,
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.white),
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          onPressed: () async {
                            await Auth().signInWithGoogle(context).then(
                                (user) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage())));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "images/Google.png",
                                height: 38,
                                width: 38,
                              ),
                              const Text(
                                'Continue with Google',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
