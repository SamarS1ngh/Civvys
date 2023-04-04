// import 'package:flutter/cupertino.dart';
// import 'package:flutter/src/widgets/container.dart';
import 'package:CIVVYS/Auth/options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class drawerWidget extends StatelessWidget {
  const drawerWidget({super.key});
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
              const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  accountName: Text(
                    'Samar',
                    style: TextStyle(color: Colors.white),
                  ),
                  accountEmail: Text('accountEmail@gmail.com',
                      style: TextStyle(color: Colors.white))),
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
                    "Categories",
                  ),
                  leading: Icon(
                    Icons.dashboard,
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
                onTap: () {},
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
                onTap: () {},
                child: const ListTile(
                  title: Text(
                    "My WishList",
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
                  iconColor: Colors.black,
                ),
              ),
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => options()),
                      (route) => false);
                },
                child: const ListTile(
                  title: Text(
                    "LogOut",
                  ),
                  leading: Icon(
                    Icons.logout,
                  ),
                  iconColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
