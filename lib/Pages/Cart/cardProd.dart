import 'package:flutter/material.dart';

class cardProducts extends StatefulWidget {
  const cardProducts({super.key});

  @override
  State<cardProducts> createState() => _cardProductsState();
}

class _cardProductsState extends State<cardProducts> {
  int q = 1;
  bool increase = false;
  void qty() {
    if (increase) {
      setState(() {
        ++q;
      });
    } else {
      if (q > 1)
        setState(() {
          --q;
        });
    }
  }

  var cart_product_list = [
    {
      "name": "Aot Tshirt",
      "picture": "images/products/aot tshirt.jpg",
      "price": "₹599",
      "size": "M",
      "color": "White",
      "Qty": 3
    },
    {
      "name": "Bakugo Tshirt MHA",
      "picture": "images/products/bakugo tshirt.jpg",
      "price": "₹599",
      "size": "M",
      "color": "Blue",
      "Qty": 3
    },
    {
      "name": "Black Shirt",
      "picture": "images/products/black shirt.jpg",
      "price": "₹1300",
      "size": "M",
      "color": "Black",
      "Qty": 3
    },
    {
      "name": "Dabi Tshirt MHA",
      "picture": "images/products/dabi tshirt.png",
      "price": "₹599",
      "size": "M",
      "color": "Red",
      "Qty": 3
    },
    {
      "name": "Men Shacket",
      "picture": "images/products/men shacket.jpeg",
      "price": "₹12000",
      "size": "M",
      "color": "Green",
      "Qty": 3
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: cart_product_list.length,
        itemBuilder: (context, index) {
          return SingleCartProd(
              cartprodname: cart_product_list[index]['name'],
              cartprodprice: cart_product_list[index]['price'],
              cartprodpic: cart_product_list[index]['picture'],
              cartprodsize: cart_product_list[index]['size'],
              cartprodcolor: cart_product_list[index]['color'],
              cartprodqty: cart_product_list[index]['qty']);
        });
  }
}

class SingleCartProd extends StatelessWidget {
  final cartprodname;
  final cartprodprice;
  final cartprodpic;
  final cartprodsize;
  final cartprodcolor;
  final cartprodqty;
  SingleCartProd({
    required this.cartprodname,
    required this.cartprodprice,
    required this.cartprodpic,
    required this.cartprodsize,
    required this.cartprodcolor,
    required this.cartprodqty,
  });
  int q = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Flexible(
        child: Row(children: [
          Container(
              width: 80,
              height: 120,
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Image.asset(cartprodpic)),
          Container(
            // color: Colors.amber,
            width: MediaQuery.of(context).size.width * .60,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        cartprodname,
                        //  textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                    ],
                  ),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 24, 0),
                      child: Row(
                        children: [
                          Text('Size: '),
                          Text(
                            cartprodsize,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.orange),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text('Color: '),
                        Text(
                          cartprodcolor,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Text('Qty: '),
                    //     Text(
                    //       '$cartprodqty',
                    //       overflow: TextOverflow.ellipsis,
                    //       style: TextStyle(
                    //           color: Colors.orange,
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 14),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        cartprodprice,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Column(
          //   children: [
          //     IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_up)),
          //     Text('1'),
          //     IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_down)),
          //   ],
          // )
        ]),
      ),
    );
  }
}
