// ignore_for_file: camel_case_types
import 'package:CIVVYS/Auth/firebase.dart';
import 'package:CIVVYS/Pages/HomePage/homePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final formkey = GlobalKey<FormState>();
  bool show = true;
  bool isloggedin = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pswd = TextEditingController();
  final TextEditingController _name = TextEditingController();

  handleSubmit() {
    if (formkey.currentState!.validate()) {
      setState(() {
        isloggedin = !isloggedin;
      });
      Auth().registerWithEmailAndPassword(
          name: _name.text, email: _email.text, password: _pswd.text);

      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
      } else {
        setState(() {
          isloggedin = !isloggedin;
        });
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Okay',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
                title: const Text('Already Registered'),
                content: const Text(
                    'This Email is already registered with us. Try signing in'),
              );
            });
      }
      //  });
      // await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      // showDialog(
      //     context: context,
      //     builder: (cntxt) {
      //       return AlertDialog(
      //         actions: <Widget>[
      //           TextButton(
      //               onPressed: () {
      //                 Navigator.of(context).pop();
      //               },
      //               child: const Text('Okay'))
      //         ],
      //         title: const Text('Email Verification'),
      //         content: const Text(
      //             'We have sent a verification link to your Email. Please verify your Email to continue further.'),
      //       );
      //});
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _pswd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'images/signup.png',
                  ),
                  fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black38, Colors.black38])),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Container(
                      child: Center(
                          child: Column(
                        children: <Widget>[
                          const Text(
                            'C I V V Y S',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 38,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          const Text(
                            'Sign up for free!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Form(
                              key: formkey,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    //color: Colors.white,
                                    height: 46,
                                    width: 300,
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This Field can\'t be empty';
                                          }
                                          return null;
                                        },
                                        controller: _name,
                                        // keyboardType: TextInputType.emailAddress,
                                        cursorColor: Colors.black,
                                        cursorWidth: 1,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        decoration: InputDecoration(
                                            prefixIcon:
                                                const Icon(Icons.person),
                                            contentPadding:
                                                const EdgeInsets.all(12),
                                            isDense: true,
                                            hintText: 'Your Name',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    //color: Colors.white,
                                    height: 46,
                                    width: 300,
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This Field can\'t be empty';
                                          }
                                          return null;
                                        },
                                        controller: _email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        cursorColor: Colors.black,
                                        cursorWidth: 1,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        decoration: InputDecoration(
                                            prefixIcon: const Icon(Icons.email),
                                            contentPadding:
                                                const EdgeInsets.all(12),
                                            isDense: true,
                                            hintText: 'Email',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 46,
                                    width: 300,
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value == null ||
                                              value.length < 8) {
                                            return 'Password should be 8 characters long';
                                          }
                                          return null;
                                        },
                                        obscureText: show ? true : false,
                                        controller: _pswd,
                                        cursorColor: Colors.black,
                                        cursorWidth: 1,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        decoration: InputDecoration(
                                            prefixIcon: const Icon(Icons.lock),
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    show = !show;
                                                  });
                                                },
                                                icon: show
                                                    ? const Icon(
                                                        Icons.visibility)
                                                    : const Icon(
                                                        Icons.visibility_off)),
                                            contentPadding:
                                                const EdgeInsets.all(12),
                                            isDense: true,
                                            hintText: 'Password',
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.white)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Container(
                                    height: 48,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.yellow[50],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: isloggedin
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.black,
                                            ),
                                          )
                                        : TextButton(
                                            onPressed: () async {
                                              handleSubmit();
                                            },
                                            child: const Text(
                                              'Create Account',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            )),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 280,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const login()));
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                          style: DefaultTextStyle.of(context)
                                              .style,
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: 'Already an user?',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            TextSpan(
                                                text: ' Login',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ]),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 250,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  color: Colors.white,
                                  height: 1,
                                  width: 100,
                                ),
                                const Text(
                                  ' or ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  color: Colors.white,
                                  height: 1,
                                  width: 100,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 48,
                            width: 312,
                            child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(25)))),
                                onPressed: () async {
                                  await Auth().signInWithGoogle(context).then(
                                      (user) => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyHomePage())));
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
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
