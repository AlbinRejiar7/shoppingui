// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/providerclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MycontainerCart extends StatelessWidget {
  final int index;
  const MycontainerCart({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var itemcounter = Provider.of<Itemcounter>(context);
    return Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.pink[200], borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.white,
                child: Image(
                    image: NetworkImage(
                        itemcounter.addeditems[index][0].toString())),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<Itemcounter>(
                  builder: (context, myModel, child) {
                    return Text(
                      myModel.addeditems[index][1].toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    );
                  },
                ),
                Consumer<Itemcounter>(
                  builder: (context, myModel, child) {
                    return Text(
                      'Quantinty ${myModel.addeditems[index][2].toString()}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    );
                  },
                ),
              ],
            ),
            Consumer<Itemcounter>(
              builder: (context, myModel, child) {
                return Text(
                  'Price ${myModel.addeditems[index][3].toString()}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                Text(
                  'Edit',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            )
          ],
        ));
  }
}
