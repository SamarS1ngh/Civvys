// ignore_for_file: camel_case_types
import 'package:CIVVYS/Pages/productPages/productpage.dart';
import 'package:flutter/material.dart';

class topPicks extends StatelessWidget {
  // ignore: non_constant_identifier_names
  var product_list = [
    {
      "name": "Aot Tshirt",
      "picture": "images/products/aot tshirt.jpg",
      "price": '599'
    },
    {
      "name": "Bakugo Tshirt MHA",
      "picture": "images/products/bakugo tshirt.jpg",
      "price": '599'
    },
    {
      "name": "Black Hoodie",
      "picture": "images/products/black hoodie.jpg",
      "price": '700'
    },
    {
      "name": "Black Leather Jacket",
      "picture": "images/products/black leather jacket.jpg",
      "price": '11000'
    },
    {
      "name": "Black Shirt",
      "picture": "images/products/black shirt.jpg",
      "price": '1300'
    },
    {
      "name": "Dabi Tshirt MHA",
      "picture": "images/products/dabi tshirt.png",
      "price": '599'
    },
    {
      "name": "Karasuno High Tshirt Haikyuu",
      "picture": "images/products/karasuno tshirt.jpg",
      "price": '499'
    },
    {
      "name": "Maroon half Shirt",
      "picture": "images/products/maroon shirt half.jpg",
      "price": '1100'
    },
    {
      "name": "Marvel Hoodie",
      "picture": "images/products/marvel hoodie.png",
      "price": '700'
    },
    {
      "name": "Men Shacket",
      "picture": "images/products/men shacket.jpeg",
      "price": '12000'
    },
    {
      "name": "White Hoodie",
      "picture": "images/products/white hoodie.jpg",
      "price": '1000'
    },
    {
      "name": "Women Printed Sweatshirt",
      "picture": "images/products/white women sweatshirt.jpg",
      "price": '400'
    },
    {
      "name": "BTS Hoodie",
      "picture": "images/products/women hoodie.jpg",
      "price": '100'
    },
    {
      "name": "Olive Shirt Women",
      "picture": "images/products/women olive shirt.jpg",
      "price": '1700'
    },
    {
      "name": "Shacket long Women",
      "picture": "images/products/women shacket long.jpg",
      "price": '15000'
    },
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
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => productPage(
                  itemName: prod_name,
                  picUrl: prod_image,
                  price: prod_price,
                )));
      },
      child: Card(
          child: Material(
              child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              Flexible(
                child: Container(
                  // width: 200,
                  child: Column(
                    children: <Widget>[
                      Text(
                        prod_name,
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
                        '₹$prod_price',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ))),
    );
  }
}
