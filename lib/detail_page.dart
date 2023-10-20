// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/providerclass.dart';
import 'package:ecommerce/widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MydetailPage extends StatelessWidget {
  final int index;

  const MydetailPage({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var itemcounter = Provider.of<Itemcounter>(context);
    double initialprice = Myimage.myprice[index];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              itemcounter.counter = 1;
              itemcounter.finalprice = 0;
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_outlined)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(Myimage.myimage[index]))),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    size: 60,
                    Icons.favorite,
                    color: Colors.white,
                  ),
                )),
            Text(
              'Regular ${Myimage.myshirtnames[index]}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Quantity',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  itemcounter.counter.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.pink),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${itemcounter.finalprice.toString()} RS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.pink),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              itemcounter.decrementCounter();
              itemcounter.decrementingprice(initialprice);
            },
            tooltip: 'decrement',
            child: const Icon(Icons.remove),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              itemcounter.incrementCounter();
              itemcounter.incrementingprice(initialprice);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          ElevatedButton.icon(
            onPressed: () {
              itemcounter.addeditems.add([
                Myimage.myimage[index],
                Myimage.myshirtnames[index],
                itemcounter.counter,
                itemcounter.finalprice,
              ]);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddToCart(),
              ));
            },
            icon: Icon(Icons.shopping_cart_checkout),
            label: Text('ADD TO CART'),
          )
        ],
      ),
    );
  }
}
