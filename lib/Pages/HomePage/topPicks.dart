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
      "price": '599',
      'added': false,
      'liked': false
    },
    {
      "id": ['Men', 'Kids', 'Teens', 'Summer Wear'],
      "name": "Bakugo Tshirt MHA",
      "picture": "images/products/bakugo tshirt.jpg",
      "price": '599',
      'added': false,
      'liked': false
    },
    {
      "id": ['Men', 'Teens', 'Winter Wear', 'Sports Wear'],
      "name": "Black Hoodie",
      "picture": "images/products/black hoodie.jpg",
      "price": '700',
      'added': false,
      'liked': false
    },
    {
      "id": ['Men', 'Winter Wear'],
      "name": "Black Leather Jacket",
      "picture": "images/products/black leather jacket.jpg",
      "price": '11000',
      'added': false,
      'liked': false
    },
    {
      "id": ['Men', 'Teens', 'Winter Wear', 'Summer Wear'],
      "name": "Black Shirt",
      "picture": "images/products/black shirt.jpg",
      "price": '1300',
      'added': false,
      'liked': false
    },
    {
      "id": ['Men', 'Kids', 'Teens', 'Winter Wear', 'Summer Wear', 'Women'],
      "name": "Dabi Tshirt MHA",
      "picture": "images/products/dabi tshirt.png",
      "price": '599',
      'added': false,
      'liked': false
    },
    {
      "id": ['Men', 'Teens', 'Summer Wear', 'Sports Wear'],
      "name": "Karasuno High Tshirt Haikyuu",
      "picture": "images/products/karasuno tshirt.jpg",
      "price": '499',
      'added': false,
      'liked': false
    },
    {
      "id": ['Men', 'Teens', 'Summer Wear'],
      "name": "Maroon half Shirt",
      "picture": "images/products/maroon shirt half.jpg",
      "price": '1100',
      'added': false,
      'liked': false
    },
    {
      "id": ['Men', 'Kids', 'Teens', 'Winter Wear'],
      "name": "Marvel Hoodie",
      "picture": "images/products/marvel hoodie.png",
      "price": '700',
      'added': false,
      'liked': false
    },
    {
      "id": ['Men', 'Teens', 'Winter Wear'],
      "name": "Men Shacket",
      "picture": "images/products/men shacket.jpeg",
      "price": '12000',
      'added': false,
      'liked': false
    },
    {
      "id": [
        'Men',
        'Teens',
        'Winter Wear',
      ],
      "name": "White Hoodie",
      "picture": "images/products/white hoodie.jpg",
      "price": '1000',
      'added': false,
      'liked': false
    },
    {
      "id": ['Teens', 'Winter Wear', 'Women'],
      "name": "Women Printed Sweatshirt",
      "picture": "images/products/white women sweatshirt.jpg",
      "price": '400',
      'added': false,
      'liked': false
    },
    {
      "id": ['Teens', 'Winter Wear', 'Women'],
      "name": "BTS Hoodie",
      "picture": "images/products/women hoodie.jpg",
      "price": '100',
      'added': false,
      'liked': false
    },
    {
      "id": ['Teens', 'Winter Wear', 'Summer Wear', 'Women'],
      "name": "Olive Shirt Women",
      "picture": "images/products/women olive shirt.jpg",
      "price": '1700',
      'added': false,
      'liked': false
    },
    {
      "id": ['Teens', 'Winter Wear', 'Women'],
      "name": "Shacket long Women",
      "picture": "images/products/women shacket long.jpg",
      "price": '15000',
      'added': false,
      'liked': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: product_list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 8),
        itemBuilder: (BuildContext context, index) {
          return singleProduct(
            singleprodname: product_list[index]['name'],
            singleprodprice: product_list[index]['price'],
            singleprodimage: product_list[index]['picture'],
            prodincart: product_list[index]['added'],
            prodliked: product_list[index]['liked'],
          );
        });
  }
}

class singleProduct extends StatefulWidget {
  final singleprodname;
  final singleprodimage;
  final singleprodprice;
  bool prodincart;
  bool prodliked;
  singleProduct(
      {required this.singleprodname,
      required this.singleprodimage,
      required this.singleprodprice,
      required this.prodincart,
      required this.prodliked});

  @override
  State<singleProduct> createState() => _singleProductState();
}

class _singleProductState extends State<singleProduct> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return productPage(
            itemName: widget.singleprodname,
            itemPrice: widget.singleprodprice,
            itemPic: widget.singleprodimage,
            added: widget.prodincart,
            liked: widget.prodliked,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),

            // border: Border(
            //     top: BorderSide(color: Colors.black12),
            //     left: BorderSide(color: Colors.black12),
            //     right: BorderSide(color: Colors.black12))
          ),
          child: Column(
            children: [
              Expanded(child: Image.asset(widget.singleprodimage)),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[100]),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Text(
                          widget.singleprodname,
                          overflow: TextOverflow.ellipsis,
                          //textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '₹${widget.singleprodprice}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.orange),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
