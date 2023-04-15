// import 'package:flutter/cupertino.dart';
// import 'package:flutter/src/widgets/container.dart';

import 'package:CIVVYS/Auth/firebase.dart';
import 'package:CIVVYS/Auth/options.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:CIVVYS/Pages/Cart/cart.dart';

import '../Favourites/favourites.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool loading = true;
  String name = '';
  String email = '';
  void getData() async {
    Map data = (await DatabaseService()
        .getUser(FirebaseAuth.instance.currentUser?.uid));
    if (data.isNotEmpty) {
      setState(() {
        loading = false;
        name = data['Name'];
        email = data['Email'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  accountName: loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          "$name",
                          style: const TextStyle(color: Colors.white),
                        ),
                  accountEmail: Text('$email',
                      style: const TextStyle(color: Colors.white))),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text(
                    "Profile",
                  ),
                  leading: Icon(
                    Icons.person,
                  ),
                  iconColor: Colors.black,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text(
                    "My Orders",
                  ),
                  leading: Icon(
                    Icons.shopping_bag,
                  ),
                  iconColor: Colors.black,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return cart();
                  }));
                },
                child: const ListTile(
                  title: Text(
                    "My Cart",
                  ),
                  leading: Icon(
                    Icons.shopping_cart,
                  ),
                  iconColor: Colors.black,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return favs();
                  }));
                },
                child: const ListTile(
                  title: Text(
                    "Favorites",
                  ),
                  leading: Icon(
                    Icons.favorite,
                  ),
                  iconColor: Colors.black,
                ),
              ),
              const Divider(
                height: 50,
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text(
                    "About",
                  ),
                  leading: Icon(
                    Icons.help,
                  ),
                  iconColor: Colors.black54,
                ),
              ),
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  await GoogleSignIn().signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => options()),
                      (route) => false);
                },
                child: const ListTile(
                  title: Text(
                    "LogOut",
                    style: TextStyle(color: Colors.red),
                  ),
                  leading: Icon(
                    Icons.logout,
                  ),
                  iconColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
