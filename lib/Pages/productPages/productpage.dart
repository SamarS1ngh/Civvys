import 'package:CIVVYS/Auth/login.dart';
import 'package:CIVVYS/Pages/Cart/cartProd.dart';
import 'package:CIVVYS/Pages/HomePage/topPicks.dart';
import 'package:CIVVYS/Pages/productPages/similarprods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../Auth/firebase.dart';

class productPage extends StatefulWidget {
  String itemName;
  String itemPrice;
  String itemPic;

  productPage(
      {required this.itemName, required this.itemPrice, required this.itemPic});

  @override
  State<productPage> createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  final Razorpay _razorpay = Razorpay();
  // String productName = '';
  // String productPrice = '';
  // String productPic = '';
  @override
  void initState() {
    super.initState();
    getData();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // String productName = widget.itemName;
    // String productPrice = widget.price;
    // String productPic = widget.picUrl;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_606fU3NK63EjbH',
      'amount': int.parse(widget.itemPrice) * i * 100,
      'name': FirebaseAuth.instance.currentUser?.displayName,
      'description': 'Payment',
      'prefill': {
        'contact': '123456789',
        'email': FirebaseAuth.instance.currentUser?.email
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    showDialog(
        context: context,
        builder: (Context) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Okay'))
            ],
            title: Text("SUCCESS!"),
            content: Text(
                'PaymentID: ${response.paymentId} ${response.orderId} ${response.signature}'),
          );
        });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    showDialog(
        context: context,
        builder: (Context) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Okay'))
            ],
            title: Text("FAILED!"),
            content:
                Text('Code: ${response.code} -Message : ${response.message}'),
          );
        });
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    showDialog(
        context: context,
        builder: (Context) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Okay'))
            ],
            title: Text("External Wallet"),
            content: Text('Wallet Name: ${response.walletName}'),
          );
        });
  }

  int i = 1;
  bool liked = false;
  String name = '';
  String size = 'Size';
  String color = 'Color';
  String? fit;
  String? _color;

  void getData() async {
    Map data = (await DatabaseService()
        .getUser(FirebaseAuth.instance.currentUser?.uid));
    setState(() {
      name = data['Name'];
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
              title: Text("Hey $name!",
                  style: const TextStyle(color: Colors.black)),
              backgroundColor: Colors.white,
            )),
        bottomNavigationBar: Container(
          //color: Colors.black,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    children: [
                      const Text(
                        'Total: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      Text(
                        '₹${int.parse(widget.itemPrice) * i}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.black,
                child: TextButton(
                    onPressed: () {
                      openCheckout();
                    },
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(color: Colors.white),
                    )),
              ))
            ],
          ),
        ),
        body: ListView(physics: const BouncingScrollPhysics(), children: [
          Column(
            children: [
              Container(
                height: 300,
                child: Image.asset(widget.itemPic),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                  child: Text(
                    widget.itemName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 23),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 35, 0),
                    child: Text(
                      '₹${int.parse(widget.itemPrice)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  // color: Colors.amber,
                  // width: 5,
                  child: Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Done'))
                                    ],
                                    title: const Text('Choose Size'),
                                    content: Column(
                                      children: [
                                        RadioListTile(
                                            title: const Text('S'),
                                            value: 'S',
                                            groupValue: fit,
                                            onChanged: (value) {
                                              setState(() {
                                                fit = value.toString();
                                                size = value.toString();
                                              });
                                            }),
                                        RadioListTile(
                                            title: const Text('M'),
                                            value: 'M',
                                            groupValue: fit,
                                            onChanged: (value) {
                                              setState(() {
                                                fit = value.toString();
                                                size = value.toString();
                                              });
                                            }),
                                        RadioListTile(
                                            title: const Text('L'),
                                            value: 'L',
                                            groupValue: fit,
                                            onChanged: (value) {
                                              setState(() {
                                                fit = value.toString();
                                                size = value.toString();
                                              });
                                            }),
                                        RadioListTile(
                                            title: const Text('XL'),
                                            value: 'XL',
                                            groupValue: fit,
                                            onChanged: (value) {
                                              setState(() {
                                                fit = value.toString();
                                                size = value.toString();
                                              });
                                            }),
                                        RadioListTile(
                                            title: const Text('XXL'),
                                            value: 'XXL',
                                            groupValue: fit,
                                            onChanged: (value) {
                                              setState(() {
                                                fit = value.toString();
                                                size = value.toString();
                                              });
                                            }),
                                        RadioListTile(
                                            title: const Text(
                                              'I\'m so fat they are gonna make yo mama jokes on my kids',
                                            ),
                                            value:
                                                'I\'m so fat they are gonna make yo mama jokes on my kids',
                                            groupValue: fit,
                                            onChanged: (value) {
                                              setState(() {
                                                fit = value.toString();
                                                size = 'Huge';
                                              });
                                            }),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Row(
                            children: [
                              Text(
                                '$size ',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black54,
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Done'))
                                    ],
                                    title: const Text('Choose Color'),
                                    content: Column(
                                      children: [
                                        RadioListTile(
                                          title: Text('Black'),
                                          value: 'Black',
                                          groupValue: _color,
                                          onChanged: (value) {
                                            setState(() {
                                              color = value.toString();
                                              _color = value.toString();
                                            });
                                          },
                                        ),
                                        RadioListTile(
                                          title: Text('Blue'),
                                          value: 'Blue',
                                          groupValue: _color,
                                          onChanged: (value) {
                                            setState(() {
                                              color = value.toString();
                                              _color = value.toString();
                                            });
                                          },
                                        ),
                                        RadioListTile(
                                          title: Text('Green'),
                                          value: 'Green',
                                          groupValue: _color,
                                          onChanged: (value) {
                                            setState(() {
                                              color = value.toString();
                                              _color = value.toString();
                                            });
                                          },
                                        ),
                                        RadioListTile(
                                          title: Text('Red'),
                                          value: 'Red',
                                          groupValue: _color,
                                          onChanged: (value) {
                                            setState(() {
                                              color = value.toString();
                                              _color = value.toString();
                                            });
                                          },
                                        ),
                                        RadioListTile(
                                          title: Text('White'),
                                          value: 'White',
                                          groupValue: _color,
                                          onChanged: (value) {
                                            setState(() {
                                              color = value.toString();
                                              _color = value.toString();
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Row(
                            children: [
                              Text(
                                '$color',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black54,
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Qty: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (i > 1) --i;
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  size: 18,
                                )),
                            Text('$i'),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    ++i;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 18,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Product Name',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Flexible(
                            child: Text(
                              widget.itemName,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            'Product Brand',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Flexible(
                            child: Text(
                              'Brand X',
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            'Product Status',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Flexible(
                            child: Text(
                              'Available',
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const ListTile(
                title: Text('Product Details'),
                subtitle: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 8, 20),
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 280,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 80),
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 40,
                        // width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),

                          //color: Colors.orange
                        ),
                        child: IconButton(
                            splashRadius: 25,
                            onPressed: () {
                              setState(() {
                                liked = !liked;
                              });
                            },
                            icon: Icon(
                              !liked
                                  ? Icons.favorite_border_outlined
                                  : Icons.favorite,
                              color: !liked ? Colors.black : Colors.red,
                              size: 30,
                            )))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  'Similar products',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: SimilarProds(
                  prodName: widget.itemName,
                  picUrl: widget.itemPic,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
