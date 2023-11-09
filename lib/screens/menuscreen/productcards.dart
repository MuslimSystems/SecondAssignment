import 'package:assignmenttwo/screens/menuscreen/models/product.dart';
import 'package:assignmenttwo/screens/menuscreen/providers/favorite_provider.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.withOpacity(0.1)),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => provider.toggleFavorites(widget.product),
              child: Icon(
                provider.isExist(widget.product)
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              widget.product.images,
              fit: BoxFit.cover,
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
              title: Center(
            child: Text(widget.product.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          )),
        ),
        Text(
          'PKR ' '${widget.product.price}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
