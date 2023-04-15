import 'package:CIVVYS/Pages/Cart/cartProd.dart';
import 'package:CIVVYS/Pages/HomePage/carousel.dart';
import 'package:CIVVYS/Pages/HomePage/search.dart';
import 'package:CIVVYS/Pages/HomePage/topPicks.dart';
import 'package:CIVVYS/Pages/Cart/cart.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'Categories.dart';
import 'package:badges/badges.dart' as badges;

class MyHomePage extends StatefulWidget {
  final cartProducts cartproducts;
  const MyHomePage({super.key, required this.cartproducts});

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final TextEditingController _search = TextEditingController();
  // int cartlength = cartProducts.cartItems.length;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _updateCartItems();
  }

  // void _updateCartItems() {
  //   setState(() {
  //     cartlength = cartProducts.cartItems.length;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: AppBar(
                primary: false,
                iconTheme: const IconThemeData(color: Colors.black),
                elevation: 0.2,
                title: const Text("C I V V Y S",
                    style: TextStyle(color: Colors.black)),
                backgroundColor: Colors.white,
                actions: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const searchpage();
                        }));
                      });
                    },
                    icon: const Icon(Icons.search),
                    splashRadius: 35,
                  ),
                  iconbadge()
                ],
              ),
            ),
            drawer: const drawer(),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                //   child: Container(
                //     width: 150,
                //     height: 40,
                //     decoration: BoxDecoration(
                //         color: Colors.grey[100],
                //         borderRadius: BorderRadius.circular(15)),
                //     child: TextFormField(
                //       //   onChanged: ,
                //       onTap: () {},
                //       style: const TextStyle(fontSize: 14),
                //       autocorrect: true,
                //       controller: _search,
                //       enableSuggestions: true,
                //       cursorColor: Colors.black,
                //       decoration: InputDecoration(
                //           //prefixIcon: Icon(Icons.search),
                //           suffixIcon: Container(
                //             color: Colors.white70,
                //             child: IconButton(
                //                 splashRadius: 25,
                //                 onPressed: () {
                //                   FocusScope.of(context).unfocus();
                //                 },
                //                 icon: const Icon(
                //                   Icons.search,
                //                   color: Colors.black,
                //                 )),
                //           ),
                //           hintText: 'Search...',
                //           contentPadding:
                //               const EdgeInsets.fromLTRB(20, 12, 12, 12),
                //           isDense: true,
                //           enabledBorder: const OutlineInputBorder(
                //               borderSide:
                //                   BorderSide(color: Colors.transparent)),
                //           // borderRadius: BorderRadius.circular(15)),
                //           focusedBorder: const OutlineInputBorder(
                //               borderSide:
                //                   BorderSide(color: Colors.transparent))),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 15,
                ),
                const carousel(),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 45, 0, 0),
                  child: Text('Find Your Style',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                ),
                horizontal_List(),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 22, 0, 15),
                  child: Text(
                    'Top Picks',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                //grid view
                Container(
                    height: MediaQuery.of(context).size.height * 2,
                    child: topPicks())
              ],
            )),
      ),
    );
  }
}

class iconbadge extends StatefulWidget {
  const iconbadge({super.key});

  @override
  State<iconbadge> createState() => _iconbadgeState();
}

class _iconbadgeState extends State<iconbadge> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: cartProducts().cartlength,
        builder: (context, cartcount, _) {
          return badges.Badge(
            position: badges.BadgePosition.topEnd(end: 0.5, top: -1.3),
            showBadge: cartProducts.cartItems.isNotEmpty,
            badgeContent: Text(
              cartProducts.cartItems.length.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const cart();
                }));
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
              splashRadius: 35,
            ),
          );
        });
  }
}
