// ignore_for_file: camel_case_types
import 'package:CIVVYS/Pages/productPages/productpage.dart';
import 'package:flutter/material.dart';

class topPicks extends StatelessWidget {
  // ignore: non_constant_identifier_names
  static List<Map<String, dynamic>> product_list = [
    {
      "id": ['Men', 'Women', 'Kids', 'Teens', 'Winter Wear', 'Summer Wear'],
      "name": "Aot Tshirt",
      "picture": "images/products/aot tshirt.jpg",
      "price": '599'
    },
    {
      "id": ['Men', 'Women', 'Kids', 'Teens', 'Summer Wear'],
      "name": "Bakugo Tshirt MHA",
      "picture": "images/products/bakugo tshirt.jpg",
      "price": '599'
    },
    {
      "id": ['Men', 'Teens', 'Winter Wear', 'Sports Wear'],
      "name": "Black Hoodie",
      "picture": "images/products/black hoodie.jpg",
      "price": '700'
    },
    {
      "id": ['Men', 'Winter Wear'],
      "name": "Black Leather Jacket",
      "picture": "images/products/black leather jacket.jpg",
      "price": '11000'
    },
    {
      "id": ['Men', 'Teens', 'Winter Wear', 'Summer Wear'],
      "name": "Black Shirt",
      "picture": "images/products/black shirt.jpg",
      "price": '1300'
    },
    {
      "id": ['Men', 'Kids', 'Teens', 'Winter Wear', 'Summer Wear', 'Women'],
      "name": "Dabi Tshirt MHA",
      "picture": "images/products/dabi tshirt.png",
      "price": '599'
    },
    {
      "id": ['Men', 'Teens', 'Summer Wear', 'Sports Wear'],
      "name": "Karasuno High Tshirt Haikyuu",
      "picture": "images/products/karasuno tshirt.jpg",
      "price": '499'
    },
    {
      "id": ['Men', 'Teens', 'Summer Wear'],
      "name": "Maroon half Shirt",
      "picture": "images/products/maroon shirt half.jpg",
      "price": '1100'
    },
    {
      "id": ['Men', 'Kids', 'Teens', 'Winter Wear'],
      "name": "Marvel Hoodie",
      "picture": "images/products/marvel hoodie.png",
      "price": '700'
    },
    {
      "id": ['Men', 'Teens', 'Winter Wear'],
      "name": "Men Shacket",
      "picture": "images/products/men shacket.jpeg",
      "price": '12000'
    },
    {
      "id": ['Men', 'Teens', 'Winter Wear', 'Women'],
      "name": "White Hoodie",
      "picture": "images/products/white hoodie.jpg",
      "price": '1000'
    },
    {
      "id": ['Teens', 'Winter Wear', 'Women'],
      "name": "Women Printed Sweatshirt",
      "picture": "images/products/white women sweatshirt.jpg",
      "price": '400'
    },
    {
      "id": ['Teens', 'Winter Wear', 'Women'],
      "name": "BTS Hoodie",
      "picture": "images/products/women hoodie.jpg",
      "price": '100'
    },
    {
      "id": ['Teens', 'Winter Wear', 'Summer Wear', 'Women'],
      "name": "Olive Shirt Women",
      "picture": "images/products/women olive shirt.jpg",
      "price": '1700'
    },
    {
      "id": ['Teens', 'Winter Wear', 'Women'],
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
            // id: e['id'],
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
  // final id;
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
                  itemPic: prod_image,
                  itemPrice: prod_price,
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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
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
              const SizedBox(
                width: 40,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 100,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Row(
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
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ))),
    );
  }
}
