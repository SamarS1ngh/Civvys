import 'package:CIVVYS/Pages/productPages/productpage.dart';
import 'package:flutter/material.dart';

class SimilarProds extends StatelessWidget {
  // SimilarProds({super.key});
  List<Map<String, dynamic>> product_list = [
    {
      "name": "Aot Tshirt",
      "picture": "images/products/aot tshirt.jpg",
      "price": "599",
      "added": false,
      "liked": false
    },
    {
      "name": "Bakugo Tshirt MHA",
      "picture": "images/products/bakugo tshirt.jpg",
      "price": "599",
      "added": false,
      "liked": false
    },
    {
      "name": "Black Hoodie",
      "picture": "images/products/black hoodie.jpg",
      "price": "700",
      "added": false,
      "liked": false
    },
    {
      "name": "Black Leather Jacket",
      "picture": "images/products/black leather jacket.jpg",
      "price": "11000",
      "added": false,
      "liked": false
    },
    {
      "name": "Black Shirt",
      "picture": "images/products/black shirt.jpg",
      "price": "1300",
      "added": false,
      "liked": false
    },
    {
      "name": "Dabi Tshirt MHA",
      "picture": "images/products/dabi tshirt.png",
      "price": "599",
      "added": false,
      "liked": false
    },
    {
      "name": "Maroon half Shirt",
      "picture": "images/products/maroon shirt half.jpg",
      "price": "1100",
      "added": false,
      "liked": false
    },
    {
      "name": "Men Shacket",
      "picture": "images/products/men shacket.jpeg",
      "price": "12000",
      "added": false,
      "liked": false
    },
    {
      "name": "White Hoodie",
      "picture": "images/products/white hoodie.jpg",
      "price": "1000",
      "added": false,
      "liked": false
    },
    {
      "name": "Women Printed Sweatshirt",
      "picture": "images/products/white women sweatshirt.jpg",
      "price": "400",
      "added": false,
      "liked": false
    },
    {
      "name": "BTS Hoodie",
      "picture": "images/products/women hoodie.jpg",
      "price": "100",
      "added": false,
      "liked": false
    },
    {
      "name": "Olive Shirt Women",
      "picture": "images/products/women olive shirt.jpg",
      "price": "1700",
      "added": false,
      "liked": false
    },
    {
      "name": "Shacket long Women",
      "picture": "images/products/women shacket long.jpg",
      "price": "15000",
      "added": false,
      "liked": false
    },
  ];
  SimilarProds({required String prodName, required String picUrl});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: product_list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10),
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return productPage(
                  itemName: product_list[index]['name'],
                  itemPrice: product_list[index]['price'],
                  itemPic: product_list[index]['picture'],
                  added: product_list[index]['added'],
                  liked: product_list[index]['liked'],
                );
              }));
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.black12),
                          left: BorderSide(color: Colors.black12),
                          right: BorderSide(color: Colors.black12))),
                  child: Column(
                    children: [
                      Expanded(
                          child: Image.asset(product_list[index]['picture']!)),
                      Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.black),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: Text(
                                  product_list[index]['name']!,
                                  overflow: TextOverflow.ellipsis,
                                  //textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '₹${product_list[index]['price']}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
