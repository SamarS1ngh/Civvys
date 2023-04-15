import 'package:CIVVYS/Pages/Cart/cartProd.dart';
import 'package:CIVVYS/Pages/HomePage/topPicks.dart';
import 'package:CIVVYS/Pages/Cart/cart.dart';
import 'package:CIVVYS/Pages/productPages/productpage.dart';
import 'package:flutter/material.dart';

class cat extends StatefulWidget {
  String? catId;
  String title;

  cat({
    required this.catId,
    required this.title,
  });

  @override
  State<cat> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<cat> {
  final TextEditingController _search = TextEditingController();

  List<Map<String, dynamic>> results = [];
  @override
  void initState() {
    super.initState();
    results = topPicks.product_list;
  }

  void handleresult(String value) {
    List<Map<String, dynamic>> temp = [];
    if (value.isEmpty) {
      temp = topPicks.product_list;
    } else {
      temp = topPicks.product_list
          .where((element) =>
              element['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      results = temp;
    });
  }

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
              title: Text(widget.title,
                  style: const TextStyle(color: Colors.black)),
              backgroundColor: Colors.white,
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const cart();
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
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              //   child: Container(
              //     width: 150,
              //     height: 40,
              //     decoration: BoxDecoration(
              //         color: Colors.grey[100],
              //         borderRadius: BorderRadius.circular(15)),
              //     child: TextFormField(
              //       style: const TextStyle(fontSize: 14),
              //       autocorrect: true,
              //       controller: _search,
              //       enableSuggestions: true,
              //       cursorColor: Colors.black,
              //       decoration: InputDecoration(
              //           //prefixIcon: Icon(Icons.search),
              //           suffixIcon: Container(
              //             color: Colors.white70,
              //             child: IconButton(
              //                 splashRadius: 25,
              //                 onPressed: () {
              //                   FocusScope.of(context).unfocus();
              //                 },
              //                 icon: const Icon(
              //                   Icons.search,
              //                   color: Colors.black,
              //                 )),
              //           ),
              //           hintText: 'Search...',
              //           contentPadding:
              //               const EdgeInsets.fromLTRB(20, 12, 12, 12),
              //           isDense: true,
              //           enabledBorder: const OutlineInputBorder(
              //               borderSide: BorderSide(color: Colors.transparent)),
              //           focusedBorder: const OutlineInputBorder(
              //               borderSide: BorderSide(color: Colors.transparent))),
              //     ),
              //   ),
              // ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
                child: Text('Find Your Style',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
              SingleChildScrollView(
                child: Column(
                  children: topPicks.product_list
                      .where((element) => element['id'].contains(widget.catId))
                      .map((e) {
                    return singleProduct(
                      prod_name: e['name'],
                      prod_image: e['picture'],
                      prod_price: e['price'],
                      prod_added_in_cart: e['added'],
                      prod_liked: e['liked'],
                    );
                  }).toList(),
                ),
              )
            ],
          )),
    );
  }
}

class singleProduct extends StatefulWidget {
  // final id;
  final prod_name;
  final prod_image;
  final prod_price;
  bool prod_added_in_cart;
  bool prod_liked;

  singleProduct(
      {this.prod_name,
      this.prod_image,
      this.prod_price,
      required this.prod_added_in_cart,
      required this.prod_liked});

  @override
  State<singleProduct> createState() => _singleProductState();
}

class _singleProductState extends State<singleProduct> {
  bool add = false;
  bool check() {
    bool exist = false;
    for (var i in cartProducts.cartItems) {
      if (i['item']['name'] == widget.prod_name) {
        exist = true;
      }
    }
    return exist;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => productPage(
                  itemName: widget.prod_name,
                  itemPic: widget.prod_image,
                  itemPrice: widget.prod_price,
                  added: widget.prod_added_in_cart,
                  liked: widget.prod_liked,
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
                    widget.prod_image,
                    fit: BoxFit.cover,
                    height: 105,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.prod_name,
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
                      '₹${widget.prod_price}',
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
                            onTap: () {
                              if (!check()) {
                                cartProducts.cartItems.add({
                                  'item': {
                                    'name': widget.prod_name,
                                    'pic': widget.prod_image,
                                    'price': widget.prod_price,
                                    'added': true,
                                    'liked': false
                                  }
                                });
                              }
                            },
                            child: Text(
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
