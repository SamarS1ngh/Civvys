import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

class carousel extends StatefulWidget {
  const carousel({super.key});

  @override
  State<carousel> createState() => _carouselState();
}

class _carouselState extends State<carousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
            height: 200,
            enableInfiniteScroll: true,
            viewportFraction: 0.8,
            aspectRatio: 16 / 9,
            initialPage: 0,
            autoPlay: true,
            autoPlayInterval: Duration(milliseconds: 8000),
            autoPlayAnimationDuration: Duration(milliseconds: 3000),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal),
        items: [1, 2, 3, 4, 5].map((e) {
          return Builder(builder: (BuildContext context) {
            return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("images/image$e.jpg"),
                        fit: BoxFit.fitHeight)));
          });
        }).toList());
  }
}
