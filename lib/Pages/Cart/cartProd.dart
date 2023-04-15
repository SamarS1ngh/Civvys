import 'package:flutter/material.dart';

import '../productPages/productpage.dart';

class cartProducts extends StatefulWidget {
  static List<Map<String, dynamic>> cartItems = [];
  ValueNotifier<int> cartlength =
      ValueNotifier<int>(cartProducts.cartItems.length);
  @override
  State<cartProducts> createState() => _cartProductsState();
}

class _cartProductsState extends State<cartProducts> {
  //int? length;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cartProducts.cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          var name = cartProducts.cartItems[index]['item']['name'];
          var pic = cartProducts.cartItems[index]['item']['pic'];
          var price = cartProducts.cartItems[index]['item']['price'];
          bool added = cartProducts.cartItems[index]['item']['added'];
          bool liked = cartProducts.cartItems[index]['item']['liked'];
          return cartlist(
            cart_prod_name: name,
            cart_prod_pic: pic,
            cart_prod_price: price,
            added: added,
            liked: liked,
          );
        });
    // return SingleChildScrollView(
    //   child: Column(
    //     children: cartProducts.cartItems.map((e) {

    //     }).toList(),
    //   ),
    // );
  }
}

class cartlist extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_pic;
  final cart_prod_price;
  bool added;
  bool liked;
  cartlist(
      {required this.cart_prod_name,
      required this.cart_prod_pic,
      required this.cart_prod_price,
      required this.added,
      required this.liked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => productPage(
                  itemName: cart_prod_name,
                  itemPic: cart_prod_pic,
                  itemPrice: cart_prod_price.toString(),
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
                    cart_prod_pic,
                    fit: BoxFit.cover,
                    height: 105,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  children: <Widget>[
                    Text(
                      cart_prod_name,
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
                      '₹$cart_prod_price',
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
                  cartProducts.cartItems.removeWhere(
                      (element) => element['item']['name'] == cart_prod_name);
                  cartProducts().cartlength.value =
                      cartProducts.cartItems.length;
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
