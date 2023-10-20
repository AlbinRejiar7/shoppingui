// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyImageContainer extends StatelessWidget {
  final void Function()? onTap;
  final String imagestring;
  final String imageNames;
  final String price;
  const MyImageContainer(
      {super.key,
      required this.imagestring,
      required this.imageNames,
      required this.price,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(imagestring))),
                child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Wrap(
              children: [
                Row(
                  children: [
                    Text(
                      'Regular $imageNames',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'price $price rs/-',
                      style:
                          TextStyle(color: const Color.fromARGB(137, 0, 0, 0)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
