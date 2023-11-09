import 'package:assignmenttwo/screens/menuscreen/detailproduct.dart';
import 'package:assignmenttwo/screens/menuscreen/models/myproduct.dart';
import 'package:assignmenttwo/screens/menuscreen/orderdetails.dart';
import 'package:assignmenttwo/screens/menuscreen/productcards.dart';
import 'package:flutter/material.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Page"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () =>{
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context)=> const OrderDetails())
            )
          }, icon: const Icon(Icons.add_shopping_cart))
        ],
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (100 / 140),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          scrollDirection: Axis.vertical,
          itemCount: MyProduct.allProducts.length,
          itemBuilder: (context, index) {
            final allProducts = MyProduct.allProducts[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>DetailScreen(product: allProducts),
                ), 
              ),
              child: ProductCard(product: allProducts),
            );
          },
        ),
      ),
    );
  }
}
