import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class topPicks extends StatelessWidget {
  var product_list = [
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
    {"name": "Item 1", "picture": "listtileimages/kids.jpg", "price": 100},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: product_list.map((e) {
          return singleProduct(
            prod_name: e['name'],
            prod_image: e['picture'],
            prod_price: e['price'],
          );
        }).toList(),
      ),
    );
  }
}

class singleProduct extends StatelessWidget {
  final prod_name;
  final prod_image;
  final prod_price;

  singleProduct({this.prod_name, this.prod_image, this.prod_price});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
          child: Material(
              child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                prod_image,
                fit: BoxFit.cover,
                height: 105,
              ),
            ),
          ),
          Container(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  prod_name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Want Something Peasant?",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Then fucking buy it u imbecile!",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          )
        ],
      ))),
    );
  }
}
