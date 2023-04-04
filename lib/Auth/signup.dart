// ignore_for_file: camel_case_types
import 'package:CIVVYS/Auth/firebase.dart';
import 'package:CIVVYS/HomePage/homePage.dart';
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
  final TextEditingController email = TextEditingController();
  final TextEditingController pswd = TextEditingController();
  final TextEditingController name = TextEditingController();

  handleSubmit() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        isloggedin = !isloggedin;
      });
      User? user = await Auth()
          .registerWithEmailAndPassword(email: email.text, password: pswd.text);

      if (user != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
      } else {
        setState(() {
          isloggedin = !isloggedin;
        });
        return showDialog(
            context: context,
            builder: (BuildContext) {
              return AlertDialog(
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Okay',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
                title: Text('Already Registered'),
                content: Text(
                    'This Email is already registered with us. Try signing in'),
              );
            });
      }
    }
  }

  @override
  void dispose() {
    email.dispose();
    pswd.dispose();
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
                          SizedBox(
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
                                        controller: name,
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
                                  SizedBox(
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
                                        controller: email,
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
                                        controller: pswd,
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
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.black,
                                            ),
                                          )
                                        : TextButton(
                                            onPressed: handleSubmit,
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
                                                  login()));
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
                          SizedBox(
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
                                            side:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(25)))),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      "images/Google.png",
                                      height: 38,
                                      width: 38,
                                    ),
                                    const Text(
                                      'Signup with Google',
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
