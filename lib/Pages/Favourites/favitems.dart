import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../productPages/productpage.dart';

class favItems extends StatefulWidget {
  static List<Map<String, dynamic>> favs = [];

  @override
  State<favItems> createState() => _favItemsState();
}

class _favItemsState extends State<favItems> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: favItems.favs.length,
        itemBuilder: (BuildContext context, index) {
          var name = favItems.favs[index]['item']['name'];
          var pic = favItems.favs[index]['item']['pic'];
          var price = favItems.favs[index]['item']['price'];
          bool added = favItems.favs[index]['item']['added'];
          bool liked = favItems.favs[index]['item']['liked'];
          return items(
              Itemname: name,
              Itempic: pic,
              Itemprice: price,
              added: added,
              liked: liked);
        });
  }
}

class items extends StatelessWidget {
  String Itemname;
  String Itempic;
  String Itemprice;
  bool added;
  bool liked;
  items(
      {required this.Itemname,
      required this.Itempic,
      required this.Itemprice,
      required this.added,
      required this.liked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => productPage(
                  itemName: Itemname,
                  itemPic: Itempic,
                  itemPrice: Itemprice.toString(),
                  added: added,
                  liked: liked,
                )));
      },
      child: Card(
          child: Material(
              child: Container(
        //  alignment: Alignment.bottomRight,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    Itempic,
                    fit: BoxFit.cover,
                    height: 105,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  children: <Widget>[
                    Text(
                      Itemname,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '₹$Itemprice',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  favItems.favs.removeWhere(
                      (element) => element['item']['name'] == Itemname);
                },
                icon: const Icon(
                  Icons.delete,
                ),
                color: Colors.red,
              )
            ],
          ),
        ),
      ))),
    );
  }
}
