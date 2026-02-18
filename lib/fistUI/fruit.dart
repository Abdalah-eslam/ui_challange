import 'package:flutter/material.dart';
import 'package:ui_challange/fistUI/fruit_details.dart';

class Fruit extends StatefulWidget {
  const Fruit({super.key});

  @override
  State<Fruit> createState() => _FruitState();
}

class _FruitState extends State<Fruit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Fruit"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu, color: Colors.black),
        actions: <Widget>[
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 15),
          Stack(
            children: [
              Icon(Icons.shopping_cart, color: Colors.black),
              Positioned(
                top: 0,
                right: 3,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text("1", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(6, fruitsUI),
        ),
      ),
    );
  }

  Container fruitsUI(int index) {
    List<String> itemNames = [
      'Spinach',
      'Avacado',
      'Sweet Corn',
      'Kiwi',
      'Orange',
      'Apple',
    ];
    List<double> itemPrice = [1.22, 3.62, 4.92, 8.30, 3.5, 4.2];
    List<String> itemQuantity = [
      '1 lbs',
      'each',
      'each',
      '3 Nos',
      '3 Nos',
      '2 Nos',
    ];
    var newnum = index + 1;
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showFruitDDetail(
                newnum,
                itemPrice[index].toString(),
                itemNames[index],
                itemQuantity[index],
              );
              print(newnum);
            },
            child: Hero(
              tag: 'img$newnum',
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img$newnum.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),

          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              itemNames[index],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "\$${itemPrice[index]} / ${itemQuantity[index]}",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Divider(thickness: 2, color: Colors.grey.shade300),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                SizedBox(height: 40),
                Icon(Icons.shopping_cart, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showFruitDDetail(int id, String price, String name, String quantity) {
    Navigator.pushNamed(
      context,
      "/fruit_details",
      arguments: {"id": id, "price": price, "name": name, "quantity": quantity},
    );
  }
}
