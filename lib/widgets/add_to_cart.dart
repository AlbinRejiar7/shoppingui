// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/providerclass.dart';
import 'package:ecommerce/widgets/addedcartcontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({
    super.key,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    var itemcounter = Provider.of<Itemcounter>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Add to cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 15,
          ),
          itemCount: itemcounter.addeditems.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(itemcounter.addeditems[index][1]),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors
                    .red, // Red background color when swiping end-to-start
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                itemcounter.addeditems.removeAt(index);
              },
              child: GestureDetector(
                onTap: () {
                  itemcounter.counter = itemcounter.addeditems[index][2];
                  itemcounter.finalprice = itemcounter.addeditems[index][3];
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  itemcounter.decrementCounter();
                                  itemcounter.decrementingprice(
                                      Myimage.myprice[itemcounter.globalindex]);
                                },
                                icon: Icon(Icons.remove)),
                            ElevatedButton.icon(
                                onPressed: () {
                                  itemcounter.addeditems[index][2] =
                                      itemcounter.counter;
                                  itemcounter.addeditems[index][3] =
                                      itemcounter.finalprice;

                                  Navigator.of(context).pop();
                                  setState(() {});
                                },
                                icon: Icon(Icons.save),
                                label: Text('save')),
                            IconButton(
                                onPressed: () {
                                  itemcounter.incrementCounter();
                                  itemcounter.incrementingprice(
                                      Myimage.myprice[itemcounter.globalindex]);
                                },
                                icon: Icon(Icons.add)),
                          ],
                        )
                      ],
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Edit Here',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          Consumer<Itemcounter>(
                            builder: (context, myModel, child) {
                              return Text(
                                ' Quantity ${itemcounter.counter.toString()}',
                                style: TextStyle(fontSize: 20),
                              );
                            },
                          ),
                          Consumer<Itemcounter>(
                            builder: (context, myModel, child) {
                              return Text(
                                ' price ${itemcounter.finalprice.toString()}',
                                style: TextStyle(fontSize: 20),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: MycontainerCart(
                  index: index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
