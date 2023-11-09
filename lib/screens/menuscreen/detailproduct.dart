import 'package:assignmenttwo/screens/menuscreen/models/product.dart';
import 'package:assignmenttwo/screens/menuscreen/orderdetails.dart';
import 'package:provider/provider.dart';
import 'providers/card_provider.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = CardProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white),
              child: Image.asset(product.images, fit: BoxFit.cover),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          height: 200,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name.toLowerCase(),
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  'PKR ' '${product.price}',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(product.description, style: const TextStyle(fontSize: 16))
          ]),
        ),
      ]),
      bottomSheet: BottomAppBar(
          child: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 10,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'PKR ' '${product.price}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () => {
              cart.toggeleProduct(product),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>const OrderDetails()),
                ),
            },
            icon: const Icon(Icons.send),
            label: const Text("Add to Card"),
          )
        ]),
      )),
    );
  }
}
