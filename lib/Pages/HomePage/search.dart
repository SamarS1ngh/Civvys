import 'package:CIVVYS/Pages/HomePage/topPicks.dart';
import 'package:flutter/material.dart';

import '../productPages/productpage.dart';

class searchpage extends StatefulWidget {
  const searchpage({super.key});

  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  final TextEditingController _search = TextEditingController();
  bool visible = false;

  List<Map<String, dynamic>> results = [];

  @override
  void initState() {
    super.initState();
    results = topPicks.product_list;
  }

  void handleresults(String keyword) {
    List<Map<String, dynamic>> templist = [];
    if (keyword.isEmpty) {
      templist = topPicks.product_list;
    } else {
      templist = topPicks.product_list
          .where((element) =>
              element['name'].toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      results = templist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: AppBar(
                leading: const BackButton(color: Colors.black),

                //centerTitle: true,
                title: TextFormField(
                  onChanged: (value) => handleresults(value),
                  onTap: () {
                    setState(() {
                      visible = true;
                    });
                  },
                  style: const TextStyle(fontSize: 17),
                  autocorrect: true,
                  controller: _search,
                  enableSuggestions: true,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                      ),
                      suffixIcon: visible
                          ? Container(
                              color: Colors.white,
                              child: IconButton(
                                splashRadius: 25,
                                onPressed: () {
                                  //  FocusScope.of(context).unfocus();
                                  _search.clear();
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.black,
                                ),
                                splashColor: Colors.white,
                              ),
                            )
                          : null,
                      hintText: 'Search...',
                      contentPadding: const EdgeInsets.fromLTRB(20, 12, 12, 12),
                      isDense: true,
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      // borderRadius: BorderRadius.circular(15)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
                backgroundColor: Colors.white,
              )),
          body: results.isEmpty
              ? Center(
                  child: Text("No results found"),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: results.length,
                  itemBuilder: (BuildContext context, index) {
                    var name = results[index]['name'];
                    var image = results[index]['picture'];
                    var price = results[index]['price'];
                    var added = results[index]['added'];
                    var liked = results[index]['liked'];
                    return searchbody(
                      prod_name: name,
                      prod_image: image,
                      prod_price: price,
                      prod_added_in_cart: added,
                      prod_liked: liked,
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class searchbody extends StatelessWidget {
  String prod_name;
  String prod_price;
  String prod_image;
  bool prod_added_in_cart;
  bool prod_liked;

  searchbody({
    required this.prod_name,
    required this.prod_image,
    required this.prod_price,
    required this.prod_added_in_cart,
    required this.prod_liked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => productPage(
                  itemName: prod_name,
                  itemPic: prod_image,
                  itemPrice: prod_price,
                  added: prod_added_in_cart,
                  liked: prod_liked,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
            child: Material(
                child: Container(
          //  alignment: Alignment.bottomRight,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
                        style: const TextStyle(
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
      ),
    );
  }
}
