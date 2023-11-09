import 'package:assignmenttwo/screens/menuscreen/models/product.dart';
import 'package:assignmenttwo/screens/menuscreen/providers/checkout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/card_provider.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    final Product product;
    final checkoutprovider =  CardCheckoutProvider.of(context); 
    final provider = CardProvider.of(context);
    final cardItem = provider.cart;

    buildProductQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQuantity(index)
                : provider.decrementprovider(index);
          });
        },
        child: Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Icon(
            icon,
            size: 20,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Card Details'),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: cardItem.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      cardItem[index].name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      cardItem[index].description,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(cardItem[index].images),
                      backgroundColor: Colors.white,
                    ),
                    trailing: Column(children: [
                      buildProductQuantity(Icons.add, index),
                      Text(
                        cardItem[index].quantity.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      buildProductQuantity(Icons.remove, index)
                    ]),
                  ),
                );
              }),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          width: double.infinity,
          height: 100,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'PKR ' '${provider.getTotal()}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () => {
             // checkoutprovider.toggeleProduct(pro),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>const OrderDetails()),
                ),
            },
            icon: const Icon(Icons.send),
            label: const Text("Check out know"),
          )
          ]),
        )
      ]),
    );
  }
}
