import 'dart:ui';

import 'package:CIVVYS/HomePage/carousel.dart';
import 'package:CIVVYS/HomePage/topPicks.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'Categories.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({super.key, required this.title});

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: AppBar(
              primary: false,
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              title: Text("C I V V Y S", style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.white,
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  splashColor: Colors.white,
                  splashRadius: 35,
                ),
              ],
            ),
          ),
          drawer: drawer(),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              carousel(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 45, 0, 0),
                child: Text('Find Your Style',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
              horizontal_List(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 22, 0, 0),
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
