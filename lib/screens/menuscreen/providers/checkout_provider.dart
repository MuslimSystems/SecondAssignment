import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class CardCheckoutProvider extends ChangeNotifier{
  final List<Product> _cardCheckout = [];
  List<Product> get cardCheckout => _cardCheckout;

  void toggeleProduct(Product product){
    notifyListeners();
  }
 
  getTotal(){
    double total = 0.0;
    for(Product element in _cardCheckout){
      total += element.price * element.quantity;
    }
    return total;
  }
  static CardCheckoutProvider of(
    BuildContext context,{
      bool listen = true,
    })
    {
      return Provider.of<CardCheckoutProvider>(
        context,
        listen: listen,
      );
    }
}