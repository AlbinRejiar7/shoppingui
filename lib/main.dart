// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, constant_identifier_names

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/detail_page.dart';
import 'package:ecommerce/providerclass.dart';
import 'package:ecommerce/widgets/add_to_cart.dart';
import 'package:ecommerce/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ExerciseFilter {
  All,
  Man,
  Women,
  Kids,
  Fashion,
}

Set<ExerciseFilter> filters = <ExerciseFilter>{};
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Itemcounter(),
      child: MaterialApp(
        title: 'Discover',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Discover'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var itemcounter = Provider.of<Itemcounter>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddToCart(),
                ));
              },
              icon: Icon(Icons.shopping_cart))
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search Anything',
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ),
                Expanded(
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                ),
              ],
            ),
            Wrap(
              spacing: 5.0,
              children: ExerciseFilter.values.map((ExerciseFilter exercise) {
                return FilterChip(
                  label: Text(exercise.name),
                  selected: filters.contains(exercise),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        filters.add(exercise);
                      } else {
                        filters.remove(exercise);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: Myimage.myimage.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyImageContainer(
                    onTap: () {
                      itemcounter.globalindex = index;
                      itemcounter.finalprice = Myimage.myprice[index];
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MydetailPage(
                          index: index,
                        ),
                      ));
                    },
                    price: Myimage.myprice[index].toString(),
                    imagestring: Myimage.myimage[index],
                    imageNames: Myimage.myshirtnames[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          BottomNavigationBar(type: BottomNavigationBarType.fixed, items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'saved',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'settings',
        )
      ]),
    );
  }
}
