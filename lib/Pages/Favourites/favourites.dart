import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'favitems.dart';

class favs extends StatelessWidget {
  const favs({super.key});

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
            title: const Text("My Favourites",
                style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
          ),
        ),
        body: favItems.favs.isEmpty
            ? const Center(
                child: Text("Nothing to show here"),
              )
            : favItems(),
      ),
    );
  }
}
