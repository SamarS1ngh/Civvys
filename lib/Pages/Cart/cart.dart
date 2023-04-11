import 'package:CIVVYS/Pages/Cart/cartProd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
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
      'amount': 230 * 100,
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
            centerTitle: true,
            title: const Text("Cart", style: TextStyle(color: Colors.black)),
            // actions: [
            //   IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            // ],
            backgroundColor: Colors.white,
          ),
        ),
        body: cartProducts(),
        bottomNavigationBar: Row(
          children: [
            const Expanded(
                child: ListTile(
              title: Text(
                'Total',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                '₹230',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            )),
            Expanded(
                child: Container(
              color: Colors.black,
              child: TextButton(
                  onPressed: () {
                    openCheckout();
                  },
                  child: const Text(
                    'Check Out',
                    style: TextStyle(color: Colors.white),
                  )),
            ))
          ],
        ),
      ),
    );
  }
}
