// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:CIVVYS/Pages/productPages/men.dart';
import 'package:flutter/material.dart';

class horizontal_List extends StatelessWidget {
  const horizontal_List({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: const <Widget>[
          Style(
              image_location: 'listtileimages/men.jpeg', image_caption: 'Men'),
          Style(
              image_location: 'listtileimages/women.jpeg',
              image_caption: 'Women'),
          Style(
              image_location: 'listtileimages/kids.jpg', image_caption: 'Kids'),
          Style(
              image_location: 'listtileimages/toddlers.jpeg',
              image_caption: 'Toddlers'),
          Style(
              image_location: 'listtileimages/teens.jpg',
              image_caption: 'Teens'),
          Style(
              image_location: 'listtileimages/sportswear.jpg',
              image_caption: 'Sports Wear'),
          Style(
              image_location: 'listtileimages/winterwear.jpeg',
              image_caption: 'Winter Collection'),
          Style(
              image_location: 'listtileimages/springwear.JPG',
              image_caption: 'Summer Collection')
        ],
      ),
    );
  }
}

class Style extends StatelessWidget {
  final String image_location;
  final String image_caption;

  const Style({required this.image_location, required this.image_caption});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeLeft: true,
      removeRight: true,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            Men();
          },
          child: Container(
            width: 170,
            height: 100,
            child: Stack(children: <Widget>[
              Container(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                // width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.4,
                    image_location,
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.saturation,
                    color: Colors.green),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [
                          Color.fromARGB(190, 0, 0, 0),
                          Colors.transparent
                        ],
                        stops: [
                          0,
                          0.8
                        ])),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 15),
                child: Text(
                  image_caption,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
