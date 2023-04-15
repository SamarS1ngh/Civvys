import 'package:CIVVYS/Auth/signup.dart';
import 'package:CIVVYS/Pages/HomePage/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Pages/Cart/cartProd.dart';
import 'firebase.dart';

class login extends StatefulWidget {
  final cartProducts cartprods = cartProducts();
  login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool show = true;
  bool isloggedin = false;
  final formkey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController pswd = TextEditingController();

  handleReset() async {
    await pswdReset().resetPassword(email.text);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Okay'))
            ],
            title: Text('Password Reset'),
            content: Text(
                'A password reset link has been sent to your provided Email address. Visit that link to reset your password and try again.'),
          );
        });
  }

  handleSubmit() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        isloggedin = !isloggedin;
      });
      User? user = await Auth()
          .signInWithEmailAndPassword(email: email.text, password: pswd.text);

      if (user != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MyHomePage(
                  cartproducts: widget.cartprods,
                )));
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
                title: Text('Invalid Credentials'),
                content: Text(
                    'This Email or password is not registered with us. Try correcting it or Create Account'),
              );
            });
      }
      // else{
      //   return showDialog(context: context, builder: (BuildContext){
      //     return AlertDialog(
      //       actions: <Widget>[
      //         TextButton(onPressed: (){
      //           Navigator.of(context).pop();
      //         }, child: Text('Okay'))
      //       ],
      //       title: Text('Invalid Credentials'),
      //       content: Text('This password or Email is not registered with us. please try again or create account.'),
      //     );
      //   });
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/login.png'), fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black12, Colors.black12])),
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
                            'Login and Explore!',
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
                                            return 'This Field Can\'t be empty!';
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
                                    height: 24,
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
                                    height: 5,
                                  ),
                                  Container(
                                    width: 280,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            handleReset();
                                          },
                                          child: const Text(
                                            'Reset Password?',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  InkWell(
                                    onTap: handleSubmit,
                                    child: Container(
                                      alignment: Alignment.center,
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
                                            ))
                                          : const Text(
                                              'Login',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                    ),
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
                                                  signUp()));
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                          style: DefaultTextStyle.of(context)
                                              .style,
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: 'Don\'t have an account?',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            TextSpan(
                                                text: ' SignUp',
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
                                  await Auth()
                                      .signInWithGoogle(context)
                                      .then((user) => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyHomePage(
                                                    cartproducts:
                                                        widget.cartprods,
                                                  ))));
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
