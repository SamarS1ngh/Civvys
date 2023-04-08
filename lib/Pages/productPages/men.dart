import 'package:CIVVYS/Pages/HomePage/topPicks.dart';
import 'package:CIVVYS/Pages/Cart/cart.dart';
import 'package:flutter/material.dart';

class Men extends StatefulWidget {
  // const Men({super.key, required this.title});

  // final String title;

  @override
  State<Men> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Men> {
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: AppBar(
              primary: false,
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0.4,
              title: const Text("Men", style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.white,
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return cart();
                    }));
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                  splashColor: Colors.white,
                  splashRadius: 35,
                ),
              ],
            ),
          ),
          // drawer: const drawer(),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    autocorrect: true,
                    controller: _search,
                    enableSuggestions: true,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        //prefixIcon: Icon(Icons.search),
                        suffixIcon: Container(
                          color: Colors.white70,
                          child: IconButton(
                              splashRadius: 25,
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                              },
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                              )),
                        ),
                        hintText: 'Search...',
                        contentPadding: EdgeInsets.fromLTRB(20, 12, 12, 12),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        // borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                ),
              ),
              // const carousel(),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 45, 0, 0),
                child: Text('Find Your Style',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
              // const horizontal_List(),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 22, 0, 0),
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
                // height: 300,
                child: topPicks(),
              )
            ],
          )),
    );
  }
}
